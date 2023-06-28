% Federal University of Rio Grande do Norte
% Title: Signal Generator
% Author: Danilo Pena
% Description: The generator of the simulated signal
% Parameters:
% angles: angles of DOA (1xP matrix), P is number of sources
% N: samples number
% M: elements number
% d: distance betwenn elements
% u: propagation speed
% f: source frequency
% fs: sampling frequency
% -varargin -
% noise model: 'gaussian', 'gaussian mixture', 'alpha-stable'
% noise parameters:  (snr), gaussian mixture (means, variances),  (alpha, g-snr)
% snr (optional - gaussian): signal-to-noise ratio (default: 0dB) 
% alpha (optional - alpha-stable): tail of the distribution (default: 1.7)
% gsnr (optional - alpha-stable): quality of signal (default: 0)
% K (optional - gaussian mixture): number of mixture components (default: 2)
% means (optional - gaussian mixture): mean of component i (default: [0 0])
% variances (optional - gaussian mixture): variance of component i (default: [0.01 1])
% channel model: 'reverberation', 'echo', 'multiple echos', 'flanging', 'statistical'
% channel parameters: reverberation (a, N)

function [signal, noise_signal] = create_signal(type_of_simulation, angles, M, d, f, fs, N, u, noise, channel, snr)

sig = zeros(M,N);

switch type_of_simulation
    case "sine-complex"
        P = length(angles); % source number
        A = zeros(P,M); % steering matrix
        wn = (f.*2.*pi)./fs; % normalized frequency source
        for k = 1:P
            A(k,:) = exp(-1i*2*pi*f(k)*d.*sin((angles(k).*(pi/180)))./u.*[0:M-1]);
        end
        A = A';
        sig = A*exp(1i*(wn*[1:N]));
    case "sine-real"
        P = length(angles); % source number
        A = zeros(P,M); % steering matrix
        wn = (f.*2.*pi)./fs; % normalized frequency source
        for k = 1:P
            A(k,:) = cos(2*pi*f(k)*d.*sin((angles(k).*(pi/180)))./u.*[0:M-1]);
        end
        A = A';
        sig = A*cos((wn*[1:N]));
    case "zadoff-chu"
        % Zadoff-Chu Sequence
        R = 25;
        tau = (d*sin(angles/180*pi)/u);
        delay = round(tau*fs);
        sig_tmp = zeros(1,N);
        for i=1:N
            sig_tmp(i) = real(exp(-1i*pi*R*(i-1)*(i)/N));
        end
        for n = 1:M
            sig(n,:) = [zeros(1,delay*(n-1)) sig_tmp(1:end-(n-1)*delay)];
        end
    case "random"
        sig_tmp = randn(1,N);
        tau = (d*sin(angles/180*pi)/u);
        delay = round(tau*fs);
        for n = 1:M
            sig(n,:) = [zeros(1,delay*(n-1)) sig_tmp(1:end-(n-1)*delay)];
        end
    case "voice"
        % TODO: Find a demo voice signal
    case "gong"
        gong = load('gong');
        sig_tmp = gong.y(1:N)';
        tau = (d*sin(angles/180*pi)/u);
        delay = round(tau*gong.Fs);
        for n = 1:M
            sig(n,:) = [zeros(1,delay*(n-1)) sig_tmp(1:end-(n-1)*delay)];
        end
    case "chirp"
        chirp = load('chirp');
        sig_tmp = chirp.y(1:N)';
        tau = (d*sin(angles/180*pi)/u);
        delay = round(tau*chirp.Fs);
        for n = 1:M
            sig(n,:) = [zeros(1,delay*(n-1)) sig_tmp(1:end-(n-1)*delay)];
        end
    case "handel"
        handel = load('handel');
        sig_tmp = handel.y(1:N)';
        tau = (d*sin(angles/180*pi)/u);
        delay = round(tau*handel.Fs);
        for n = 1:M
            sig(n,:) = [zeros(1,delay*(n-1)) sig_tmp(1:end-(n-1)*delay)];
        end
    case "splat"
        splat = load('splat');
        sig_tmp = splat.y(1:N)';
        tau = (d*sin(angles/180*pi)/u);
        delay = round(tau*splat.Fs);
        for n = 1:M
            sig(n,:) = [zeros(1,delay*(n-1)) sig_tmp(1:end-(n-1)*delay)];
        end
    case "laughter"
        laughter = load('laughter');
        sig_tmp = laughter.y(1:N)';
        tau = (d*sin(angles/180*pi)/u);
        delay = round(tau*laughter.Fs);
        for n = 1:M
            sig(n,:) = [zeros(1,delay*(n-1)) sig_tmp(1:end-(n-1)*delay)];
        end
    case "train"
        train = load('train');
        sig_tmp = train.y(1:N)';
        tau = (d*sin(angles/180*pi)/u);
        delay = round(tau*train.Fs);
        for n = 1:M
            sig(n,:) = [zeros(1,delay*(n-1)) sig_tmp(1:end-(n-1)*delay)];
        end
    otherwise
        error("Type of simulation invalid");
end

switch noise.model
    case "deterministic"
        signal = sig;
        noise_signal = zeros(1, length(signal));
        %signal.snr = 0; % FIXIT: think in a better solution for this
    case "gaussian real"
        [signal, noise_signal] = gaussian_model(sig, "real", snr);
    case "gaussian complex"
        [signal, noise_signal] = gaussian_model(sig, "complex", snr);
    case "alpha-stable real"
        [signal, noise_signal] = sas_model(sig, "real", noise.alpha, snr); % GSNR
    case "alpha-stable complex"
        [signal, noise_signal] = sas_model(sig, "complex", noise.alpha, snr); % GSNR
    case "gaussian mixture real"
        [signal, noise_signal] = gaussian_mixture_model(sig, "real", noise.rel, snr);
    case "gaussian mixture complex"
        [signal, noise_signal] = gaussian_mixture_model(sig, "complex", noise.rel, snr);
    otherwise
        error("noise model incorrect.");
end

switch channel.model
    case "none"
        signal = signal;
    case "reverberation"
        signal = reverberation_model(signal, fs, channel.D);
    otherwise
        error("channel model incorrect.");
end

end
