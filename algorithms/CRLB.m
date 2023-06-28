% Federal University of Rio Grande do Norte
% Title: Cramer-Rao Lower Bound
% Author: Danilo Pena, André Diniz
% Description: Cramer-Rao Lower Bound for signals affected by gaussian noise
% x: synthetic or real signal
% f: signal frequency
% fs: sampling frequency
% d: distance between the elements
% n: noise component
% snr: SNR of the received signal used for variance 

% FIXIT: problem occuring after 0dB SNR

function [theta] = CRLB(x, f, fs, snr)
    
    [M,N] = size(x);
%     signalPower = (1/N)*x(1,:)*x(1,:)';
%     signalPower_dB = 10*log10(signalPower);
%     noisePower_dB = signalPower_dB - snr;
%     sigma_2 = 10^(noisePower_dB/10);

    %sigma_2 = var(n(1,:));
    sigma_2 = 1/(10^(snr/10)); 
    
    u = 340; % sound speed    
    
    E = sigma_2/(2*M);
    
    theta = asin(E)  * (180/pi);
end