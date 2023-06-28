% Federal University of Rio Grande do Norte
% Author: Danilo Pena
% Title: Evaluation
% Description: Performace evaluation of algorithms for synthetic or real data
% data: struct of data
% angles: known angle (correct angles)
% delta: acceptable angle deviation for detection

function performance_metrics = evaluation(data, algorithms, angles, varargin)

defaultDelta = 6;
defaultRepeat = 1;

%if (nargin > 10), error('parameters number incorrect.');, end

inputs = inputParser;
addRequired(inputs, 'data');
addRequired(inputs, 'algorithms');
addRequired(inputs, 'angles');
addOptional(inputs, 'delta', defaultDelta);
addParameter(inputs, 'repeat', defaultRepeat);

parse(inputs, data, algorithms, angles, varargin{:});

data.delta = 6;
%data.iterations = 100;
% FIXIT:
%data.delta = inputs.Results.delta;
data.iterations = inputs.Results.repeat;

PD = [];
RMSE = [];
absolute_error = [];

%length_snapshots = data.properties.snapshots;
%[M,N] = size(data.signal);
%L = floor(N/length_snapshots);

k = 1;
for n_al = 1:length(algorithms)
for n_tod = 1:length(data.type_of_data)
for n_a = 1:length(data.angles)
for n_m = 1:length(data.M)
for n_d = 1:length(data.d)
for n_f = 1:length(data.f)
for n_fs = 1:length(data.fs)
for n_n = 1:length(data.N)
for n_u = 1:length(data.u)
for n_s = 1:length(data.snapshots)

for n_noise = 1:numel(data.noise)
for n_channel = 1:numel(data.channel)


% TODO: create a variable "parameters" for the current parameters

    %signal = selection_data(data.type_of_data(n_tod), data.angles(n_a), data.M(n_m), data.d(n_d), data.f(n_f), data.fs(n_fs), data.N(n_n), data.u(n_u), data.noise{n_noise}, data.channel{n_channel});
    
    [mean_angles, RMSE, absolute_error, PD] = snapshots(algorithms(n_al), ...
    data.angles(n_a), data.snapshots(n_s), data.iterations, data.d(n_d), ...
    data.f(n_f), data.u(n_u), data.fs(n_fs), data.type_of_data(n_tod), ...
    data.M(n_m), data.N(n_n), data.noise{n_noise}, data.channel{n_channel});

    performance_metrics(k).algorithms = algorithms(n_al);
    performance_metrics(k).type_of_data = data.type_of_data(n_tod);
    performance_metrics(k).angles = data.angles(n_a);
    performance_metrics(k).M = data.M(n_m);
    performance_metrics(k).d = data.d(n_d);
    performance_metrics(k).f = data.f(n_f);
    performance_metrics(k).fs = data.fs(n_fs);
    performance_metrics(k).N = data.N(n_n);
    performance_metrics(k).u = data.u(n_u);
    performance_metrics(k).snapshots = data.snapshots(n_s);
    performance_metrics(k).noise = data.noise{n_noise};
    performance_metrics(k).channel = data.channel{n_channel};
    performance_metrics(k).iterations = data.iterations;
    
    % Metrics
    performance_metrics(k).RMSE = RMSE;
    performance_metrics(k).absolute_error = absolute_error;
    performance_metrics(k).mean_angles = mean_angles;
    performance_metrics(k).PD = PD;

    k = k + 1;

end
end

end
end
end
end
end
end
end

end
end
end

end
