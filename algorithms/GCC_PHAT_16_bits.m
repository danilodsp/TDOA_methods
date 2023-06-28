% Federal University of Rio Grande do Norte
% Title: Phase Transformation
% Author: Danilo Pena
% Description: Phase Transform
% x: synthetic or real signal
% fs: sampling frequency
% d: distance between the elements

function [theta] = GCC_PHAT_16_bits(x, fs, d)

u = 340; % sound speed
[M,N] = size(x);

xb = int16(x);

X1 = fft(x(1,:));
%X1b = fft(xb(1,:));
X1b = double(real(int16(fft(x(1,:))))) + j.*double(imag(int16(fft(x(1,:)))));

X2 = fft(x(2,:));
%X2b = fft(xb(2,:));
X2b = double(real(int16(fft(x(2,:))))) + j.*double(imag(int16(fft(x(2,:)))));

NUM = (X1 .* conj(X2));
NUMb = (X1b .* conj(X2b));

W = max(abs(NUM),0.01);
Wb = max(abs(NUMb),0.01);

R = ifft(NUM./W);
Rb = ifft(NUMb./Wb);
Rb = Rb./max(Rb);
Rb = double(int16(Rb));

[argvalue, argmax] = max(abs(R));
[argvalueb, argmaxb] = max(abs(Rb));

half = length(x(2,:))/2;
halfb = length(xb(2,:))/2;

tau = -(argmax - 2*half - 1);
taub = -(argmaxb - 2*halfb - 1);

tdoa = tau / fs;
tdoab = taub / fs;

theta = asin(tdoa / (d/u)) * (180/pi);
thetab = asin(tdoab / (d/u)) * (180/pi);

theta = thetab;

end
