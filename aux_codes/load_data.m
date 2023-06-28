% Federal University of Rio Grande do Norte
% Title: Load data
% Author: Danilo Pena
% Description: Load measured data
% Parameters:
% angles: angles of DOA (1xP matrix), P is number of sources
% N: samples number
% M: elements number
% d: distance betwenn elements
% fs: sampling frequency

function [signal] = load_data(angles, M, d, fs, N, noise, channel)

P = length(angles);

path = "../../data/respeaker/scenario/";
scenario = "";
measure = "";
filename = strcat(num2str(M), " ", num2str(d));
datafile = fopen(filename,"r");

datacell = textscan(datafile, '%f%f', 'HeaderLines', 2);

fclose(datafile);

data.channel1 = [datacell{1} datacell{2}];

save('data.mat', 'data');

end
