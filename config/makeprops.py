#!/usr/bin/env python3

#
# Copyright (c) ZeroC, Inc.
#

import os
import sys
import shutil
import signal

from enum import StrEnum, auto
from typing import override

from xml.sax import make_parser
from xml.sax.handler import feature_namespaces
from xml.sax.handler import ContentHandler


class Language(StrEnum):
    ALL = auto()
    CPP = auto()
    JAVA = auto()
    CSHARP = auto()
    JS = auto()


commonPreamble = """\
// Copyright (c) ZeroC, Inc.

// Generated by makeprops.py from PropertyNames.xml

// IMPORTANT: Do not edit this file -- any edits made here will be lost!
"""


class PropertyArray:
    def __init__(self, name: str, prefixOnly: bool, isClass: bool, isOptIn: bool):
        self.name = name
        self.prefixOnly = prefixOnly
        self.isOptIn = isOptIn
        self.isClass = isClass
        self.properties = []

    def addProperty(self, property):
        self.properties.append(property)


class PropertyHandler(ContentHandler):
    def __init__(self, language):
        # The language we are generating properties for
        self.language = language
        # The section section we are currently parsing
        self.parentNodeName = None
        # Dictionary of section names to attr dicts
        self.propertyArrayDict: dict[str, PropertyArray] = dict()

    def cleanup(self):
        # Needs to be overridden in derived class
        pass

    def openFiles(self):
        # Needs to be overridden in derived class
        pass

    def closeFiles(self):
        # Needs to be overridden in derived class
        pass

    def createProperty(
        self,
        propertyName,
        usesRegex,
        defaultValue,
        deprecated,
        propertyArrayName,
    ):
        # Needs to be overridden in derived class
        pass

    def writePropertyArray(self, propertyArray: PropertyArray):
        # Needs to be overridden in derived class
        pass

    def writeProperties(self):
        self.openFiles()

        for propertyArray in self.propertyArrayDict.values():
            self.writePropertyArray(propertyArray)

        self.closeFiles()

    def moveFiles(self, location):
        # Needs to be overridden in derived class
        pass

    # The list of property arrays to get generated
    def generatedPropertyArrays(self):
        return [
            name
            for name, propertyArray in self.propertyArrayDict.items()
            if not propertyArray.isClass
        ]

    def reservedPropertyPrefixes(self):
        return [
            name for name, array in self.propertyArrayDict.items() if not array.isClass
        ]

    def parseProperty(self, attrs):
        name = attrs.get("name")
        usesRegex = "[any]" in name
        deprecated = attrs.get("deprecated", "false").lower() == "true"
        defaultValue = attrs.get("default", None)
        propertyArrayName = attrs.get("class", None)

        if propertyArrayName and defaultValue:
            print(
                sys.stderr,
                f"Property '{name}' cannot have both a class and a default value",
            )

        if propertyArrayName and usesRegex:
            print(
                sys.stderr,
                f"Property '{name}' cannot have both a class and use a regex",
            )

        return self.createProperty(
            name,
            usesRegex,
            defaultValue or "",
            deprecated,
            propertyArrayName,
        )

    def validateKnownAttributes(self, validAttrs, attrs):
        if "name" not in attrs:
            print(sys.stderr, "missing name attribute")

        for a in attrs.keys():
            if a not in validAttrs:
                print(sys.stderr, "invalid attribute '%s'" % a)

    def validateLanguages(self, attrs):
        languageAttr = attrs.get("languages", None)
        # If no language attribute is specified issue a warning and skip code generation for this element
        if languageAttr is None:
            print(
                sys.stderr,
                "missing languages attribute in property element %s"
                % attrs.get("name"),
            )
            return False

        # languages="cpp,java" -> ["cpp", "java"]
        languages = [lang.strip() for lang in languageAttr.split(",")]
        for lang in languages:
            if lang not in [lang.value for lang in Language]:
                print(
                    sys.stderr,
                    "invalid language '%s' in property element %s"
                    % (lang, attrs.get("name")),
                )
                return False

        # All should be by itself. Issue a warning but continue generation for this element.
        if Language.ALL in languages and len(languages) > 1:
            print(
                sys.stderr,
                "Invalid languages attribute in property element: %s. 'all' must be specified alone."
                % attrs.get("name"),
            )

        # True if the current language is in the list of languages or if the list contains 'all'
        return Language.ALL in languages or self.language in languages

    @override
    def startElement(self, name, attrs):
        match name:
            case "properties":
                pass
            case "class":
                name = f"{attrs.get("name")}"
                prefixOnly = attrs.get("prefix-only", "false").lower() == "true"

                self.validateKnownAttributes(["name", "prefix-only"], attrs)
                self.parentNodeName = name
                self.propertyArrayDict[name] = PropertyArray(
                    name=name,
                    prefixOnly=prefixOnly,
                    isClass=True,
                    isOptIn=False,
                )
            case "section":
                isOptIn = attrs.get("opt-in", "false").lower() == "true"
                name = attrs.get("name")

                self.validateKnownAttributes(["name", "opt-in"], attrs)
                self.parentNodeName = name
                self.propertyArrayDict[self.parentNodeName] = PropertyArray(
                    name=name,
                    prefixOnly=False,
                    isClass=False,
                    isOptIn=isOptIn,
                )

            case "property":
                self.validateKnownAttributes(
                    ["name", "class", "default", "deprecated", "languages"], attrs
                )

                if self.validateLanguages(attrs) is False:
                    return

                property = self.parseProperty(attrs)

                self.propertyArrayDict[self.parentNodeName].addProperty(property)
            case _:
                raise ValueError(f"Unknown element: {name}")

    @override
    def endElement(self, name):
        if name == "section" or name == "class":
            self.parentNodeName = None


