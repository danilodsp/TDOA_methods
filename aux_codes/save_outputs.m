% Federal University of Rio Grande do Norte
% Author: Danilo Pena
% Title: Save Outputs
% Description: Save analysis of output
% Parameters:

function save_outputs(output_name, performance_metrics)

%if (nargin > 10), error('parameters number incorrect.');, end

% Initializing

inputs = inputParser;
addRequired(inputs, 'performance_metrics');

parse(inputs, performance_metrics);

performance_metrics = inputs.Results.performance_metrics;

%% Creating the folder and saving the mat-file

if ~exist(strcat("../results/", output_name), 'dir') %Initial step, 2 (file), 7 (folder)
   mkdir(char(strcat("../results/", output_name)));
end

save(char(strcat("../results/", output_name, "/results.mat")), 'performance_metrics');

T = table(performance_metrics(1).type_of_data, performance_metrics(1).M, performance_metrics(1).d, performance_metrics(1).f, performance_metrics(1).fs, performance_metrics(1).N, performance_metrics(1).u, performance_metrics(1).iterations, length(performance_metrics(1).noise), 'VariableNames', { 'Type_of_data', 'M', 'd', 'f', 'fs', 'N', 'u', 'iterations', 'total_noise_models'} );
writetable(T, char(strcat("../results/", output_name, "/parameters.txt")));

%% Ploting

noise_model = [];
index_noise = 1;
n_noise = -1;

for k = 1:length(performance_metrics)

axisX = performance_metrics(k).noise.snr;

if ((performance_metrics(k).noise.model == "alpha-stable real")||(performance_metrics(k).noise.model == "alpha-stable complex"))
    complement = strcat("(\alpha-stable) \alpha = ", num2str(performance_metrics(k).noise.alpha));
    x_axis = "GSNR";
elseif ((performance_metrics(k).noise.model == "gaussian mixture real")||(performance_metrics(k).noise.model == "gaussian mixture real"))
    complement = strcat("(GMM) REL = ", num2str(performance_metrics(k).noise.rel));
    x_axis = "GSNR";
else
    complement = "(AWGN)";
    x_axis = "SNR";
    
end

if (isstring(noise_model) && sum(noise_model == complement))
    index_noise = find(noise_model==complement) - 1;
else
    noise_model = [noise_model complement];
    n_noise = n_noise + 1;
    index_noise = n_noise;
end

% Plots
h(index_noise*3+1) = figure (index_noise*3+1);
axisY = performance_metrics(k).RMSE;
p(k,index_noise*3+1) = plot(axisX, axisY, 'DisplayName', char(performance_metrics(k).algorithms));
legend;
title(strcat("RMSE ", complement));
xlabel(x_axis);
ylabel('RMSE (degrees)');
grid on;
hold on

h(index_noise*3+2) = figure (index_noise*3+2);
axisY = performance_metrics(k).absolute_error;
p(k,index_noise*3+2) = plot(axisX, axisY, 'DisplayName', char(performance_metrics(k).algorithms));
legend;
title(strcat("Absolute Error ", complement));
xlabel(x_axis);
ylabel('Absolute Error (degrees)');
grid on;
hold on

h(index_noise*3+3) = figure (index_noise*3+3);
axisY = performance_metrics(k).PD;
p(k,index_noise*3+3) = plot(axisX, axisY, 'DisplayName', char(performance_metrics(k).algorithms));
legend;
title(strcat("Probability Detection ", complement));
xlabel(x_axis);
ylabel('Probability Detection');
grid on;
hold on

end

noise_model = strrep(noise_model,".","_");
noise_model = strrep(noise_model,"\","");
for kk=1:n_noise+1
    print(h((kk-1)*3+1), strcat("../results/", output_name, "/RMSE ", noise_model(kk)),'-depsc');
    print(h((kk-1)*3+2), strcat("../results/", output_name, "/AE ", noise_model(kk)),'-depsc');
    print(h((kk-1)*3+3), strcat("../results/", output_name, "/PD ", noise_model(kk)),'-depsc');

    print(h((kk-1)*3+1), strcat("../results/", output_name, "/RMSE ", noise_model(kk)),'-dpng');
    print(h((kk-1)*3+2), strcat("../results/", output_name, "/AE ", noise_model(kk)),'-dpng');
    print(h((kk-1)*3+3), strcat("../results/", output_name, "/PD ", noise_model(kk)),'-dpng');

    saveas(h((kk-1)*3+1),strcat("../results/", output_name, "/RMSE ", noise_model(kk), ".fig"));
    saveas(h((kk-1)*3+2),strcat("../results/", output_name, "/AE ", noise_model(kk), ".fig"));
    saveas(h((kk-1)*3+3),strcat("../results/", output_name, "/PD ", noise_model(kk), ".fig"));
end

end
