% Federal University of Rio Grande do Norte
% Author: Danilo Pena
% Title: Selection Data
% Description: Selection of signal for synthetic or real data
% Parameters:
% type: 'real' or 'simulated' data
% - varargin -
% 

function [data] = check_data(type_of_data, output_name, varargin)

%if (nargin > 13), error('parameters number incorrect.');, end

% FIXIT: defaultN attributed before of inputParser
defaultN = 200;
% FIXIT: defaultSnapshots attributed before of inputParser
defaultSnapshots = 200;
defaultU = 340; % speed sound propagation (~340 m/s)
defaultNoise{1}.model = 'deterministic';
defaultChannel{1}.model = 'none';

%defaultSNR = 0;
%defaultAlpha = 1.7;
%defaultGSNR = 0;
%defaultMeans = [0 0];
%defaultVariances = [0.01 1];

inputs = inputParser;
addRequired(inputs, 'type_of_data');
addRequired(inputs, 'output_name');
addRequired(inputs, 'angles');
addRequired(inputs, 'number_of_sensors');
addRequired(inputs, 'distance_between_sensors');
addRequired(inputs, 'source_frequency');
addRequired(inputs, 'sampling_frequency');
addOptional(inputs, 'number_of_samples', defaultN, @isnumeric);
addOptional(inputs, 'speed_propagation', defaultU, @isnumeric);
addOptional(inputs, 'length_snapshots', defaultSnapshots);
addParameter(inputs, 'noise', defaultNoise);
addParameter(inputs, 'channel', defaultChannel);

parse(inputs, type_of_data, output_name, varargin{:});

%% Checking data

% TODO: Check if dimensions of noises are equals
% length(noise{1}.snr)==length(noise{2}.gsnr)

% TODO: Check if analysis (output) has a vector input appropriate

%% Checking the output

output_name = inputs.Results.output_name;

%if exist(strcat("../results/", output_name, "/results.mat"), 'file') == 2 %Initial step, 2 (file), 7 (folder)
%    error('The output name already exist, please choose another name.');
%end

i=1;
if exist(strcat("../results/", output_name, "/results.mat"), 'file') == 2
    while(exist(strcat("../results/", output_name, "_", num2str(i), "/results.mat"), 'file') == 2)
        i = i+1;
    end
    output_name = strcat(output_name, "_", num2str(i));
end

% if ~exist(strcat("../results/", output_name), 'dir') %Initial step, 2 (file), 7 (folder)
%     mkdir(char(strcat("../results/", output_name)));
% end

%% Creating structure for data

data.type_of_data = inputs.Results.type_of_data;
data.angles = inputs.Results.angles;
data.M = inputs.Results.number_of_sensors;
data.d = inputs.Results.distance_between_sensors;
data.f = inputs.Results.source_frequency;
data.fs = inputs.Results.sampling_frequency;
data.N = inputs.Results.number_of_samples;
data.u = inputs.Results.speed_propagation;
data.snapshots = inputs.Results.length_snapshots;
data.output_name = output_name;

% substruct
data.noise = inputs.Results.noise;
data.channel = inputs.Results.channel;

%% Checking conflicts

wavelength = data.u / data.f;
if (data.d > wavelength)
    error('Distance between sensors should be shorter than wavelength');
end

end