class CppPropertyHandler(PropertyHandler):
    def __init__(self):
        super().__init__(Language.CPP)
        self.hFile = None
        self.cppFile = None

    @override
    def cleanup(self):
        if self.hFile is not None:
            self.hFile.close()
            if os.path.exists("PropertyNames.h"):
                os.remove("PropertyNames.h")
        if self.cppFile is not None:
            self.cppFile.close()
            if os.path.exists("PropertyNames.cpp"):
                os.remove("PropertyNames.cpp")

    @override
    def openFiles(self):
        self.hFile = open("PropertyNames.h", "w")
        self.cppFile = open("PropertyNames.cpp", "w")
        self.hFile.write(f"""\
{commonPreamble}
#ifndef ICE_INTERNAL_PROPERTY_NAMES_H
#define ICE_INTERNAL_PROPERTY_NAMES_H

#include "Ice/Config.h"

#include <array>
#include <string>

namespace IceInternal
{{
    struct PropertyArray;
    struct Property
    {{
        const char* pattern;
        const char* defaultValue;
        const bool usesRegex;
        const bool deprecated;
        const PropertyArray* propertyArray;

    }};

    struct PropertyArray
    {{
        const char* name;
        const bool prefixOnly;
        const Property* properties;
        const int length;
        const bool isOptIn;
    }};

    class PropertyNames
    {{
    public:
""")
        self.cppFile.write(f"""
{commonPreamble}
#include "PropertyNames.h"

using namespace IceInternal;

""")

    @override
    def closeFiles(self):
        self.hFile.write(f"""
        static const std::array<PropertyArray, {len(self.generatedPropertyArrays())}> validProps;
    }};
}}

#endif
""")

        self.cppFile.write(f"""\
const std::array<PropertyArray, {len(self.generatedPropertyArrays())}> PropertyNames::validProps =
{{
    {",\n    ".join([f"{name}Props" for name in self.generatedPropertyArrays()])}
}};
""")

        self.hFile.close()
        self.cppFile.close()

    def fix(self, propertyName):
        return propertyName.replace("[any]", "*")

    @override
    def writePropertyArray(self, propertyArray):
        name = propertyArray.name
        prefixOnly = "true" if propertyArray.prefixOnly else "false"
        isOptIn = "true" if propertyArray.isOptIn else "false"
        self.hFile.write(f"        static const PropertyArray {name}Props;\n")

        self.cppFile.write(f"""\
const Property {name}PropsData[] =
{{
    {",\n    ".join(propertyArray.properties)}
}};

const PropertyArray PropertyNames::{name}Props
{{
    .name="{name}",
    .prefixOnly={prefixOnly},
    .properties={name}PropsData,
    .length={len(propertyArray.properties)},
    .isOptIn={isOptIn}
}};

""")

    @override
    def createProperty(
        self, propertyName, usesRegex, defaultValue, deprecated, propertyArray
    ):
        propertyLine = 'Property{{"{pattern}", {defaultValue}, {usesRegex}, {deprecated}, {propertyArray}}}'.format(
            pattern=self.fix(propertyName) if usesRegex else propertyName,
            defaultValue=f'"{defaultValue}"',
            usesRegex="true" if usesRegex else "false",
            deprecated="true" if deprecated else "false",
            propertyArray=f"&PropertyNames::{propertyArray}Props"
            if propertyArray
            else "nullptr",
        )

        return propertyLine

    @override
    def moveFiles(self, location):
        dest = os.path.join(location, "cpp", "src", "Ice")
        if os.path.exists(os.path.join(dest, "PropertyNames.h")):
            os.remove(os.path.join(dest, "PropertyNames.h"))
        if os.path.exists(os.path.join(dest, "PropertyNames.cpp")):
            os.remove(os.path.join(dest, "PropertyNames.cpp"))
        shutil.move("PropertyNames.h", dest)
        shutil.move("PropertyNames.cpp", dest)


