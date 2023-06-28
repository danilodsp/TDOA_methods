% Federal University of Rio Grande do Norte
% Title: Reverberation model
% Author: Danilo Pena
% Description: Reveberation model aplied to signal
%
% Parameters:
% fs: sampling frequency
% D: PreDelay

function [signal] = reverberation_model(x, fs, D)

% Matlab Solution (https://www.mathworks.com/help/audio/ref/reverberator-system-object.html)

[M,N] = size(x);
signal = zeros(M,N);

reverb = reverberator('PreDelay', D, 'SampleRate', fs);

for ii=1:M
    tmp = step(reverb, x(ii,:)'); 
    tmp = tmp';
    signal(ii,:) = tmp(1,:);
    %signal = reverb(x); % older versions
end

signal = signal';

% My simple solution
%H = (alpha + z^(-R))/(1 + alpha*z^(-R)); % alpha < 1, alpha=0.8 R=4
%H = (alpha*z^(R) + 1)/(z^(R) + alpha);
%H = (alpha*z^(R))/(z^(R) + alpha) + 1/(z^(R) + alpha);
%H = alpha/(1 + alpha*z^(-R)) + z^(-R)/(1 + alpha*z^(-R));
% implements delay loop of transfer function in time domain

end
