% Copyright (c) ZeroC, Inc.

function runTest(varargin)
    if length(varargin) == 0
        fprintf('testdir argument required\n');
        exit(1);
    end

    testdir = varargin{1};
    varargin(1) = []; % Removes first argument.
    libsubdir = varargin{1};
    varargin(1) = []; % Removes second argument

    rootDir = fileparts(mfilename('fullpath'));
    rootDir = fullfile(rootDir, '..', '..');
    addpath(fullfile(rootDir, 'lib'));
    addpath(fullfile(rootDir, 'lib', 'generated'));
    addpath(fullfile(libsubdir));
    addpath(fullfile(rootDir, 'test', 'lib'));

    cd(testdir);

    try
        Client(varargin);
        exit(0);
    catch ex
        disp(getReport(ex, 'extended'));
        exit(1);
    end
end
