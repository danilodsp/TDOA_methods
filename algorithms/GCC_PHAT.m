% Federal University of Rio Grande do Norte
% Title: Phase Transformation
% Author: Danilo Pena
% Description: Phase Transform
% x: synthetic or real signal
% fs: sampling frequency
% d: distance between the elements

function [theta] = GCC_PHAT(x, fs, d)

u = 340; % sound speed
[M,N] = size(x);

X1 = fft(x(1,:));
X2 = fft(x(2,:));
NUM = (X1 .* conj(X2));
W = max(abs(NUM),0.01); % max(abs(X1.*X2c), epsilon)
R = ifft(NUM./W);
%R = ifft(exp(1i*angle(X1 .* conj(X2))));
[argvalue, argmax] = max(abs(R)); % max(fftshift(R))
half = length(x(2,:))/2;
tau = -(argmax - 2*half - 1); % argmax - 1;
%tau = gccphat(x(2,:)',x(1,:)');
tdoa = tau / fs;

theta = asin(tdoa / (d/u)) * (180/pi);

end