class JavaPropertyHandler(PropertyHandler):
    def __init__(self):
        super().__init__(Language.JAVA)
        self.srcFile = None

    @override
    def cleanup(self):
        if self.srcFile is not None:
            self.srcFile.close()
            if os.path.exists("PropertyNames.java"):
                os.remove("PropertyNames.java")

    @override
    def openFiles(self):
        self.srcFile = open("PropertyNames.java", "w")
        self.srcFile.write(f"""\
{commonPreamble}
package com.zeroc.Ice;

final class PropertyNames
{{
""")

    @override
    def closeFiles(self):
        self.srcFile.write(f"""\
    public static final PropertyArray validProps[] =
    {{
        {",\n        ".join([f"{name}Props" for name in self.generatedPropertyArrays()])}
    }};
}}
""")
        self.srcFile.close()

    def fix(self, propertyName):
        #
        # The Java property strings are actually regexp's that will be passed to Java's regexp facility.
        #
        return propertyName.replace(".", r"\\.").replace("[any]", r"[^\\s]+")

    @override
    def writePropertyArray(self, propertyArray):
        name = propertyArray.name
        prefixOnly = "true" if propertyArray.prefixOnly else "false"
        properties = (
            "\n            " + ",\n            ".join(propertyArray.properties)
            if propertyArray.properties
            else ""
        )

        self.srcFile.write(
            f"""    public static final PropertyArray {name}Props = new PropertyArray(
        "{name}",
        {prefixOnly},
        new Property[] {{{properties}
        }});

"""
        )

    @override
    def createProperty(
        self,
        propertyName,
        usesRegex,
        defaultValue,
        deprecated,
        propertyArray,
    ):
        line = 'new Property("{pattern}", {usesRegex}, {defaultValue}, {deprecated}, {propertyArray})'.format(
            pattern=self.fix(propertyName) if usesRegex else propertyName,
            usesRegex="true" if usesRegex else "false",
            defaultValue=f'"{defaultValue}"',
            deprecated="true" if deprecated else "false",
            propertyArray=f"PropertyNames.{propertyArray}Props"
            if propertyArray
            else "null",
        )

        return line

    @override
    def moveFiles(self, location):
        dest = os.path.join(
            location,
            "java",
            "src",
            "Ice",
            "src",
            "main",
            "java",
            "com",
            "zeroc",
            "Ice",
        )
        if os.path.exists(os.path.join(dest, "PropertyNames.java")):
            os.remove(os.path.join(dest, "PropertyNames.java"))
        shutil.move("PropertyNames.java", dest)


class CSPropertyHandler(PropertyHandler):
    def __init__(self):
        super().__init__(Language.CSHARP)
        self.srcFile = None

    @override
    def cleanup(self):
        if self.srcFile is not None:
            self.srcFile.close()
            if os.path.exists("PropertyNames.cs"):
                os.remove("PropertyNames.cs")

    @override
    def openFiles(self):
        self.srcFile = open("PropertyNames.cs", "w")
        self.srcFile.write(f"""\
{commonPreamble}
namespace Ice.Internal;

internal sealed class PropertyNames
{{
""")

    @override
    def closeFiles(self):
        self.srcFile.write(f"""\
    internal static PropertyArray[] validProps =
    [
        {",\n        ".join([f"{name}Props" for name in self.generatedPropertyArrays()])}
    ];
}}
""")
        self.srcFile.close()

    def fix(self, propertyName):
        return propertyName.replace(".", r"\.").replace("[any]", r"[^\s]+")

    @override
    def writePropertyArray(self, propertyArray):
        name = propertyArray.name
        prefixOnly = "true" if propertyArray.prefixOnly else "false"
        properties = (
            f"\n            {",\n            ".join(propertyArray.properties)}\n        "
            if propertyArray.properties
            else ""
        )

        self.srcFile.write(f"""\
    internal static PropertyArray {name}Props = new(
        "{name}",
        {prefixOnly},
        [{properties}]);

""")

    @override
    def createProperty(
        self,
        propertyName,
        usesRegex,
        defaultValue,
        deprecated,
        propertyArray,
    ):
        line = 'new(pattern: @"{pattern}", usesRegex: {usesRegex}, defaultValue: {defaultValue}, deprecated: {deprecated}, propertyArray: {propertyArray})'.format(
            pattern=f"^{self.fix(propertyName)}$" if usesRegex else propertyName,
            usesRegex="true" if usesRegex else "false",
            defaultValue=f'"{defaultValue}"',
            deprecated="true" if deprecated else "false",
            propertyArray=f"{propertyArray}Props" if propertyArray else "null",
        )
        return line

    @override
    def moveFiles(self, location):
        dest = os.path.join(location, "csharp", "src", "Ice", "Internal")
        if os.path.exists(os.path.join(dest, "PropertyNames.cs")):
            os.remove(os.path.join(dest, "PropertyNames.cs"))
        shutil.move("PropertyNames.cs", dest)


