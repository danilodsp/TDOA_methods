
% Federal University of Rio Grande do Norte
% Title: param_SRP
% Author: Danilo Pena
% Description: SRP-PHAT analysis

%% Parameters
algorithms = ["GCC-PHAT" "SRP-PHAT"];
type_of_data = "demo-gong";
angles = [20];
number_of_sensors = 2;
distance_between_sensors = 0.2427;
source_frequency = [1000];
sampling_frequency = 8192;
number_of_samples = 1000; %139
number_of_iterations = 100;
speed_propagation = 340;
number_of_snapshots = 1;
noise{1}.model = "gaussian real";
noise{1}.snr = -20:40;
channel{1}.model = "reverberation";
channel{1}.D = 0.1;
deviation_of_angle = 6;
