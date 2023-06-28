% Federal University of Rio Grande do Norte
% Title: Phase Transformation
% Author: Danilo Pena, André Diniz
% Description: Beamforming
% x: synthetic or real signal
% f: source frequency
% fs: sampling frequency
% d: distance between the elements

function [theta] = SRP_PHAT(x, f, fs, d)

u = 340; % sound speed
[M,N] = size(x);

delay = u*d;
for i=1:size(x,1)
   X(i,:) = fft(x(i,:)); 
end

R = 0;

for k=1:size(x,1)-1
    NUM = X(k,:) .* conj(X(k+1,:)) * exp(1i*2*pi*f*delay);
    W = max(abs(NUM),0.01);
    R = R + ifft(NUM./W);
end

[argvalue, argmax] = max(abs(R)); % max(fftshift(R))
half = length(x(2,:))/2;
tau = -(argmax - 2*half - 1); % argmax - 1;
tdoa = tau / fs;
theta = asin(tdoa / (d/u)) * (180/pi); % RETORNANDO O MESMO VALOR PARA THETA!!

end