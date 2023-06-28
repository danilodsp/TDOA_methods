% Federal University of Rio Grande do Norte
% Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
% Title: BeamScan
% Author: Mário G. F. Figueredo (adapted from R. Moses)
% Description: BeamScan Implementation

% x: synthetic or real signal
% P: source numbers
% fc: source frequency
% d: distance between the elements

function [theta,result] = BeamScan(x, f, d, u)

[M,N] = size(x); % M - element number, N - number of samples

% Eigenvalues and eigenvectors
Rx = (x*x')/N; % covariance matrix
%INVR = inv(Rx);
L = 361; % -pi/2:0.5:pi/2 -> L = 361
phi = zeros(L,1);

for i = 1:L
   a = exp(-1i*2*pi*f*d*sin(-pi/2 + pi*(i-1)/L)/u*[0:M-1].');
   phi(i) = real(sum((a'*Rx).*a.',2));
end

theta = linspace(-pi/2,pi/2,361)*180/pi;
result = phi;

end

