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
number_of_samples = [50 100 150 200 250 300 350 400 450 500];
number_of_iterations = 10000;
speed_propagation = 340;
number_of_snapshots = 1;
noise{1}.model = "gaussian real";
noise{1}.snr = 3;
channel{1}.model = "none";
deviation_of_angle = 6;
