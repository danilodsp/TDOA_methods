% Federal University of Rio Grande do Norte
% Title: Campaign
% Description: Campaign
%
% Function:
% main(input_param, output_name);
%
% Parameters:
% input_param list:
% TDOA - "param_TDOA", "param_TDOA_GMM_analysis", "param_TDOA_alpha_stable_analysis", 
%"param_TDOA_samples_number_analysis", "param_TDOA_demo_chirp"
% output_name: output name

clear
clc
close all

addpath(genpath('algorithms'));
addpath(genpath('aux_codes'));
addpath(genpath('distortion_models'));
addpath(genpath('simulations'));

% Latest updates
% main("param_CRLB", "CRLB");
% main("param_SRP", "SRP_PHAT");
% main("param_TDOA_WCSD", "WCSD");
% main("param_TDOA_CC", "CC");
% main("param_TDOA_GCC_samples", "TDOA_GCC_samples");
main("param_TDOA_GCC_length_bits", "TDOA_GCC_length_bits");

% TDOA parameters
% main("param_TDOA", "TDOA");
% main("param_SRP", "SRP_number_of_sensors");
% main("param_SRP_reverberation", "SRP_reverberation");
% main("param_TDOA_GCC", "TDOA_GCC");
% main("param_TDOA_alpha_stable_analysis", "TDOA_alpha");
% main("param_TDOA_GMM_analysis", "TDOA_GMM");
% main("param_TDOA_demo_chirp", "TDOA_demo_chirp");
% main("param_TDOA_demo_gong", "TDOA_demo_gong");
% main("param_TDOA_demo_handel", "TDOA_demo_handel");
% main("param_TDOA_demo_laughter", "TDOA_demo_laughter");
% main("param_TDOA_demo_splat", "TDOA_demo_splat");
% main("param_TDOA_demo_train", "TDOA_demo_train");
% main("param_TDOA_signal_random", "TDOA_signal_random");

