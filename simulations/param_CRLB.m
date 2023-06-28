% Federal University of Rio Grande do Norte
% Title: param_TDOA
% Author: Danilo Pena
% Description: TDOA

%% Parameters
algorithms = ["CRLB"];
type_of_data = "zadoff-chu";
angles = [20];
number_of_sensors = 2;
distance_between_sensors = 0.05;
source_frequency = [1000];
sampling_frequency = 200000;
number_of_samples = 353; %139
number_of_iterations = 100;
speed_propagation = 340;
number_of_snapshots = 1;
noise{1}.model = "gaussian real";
noise{1}.snr = -20:40;
deviation_of_angle = 6;
