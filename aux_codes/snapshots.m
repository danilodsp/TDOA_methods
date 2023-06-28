% Federal University of Rio Grande do Norte
% Author: Danilo Pena
% Title: Snapshot
% Description: Snapshot settings  
% data: struct of data
% P: source numbers
% fc: source frequency
% d: distance between the elements (microphones)
% snapshot: length of window of snapshot

function [mean_angles, RMSE, absolute_error, PD] = snapshots(algorithms, correct_angle, snapshots, iterations, d, f, u, fs, type_of_data, M, N, noise, channel)

P = 1; % check the dimension of angles
%length_snapshots = snapshots;
%[M,N] = size(signal.x{1}); % M - number of elements, N - length of samples
%L = floor(N/length_snapshots); % number of windows
%angles = zeros(1,L); % preallocate output

mean_angles = zeros(1,length(noise.snr));
RMSE = zeros(1,length(noise.snr));
absolute_error = zeros(1,length(noise.snr));
PD = zeros(1,length(noise.snr));

k = 1;
for snr_i = noise.snr(1):noise.snr(end) % SNR or GSNR

    % TODO: Analysis of snapshots
%    for nw = 0:L-1
%        xw = signal.x{snr_i}(:,(nw*length_snapshots)+1:(nw*length_snapshots)+length_snapshots); % window
        %xw = signal.x{snr_i};
        angles = zeros(1,iterations);
        algorithmsChar = char(algorithms);
        
        for i = 1:iterations

            [signal, noise_signal] = selection_data(type_of_data, correct_angle, M, d, f, fs, N, u, noise, channel, snr_i);
            
            if algorithms == 'Capon'
                [theta, result(i,:)] = Capon(signal, f, d, u);
                [Max,pos_angle] = max(result(i,:));
                angles(i) = 90 - ((pos_angle-1)/2);
            elseif algorithms == 'Beamscan'
                angles(i) = BeamScan(signal, f, d, u);
            elseif algorithms == 'Root MVDR'
                angles(i) = Root_MVDR(signal, P, d, u);
            elseif algorithms == 'CC'
                angles(i) = CC(signal, fs, d);
            elseif algorithms == 'GCC-PHAT'
                angles(i) = GCC_PHAT(signal, fs, d);
            elseif algorithms == 'GCC-PHAT 8 bits'
                angles(i) = GCC_PHAT_8_bits(signal, fs, d);
            elseif algorithms == 'GCC-PHAT 16 bits'
                angles(i) = GCC_PHAT_16_bits(signal, fs, d);
            elseif algorithms == 'GCC-ROTH'
                angles(i) = GCC_ROTH(signal, fs, d);
            elseif algorithms == 'GCC-SCOT'
                angles(i) = GCC_SCOT(signal, fs, d);
            elseif algorithms == 'GCC-Eckart'
                angles(i) = Eckart(signal, fs, d, noise_signal);
            elseif algorithms == 'WienerHopf'
                angles(i) = WienerHopf(signal, fs, d);
            elseif algorithms == 'SRP-PHAT'
                angles(i) = SRP_PHAT(signal, f, fs, d);
            elseif algorithms == 'GCC-ML'
                angles(i) = ML(signal, f, fs, d);
            elseif algorithms == 'GCC-MML'
                angles(i) = ModML(signal, f, fs, d);
            elseif algorithms == 'CRLB'
                angles(i) = CRLB(signal, f, fs, snr_i);
            elseif algorithms == 'Fourier'
                angles(i) = Fourier(signal, f, fs, d);
            else
                error('Incorrect algorithm');
            end

        end

%        angles_of_snapshots(nw+1) = mean(angles);
%    end

%    angles_of_snapshots = angles;

    error_angle = angles - correct_angle;
    
    mean_angles(k) = mean(angles); % Mean Angle
    RMSE(k) = sqrt( mean((error_angle).^2) ); % Root Mean Square Error
    absolute_error(k) = mean( abs(error_angle) ); % Absolute Error
    PD(k) = sum(abs(error_angle) < 6)/iterations;
    
    k = k + 1;
end

end