class JSPropertyHandler(PropertyHandler):
    def __init__(self):
        super().__init__(Language.JS)
        self.srcFile = None

    @override
    def cleanup(self):
        if self.srcFile is not None:
            self.srcFile.close()
            if os.path.exists("PropertyNames.js"):
                os.remove("PropertyNames.js")

    @override
    def openFiles(self):
        self.srcFile = open("PropertyNames.js", "w")
        self.srcFile.write(f"""
{commonPreamble}
import {{ Property, PropertyArray }} from "./Property.js";
export const PropertyNames = {{}};

""")

    @override
    def closeFiles(self):
        self.srcFile.write(f"""\
PropertyNames.validProps = [
{",\n".join([f'    PropertyNames.{name}Props' for name in self.generatedPropertyArrays()])},
];
""")
        self.srcFile.close()

    def fix(self, propertyName):
        return propertyName.replace(".", "\\.").replace("[any]", ".")

    @override
    def writePropertyArray(self, propertyArray):
        name = propertyArray.name
        prefixOnly = "true" if propertyArray.prefixOnly else "false"
        properties = (
            "\n    " + ",\n    ".join(propertyArray.properties)
            if propertyArray.properties
            else ""
        )
        # We assign the properties to the property array after creating it so that we can reference the array
        # in the properties themselves
        self.srcFile.write(f"""\
PropertyNames.{name}Props = new PropertyArray("{name}", {prefixOnly});
PropertyNames.{name}Props.properties = [{properties}
];

""")

    @override
    def createProperty(
        self,
        propertyName,
        usesRegex,
        defaultValue,
        deprecated,
        propertyArray,
    ):
        line = "new Property({pattern}, {usesRegex}, {defaultValue}, {deprecated}, {propertyArray})".format(
            pattern=f"/^{self.fix(propertyName)}/"
            if usesRegex
            else f'"{propertyName}"',
            usesRegex="true" if usesRegex else "false",
            defaultValue=f'"{defaultValue}"',
            deprecated="true" if deprecated else "false",
            propertyArray=f"PropertyNames.{propertyArray}Props"
            if propertyArray
            else "null",
        )
        return line

    @override
    def moveFiles(self, location):
        dest = os.path.join(location, "js", "src", "Ice")
        if os.path.exists(os.path.join(dest, "PropertyNames.js")):
            os.remove(os.path.join(dest, "PropertyNames.js"))
        shutil.move("PropertyNames.js", dest)


class MultiHandler(ContentHandler):
    def __init__(self, handlers):
        self.handlers = handlers
        super().__init__()

    @override
    def startElement(self, name, attrs):
        for f in self.handlers:
            f.startElement(name, attrs)

    def cleanup(self):
        for f in self.handlers:
            f.cleanup()

    def moveFiles(self, location):
        for f in self.handlers:
            f.moveFiles(location)

    def writeProperties(self):
        for f in self.handlers:
            f.writeProperties()


def main():
    if len(sys.argv) != 1 and len(sys.argv) != 3:
        print(sys.stderr, "makeprops.py does not take any arguments")
        sys.exit(1)

    # Find the top-level directory of the Ice repository
    topLevel = os.popen("git rev-parse --show-toplevel").read().strip()
    propsFile = os.path.join(topLevel, "config", "PropertyNames.xml")

    if not os.path.exists(propsFile):
        print(
            sys.stderr,
            "Cannot find top-level directory. Please run this script from the Ice repository.",
        )
        sys.exit(1)

    contentHandler = MultiHandler(
        [
            CppPropertyHandler(),
            JavaPropertyHandler(),
            CSPropertyHandler(),
            JSPropertyHandler(),
        ]
    )

    # Ignore all signals. This script should not take long to run
    signal.signal(signal.SIGINT, signal.SIG_IGN)
    signal.signal(signal.SIGTERM, signal.SIG_IGN)

    parser = make_parser()
    parser.setFeature(feature_namespaces, 0)
    parser.setContentHandler(contentHandler)
    propsFileBuffer = open(propsFile)
    try:
        parser.parse(propsFileBuffer)
        contentHandler.writeProperties()
        contentHandler.moveFiles(topLevel)
    except Exception as ex:
        print(sys.stderr, str(ex))
        contentHandler.cleanup()
        sys.exit(1)


if __name__ == "__main__":
    main()
