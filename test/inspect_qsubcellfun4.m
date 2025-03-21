function inspect_qsubcellfun4

% WALLTIME 00:10:00
% MEM 1gb
% DEPENDENCY
% DATA private

% this test is designed for executing functions that are private to the function in which qsubcellfun is called
% see http://bugzilla.fieldtriptoolbox.org/show_bug.cgi?id=1891

[ftver, ftpath] = ft_version;

% clean up the path, only qsub and somepath
restoredefaultpath
addpath(fullfile(ftpath, 'qsub'));

addpath(dccnpath('/project/3031000.02/test/bug1891/somepath'));

a1a = mainfunction({3, 4, 5}, 'qsubcellfun');
a1b = mainfunction({3, 4, 5}, 'qsubcellfun_nostack');
a2  = mainfunction({3, 4, 5}, 'cellfun'    );

assert(isequal(a1a, a2));
assert(isequal(a1b, a2));
