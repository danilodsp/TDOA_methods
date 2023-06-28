% Federal University of Rio Grande do Norte
% Title: Modified MLE
% Author: Danilo Pena, Andre Diniz
% Description: Modified MLE
% x: synthetic or real signal
% f: signal frequency
% fs: sampling frequency
% d: distance between the elements

function [theta] = ModML(x, f, fs, d)
    
    u = 340; % sound speed
    [M,N] = size(x);
    X1 = fft(x(1,:));
    X2 = fft(x(2,:));
    NUM = (X1 .* conj(X2));
    
    gamma = (X1 .* conj(X2))./sqrt(X1 .* conj(X1) .* X2 .* conj(X2));
    % Gn = abs(X1 .* conj(X2)) .* sqrt(1 - gamma.^2);
    Gn = (abs(X1 .* conj(X2)).^0.75 + min(abs(gamma.^2))) .* sqrt(abs(1 - gamma.^2));
    W = abs(gamma)/Gn;
    R = ifft(NUM.*W);
    %R = ifft(exp(1i*angle(X1 .* conj(X2))));
    [argvalue, argmax] = max(abs(R)); % max(fftshift(R))
    half = length(x(2,:))/2;
    tau = -(argmax - 2*half - 1); % argmax - 1;
    %tau = gccphat(x(2,:)',x(1,:)');
    tdoa = tau / fs;

    theta = asin(tdoa / (d/u)) * (180/pi);
    
end