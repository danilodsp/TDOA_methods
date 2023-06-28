% Federal University of Rio Grande do Norte
% Title: Eckart filter
% Author: Danilo Pena, André Diniz
% Description: Eckart filter
% x: synthetic or real signal
% fs: sampling frequency
% d: distance between the elements
% n: noise component

function [theta] = Eckart(x, fs, d, n)

    u = 340; % sound speed
    [M,N] = size(x);
    X1 = fft(x(1,:));
    X2 = fft(x(2,:));
    NUM = (X1 .* conj(X2));
    n_freq1 = fft(n(1,:));
    %n_freq2 = fft(n(2,:));
    Gss = (X1 .* conj(X1));
    Gn = (n_freq1 .* conj(n_freq1) .* n_freq1 .* conj(n_freq1));
    %Gn = (n_freq1 .* conj(n_freq1) .* n_freq2 .* conj(n_freq2));
    W = max(Gss/Gn,0.01); % Noise components are equal for both signals
    R = ifft(NUM.*W);
    %R = ifft(exp(1i*angle(X1 .* conj(X2))));
    [argvalue, argmax] = max(abs(R)); % max(fftshift(R))
    half = length(x(2,:))/2;
    tau = -(argmax - 2*half - 1); % argmax - 1;
    %tau = gccphat(x(2,:)',x(1,:)');
    tdoa = tau / fs;

    theta = asin(tdoa / (d/u)) * (180/pi);

end