function test_issue1780

% WALLTIME 00:10:00
% MEM 1gb
% DEPENDENCY read_neuralynx_ds read_neuralynx_nsc
% DATA private

dataset1 = dccnpath('/project/3031000.02/test/original/lfp/neuralynx/issue1780');            % this includes 2 channels
dataset2 = dccnpath('/project/3031000.02/test/original/lfp/neuralynx/issue1780/CSC01.ncs');  % this is only 1 channel

%%

cfg = [];
cfg.dataset = dataset1;
data1 = ft_preprocessing(cfg);

cfg = [];
cfg.dataset = dataset2;
data2 = ft_preprocessing(cfg);

% they should have the same sampling rate
assert(data1.fsample == 2034.75);
assert(data2.fsample == 2034.75);
