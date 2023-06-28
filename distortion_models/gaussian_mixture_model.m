% Universidade Federal do Rio Grande do Norte
% Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
% Gaussian Mixture Model
% Descricao: Realiza a modelagem de misturas de Gaussianas
% 
% Parameters:
% p, SNR

function [signal, noise] = gaussian_mixture_model(x, model, rel, snr)

mu1 = 0;
mu2 = 0;

p1 = 0.90;
p2 = 0.10;

[M,N] = size(x);
signal = zeros(M,N);

signalPower = (1/N)*x(1,:)*x(1,:)';
signalPower_dB = 10*log10(signalPower);

noisePower_dB = signalPower_dB - snr;
noisePower = 10^(noisePower_dB/10);

sigma = noisePower;
sigma1 = sigma / (p1 + rel*p2);
sigma2 = rel*sigma1;

%means = [0 0; 0 0];
%variances = [sigma1 0; 0 sigma2];
%p = [p1 p2];
%gm = gmdistribution(means, variances, p);
%n = random(gm,N)';

switch model
    case "real"
        noise1 = normrnd(mu1, sqrt(sigma1), [int32(floor(N*p1)),1]);
        noise2 = normrnd(mu2, sqrt(sigma2), [int32(N - (floor(N*p1))),1]);
        n = [noise1' noise2'];
        noise = n(randperm(N));
    case "complex"
        noise1 = normrnd(mu1, sqrt(sigma1/2), [int32(floor(N*p1)),1]);
        noise2 = normrnd(mu2, sqrt(sigma2/2), [int32(N - (floor(N*p1))),1]);
        n = [(noise1 + 1j*noise1)' (noise2 + 1j*noise2)'];
        noise = n(randperm(N));
    otherwise
        error("Incorrect model.");
end

signal = x + noise;

end