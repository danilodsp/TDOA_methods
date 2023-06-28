% Federal University of Rio Grande do Norte
% Title: Roth correlation
% Author: Danilo Pena
% Description: Its results approximate an optimum linear Wiener-Hopf filter
% x: synthetic or real signal
% fs: sampling frequency
% d: distance between the elements

function [theta] = GCC_ROTH(x, fs, d)

u = 340; % sound speed
[M,N] = size(x);

X1 = fft(x(1,:));
X2 = fft(x(2,:));
NUM = (X1 .* conj(X2));
DEN = (X1 .* conj(X1));
W = max(DEN,0.01); % max(abs(X1.*X2c), epsilon)
R = ifft(NUM./W);
[argvalue, argmax] = max(abs(R)); % max(fftshift(R))
half = length(x(2,:))/2;
tau = -(argmax - 2*half - 1); % argmax - 1;
%tau = gccphat(x(2,:)',x(1,:)');
tdoa = tau / fs;

theta = asin(tdoa / (d/u)) * (180/pi);

end
