function test_bug2221

% MEM 1gb
% WALLTIME 00:15:00
% DEPENDENCY ft_selectdata ft_selectdata_new ft_multiplotER
% DATA private


% this test function intends to test the functionality of:
%  - ft_selectdata_new with respect to multiple input: does it correctly
%  identifies the intersection between the multiple input dimensions?
%  - ft_selectdata_new (new functionality): take a union rather than
%  intersection, this is to be built in as an optional switch
%  - ft_multiplotER: if input data contains not entirely overlapping time
%  axes, use selectdata for getting the union and plotting should then work

% as of september 2019, ft_selectdata_new/old have become obsolete, and the
% explicit call of ft_selectdata_new has been replaced by a call to
% ft_selectdata

% create some data first
freq1 = [];
freq1.label = {'chan01';'chan02'};
freq1.freq  = (1:10);
freq1.time  = (1:15);
freq1.powspctrm = randn(2,10,15);
freq1.dimord = 'chan_freq_time';

freq2 = freq1;
freq2.powspctrm = randn(2,8,12);
freq2.label = {'chan02';'chan03'};
freq2.freq  = (5:12);
freq2.time  = (3:14);

cfg                  = [];
cfg.select           = 'intersect';
[freq1out, freq2out] = ft_selectdata(cfg,freq1,freq2);
assert(isequal(rmfield(freq1out, {'cfg','powspctrm'}),rmfield(freq2out, {'cfg','powspctrm'})));

cfg.select        = 'union';
[freq1out, freq2out] = ft_selectdata(cfg,freq1,freq2);

%%%%%%%%%%%
filename = dccnpath('/project/3031000.02/test/bug2221.mat');
load(filename);

data1 = data_S10_cond1;
data2 = data_S10_cond2;
cfg = [];
cfg.select  = 'intersect';

[data1out, data2out] = ft_selectdata(cfg, data1, data2);

