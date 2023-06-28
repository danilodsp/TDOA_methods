% Federal University of Rio Grande do Norte
% Title: param_TDOA_GCC
% Author: Danilo Pena
% Description: TDOA with GCC methods

%% Parameters
algorithms = ["GCC-PHAT" "GCC-PHAT 8 bits" "GCC-PHAT 16 bits"];
type_of_data = "demo-gong";
angles = [20];
number_of_sensors = 2;
distance_between_sensors = 0.2427;
source_frequency = [1000];
sampling_frequency = 8192;
number_of_samples = 1000;
number_of_iterations = 2000;
speed_propagation = 340;
number_of_snapshots = 1;
noise{1}.model = "gaussian real";
noise{1}.snr = -20:40;
noise{2}.model = "alpha-stable real";
noise{2}.snr = -20:40;
noise{2}.alpha = 1.7;
channel{1}.model = "none";
deviation_of_angle = 6;
