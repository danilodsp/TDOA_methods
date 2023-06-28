% Federal University of Rio Grande do Norte
% Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
% Title: Nonparametric method
% Author: Danilo Pena
% Description: ...
% Parameters:
% x: synthetic or real signal
% f: source frequency
% d: distance between the elements
% u: speed propagation

function [angles] = nonparametric(x, f, d, u)

[M,N] = size(x);

% autocovariance
AC = xcov(x);

% periodogram
PE = fft(AC);

% peak detection
k_freq = max(PE);

% phase
F = fft(x);
ph = angle(F);

% difference of phase
tau = angdiff(ph(i),ph(i+1));

% average of tau
tau_average = mean(tau);

% determine angle
angles = 90 - (180*asin((tau_average*u)/(d*2*pi*f)))/pi;

end
