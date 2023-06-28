% Federal University of Rio Grande do Norte
% Title: Cross-Correlation method
% Author: Danilo Pena
% Description: Cross-Correlation method by Fourier
% x: synthetic or real signal
% fs: sampling frequency
% d: distance between the elements

function [theta] = CC(x, fs, d)

u = 340; % sound speed
[M,N] = size(x);

X1 = fft(x(1,:));
X2 = fft(x(2,:));
NUM = (X1 .* conj(X2));

R = ifft(NUM);

[argvalue, argmax] = max(abs(R)); % max(fftshift(R))
half = length(x(2,:))/2;
tau = -(argmax - 2*half - 1); % argmax - 1;

tdoa = tau / fs;

theta = asin(tdoa / (d/u)) * (180/pi);

end
