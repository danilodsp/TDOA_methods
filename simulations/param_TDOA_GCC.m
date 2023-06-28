% Federal University of Rio Grande do Norte
% Title: param_TDOA_GCC
% Author: Danilo Pena
% Description: TDOA with GCC methods

%% Parameters
algorithms = ["GCC-PHAT" "GCC-ROTH" "GCC-SCOT" "GCC-Eckart" "GCC-ML" "GCC-MML" "SRP-PHAT"];
type_of_data = "demo-gong";
angles = [20];
number_of_sensors = 2;
distance_between_sensors = 0.2427;
source_frequency = [1000];
sampling_frequency = 8192;
number_of_samples = 1000;
number_of_iterations = 10000;
speed_propagation = 340;
number_of_snapshots = 1;
noise{1}.model = "gaussian real";
noise{1}.snr = -20:40;
noise{2}.model = "gaussian mixture real";
noise{2}.snr = -20:40;
noise{2}.rel = 100;
noise{3}.model = "gaussian mixture real";
noise{3}.snr = -20:40;
noise{3}.rel = 500;
noise{4}.model = "gaussian mixture real";
noise{4}.snr = -20:40;
noise{4}.rel = 1000;
noise{5}.model = "alpha-stable real";
noise{5}.snr = -20:40;
noise{5}.alpha = 1.1;
noise{6}.model = "alpha-stable real";
noise{6}.snr = -20:40;
noise{6}.alpha = 1.3;
noise{7}.model = "alpha-stable real";
noise{7}.snr = -20:40;
noise{7}.alpha = 1.5;
noise{8}.model = "alpha-stable real";
noise{8}.snr = -20:40;
noise{8}.alpha = 1.7;
noise{9}.model = "alpha-stable real";
noise{9}.snr = -20:40;
noise{9}.alpha = 1.9;
channel{1}.model = "none";
deviation_of_angle = 6;
