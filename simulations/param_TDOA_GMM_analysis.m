% Federal University of Rio Grande do Norte
% Title: param_TDOA_GMM_analysis
% Author: Danilo Pena
% Description: TDOA with GMM noise (rel parameter)

%% Parameters
algorithms = ["GCC-PHAT" "GCC-ROTH" "GCC-SCOT" "SRP-PHAT" "FLOS-PHAT 0.2" "NLT-PHAT"];
type_of_data = "zadoff-chu";
angles = [20];
number_of_sensors = 2;
distance_between_sensors = 0.05;
source_frequency = [1000];
sampling_frequency = 400000;
number_of_samples = 353; %139
number_of_iterations = 10000;
speed_propagation = 340;
number_of_snapshots = 1;
noise{1}.model = "gaussian mixture real";
noise{1}.snr = -20:40;
noise{1}.rel = 10;
noise{2}.model = "gaussian mixture real";
noise{2}.snr = -20:40;
noise{2}.rel = 100;
noise{3}.model = "gaussian mixture real";
noise{3}.snr = -20:40;
noise{3}.rel = 200;
noise{4}.model = "gaussian mixture real";
noise{4}.snr = -20:40;
noise{4}.rel = 500;
noise{5}.model = "gaussian mixture real";
noise{5}.snr = -20:40;
noise{5}.rel = 1000;
%noise{4}.model = "gaussian mixture real";
%noise{4}.snr = -20:40;
%noise{4}.rel = 10000;
deviation_of_angle = 6;
