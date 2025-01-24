# Copyright (c) ZeroC, Inc.

$(project)_libraries                            += Glacier2CryptPermissionsVerifier

Glacier2CryptPermissionsVerifier_targetdir        := $(libdir)
Glacier2CryptPermissionsVerifier_dependencies     := Glacier2 Ice
Glacier2CryptPermissionsVerifier_cppflags         := -DCRYPT_PERMISSIONS_VERIFIER_API_EXPORTS $(api_exports_cppflags)
Glacier2CryptPermissionsVerifier_devinstall       := no

projects += $(project)
