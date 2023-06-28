% Federal University of Rio Grande do Norte
% Title: param_TDOA_samples_number_analysis
% Author: Danilo Pena
% Description: TDOA samples number analysis with all noise models

%% Parameters
algorithms = ["GCC-PHAT" "GCC-ROTH" "GCC-SCOT" "FLOS-PHAT 0.8" "FLOS-PHAT 0.5" "FLOS-PHAT 0.2" "NLT-PHAT"];
type_of_data = "zadoff-chu";
angles = [20];
number_of_sensors = 2;
distance_between_sensors = 0.05;
source_frequency = [1000];
sampling_frequency = 48000;
number_of_samples = [29 139 353 1019];
number_of_iterations = 10000;
speed_propagation = 340;
number_of_snapshots = 1;
noise{1}.model = "gaussian real";
noise{1}.snr = -20:40;
noise{2}.model = "gaussian mixture real";
noise{2}.snr = -20:40;
noise{2}.rel = 1000;
noise{3}.model = "alpha-stable real";
noise{3}.snr = -20:40;
noise{3}.alpha = 1.3;
noise{4}.model = "alpha-stable real";
noise{4}.snr = -20:40;
noise{4}.alpha = 1.7;
deviation_of_angle = 6;
