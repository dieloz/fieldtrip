function test_bug1027

% MEM 1gb
% WALLTIME 00:10:00
% DEPENDENCY ft_artifact_zvalue
% DATA private

% the original bug was that ft_artifact_zvalue could not deal with variable
% length trials

cd(dccnpath('/project/3031000.02/test'));
load bug1027.mat

cfg = [];
cfg.artfctdef.zvalue.channel = {'EOG061'};
cfg.artfctdef.zvalue.cutoff  = 4;
cfg.artfctdef.zvalue.interactive = 'no';
ft_artifact_zvalue(cfg, data);
