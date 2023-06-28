% Federal University of Rio Grande do Norte
% Authors: Arthur Diego de Lira Lima / Danilo de Santana Pena
% Description: Additive channel complex symmetric alpha-stable (SaS)
% Parameters:
% y = x + n
% n: noise SaS
% x: original signal (no noise)
% y: output

% GSNR_dB: quality of signal
% alpha: tail of the distribution, 0<alpha<=2. (tip: 1<=alpha<=2)
% alpha=2 => Gaussian; alpha=1 => Cauchy

% FIXIT: multidimensional function
function [signal, noise] = sas_model(x, model, alpha, gsnr)

% Second shape parameter: the skewness of the distribution. If beta = 0, then the distribution is symmetric, -1<=beta<=1
beta = 0;
% Location parameter
% delta=0;

Cg = 1.7810724179901979852365041031071795491696452143034302053;

[M,N] = size(x);

A = rms(x(1,:));

% ruido - termo aditivo 
switch model 
    case "real"
        gam = sqrt( A^2 / ( 2 * 10^(gsnr/10) * Cg^(2/alpha-1) ) ); % real noise
        pd = makedist('Stable', 'alpha', alpha, 'gam', gam, 'beta', beta );
        noise = random(pd, size(x));
    case "complex"
        gam = sqrt( A^2 / ( 4 * 10^(gsnr/10) * Cg^(2/alpha-1) ) ); % Scale parameter, 0<gam<infty
        pd = makedist('Stable', 'alpha', alpha, 'gam', gam, 'beta', beta );
        noise = random(pd,size(x)) + 1j*random(pd,size(x));
    otherwise
        error("noise model incorrect.");
end

signal = x + noise;

end
