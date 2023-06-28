% Federal University of Rio Grande do Norte
% Title: Noise Gaussian Model
% Author: Danilo Pena
% Description: Signal generator for known SNR
%
% Parameters:
% x: steering vector signal
% snrValues: All signal-to-noise ratios

function [signal, noise] = gaussian_model(x, model, snr)

N = length(x);
%N_param = length(snrValues);

signalPower = (1/N)*x(1,:)*x(1,:)';
signalPower_dB = 10*log10(signalPower);

%k = 1;
%for snr = snrValues
noisePower_dB = signalPower_dB - snr;
noisePower = 10^(noisePower_dB/10);
switch model
    case "real"
        noise = sqrt(noisePower) * randn(size(x));
    case "complex"
        noise = sqrt(noisePower/2) * (randn(size(x)) + 1j*randn(size(x)));
    otherwise
        error("noise model incorrect.");
end

signal = x + noise;
    %signal.snr{k} = snr;
    %k = k + 1;
%end

end
