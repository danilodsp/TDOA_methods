% Federal University of Rio Grande do Norte
% Title: Cramer-Rao Lower Bound
% Author: Danilo Pena, André Diniz
% Description: Cramer-Rao Lower Bound for signals affected by gaussian noise
% x: synthetic or real signal
% f: signal frequency
% fs: sampling frequency
% d: distance between the elements

function [theta] = ML(x, f, fs, d)
    
    u = 340; % sound speed
    [M,N] = size(x);
    X1 = fft(x(1,:));
    X2 = fft(x(2,:));
    NUM = (X1 .* conj(X2));
    
    gamma = (X1 .* conj(X2))./sqrt(X1 .* conj(X1) .* X2 .* conj(X2));
    
    Gss = abs(gamma.^2);
    Gn = abs(X1 .* conj(X2)) .* (1 - abs(gamma).^2);
    W = max(Gss/Gn,0.01); 
    R = ifft(NUM.*W);
    %R = ifft(exp(1i*angle(X1 .* conj(X2))));
    [argvalue, argmax] = max(abs(R)); % max(fftshift(R))
    half = length(x(2,:))/2;
    tau = -(argmax - 2*half - 1); % argmax - 1;
    %tau = gccphat(x(2,:)',x(1,:)');
    tdoa = tau / fs;

    theta = asin(tdoa / (d/u)) * (180/pi);
    
end