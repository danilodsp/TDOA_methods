% Federal University of Rio Grande do Norte
% Title: Phase Transformation
% Author: Danilo Pena
% Description: Phase Transform
% x: synthetic or real signal
% fs: sampling frequency
% d: distance between the elements

function [theta] = Fourier(x, f, fs, d)

u = 340; % sound speed
[M,N] = size(x);

X1 = fft(x(1,:));
X2 = fft(x(2,:));
X_f(1,:) = angle(fft(x(1,:)));
X_f(2,:) = angle(fft(x(2,:)));

[maximum,indice] = max(X1(1,:));

tau = abs(angdiff(X_f(2,indice), X_f(1,indice))/((2*pi*f)/fs));
tdoa = tau / fs;

theta = asin(tdoa / (d/u)) * (180/pi);

end
