function test_ft_denoise_synthetic

% MEM 1gb
% WALLTIME 00:10:00
% DEPENDENCY ft_denoise_synthetic
% DATA private

load(dccnpath('/project/3031000.02/test/latest/raw/meg/preproc_ctf151.mat'));

cfg = [];
cfg.gradient = 'G1BR';
data1 = ft_denoise_synthetic(cfg, data);
cfg.gradient = 'G2BR';
data2 = ft_denoise_synthetic(cfg, data);
cfg.gradient = 'G3BR';
data3 = ft_denoise_synthetic(cfg, data);

cfg2 = [];
cfg2.channel = 'MEG';
dataMEG = ft_preprocessing(cfg2, data);

try
  dataMEG3 = ft_denoise_synthetic(cfg, dataMEG);
catch ME
  % this should be correct
  if strcmp(ME.identifier, 'ft_denoise_synthetic:nohasref')
    fprintf('ft_denoise_synthetic crashes as expected when reference channel data is missing\n');
  end
end
