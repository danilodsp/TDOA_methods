% Federal University of Rio Grande do Norte
% Author: Danilo Pena
% Title: Evaluation
% Description: Performace evaluation of algorithms for synthetic or real data
% data: struct of data
% angles: known angle (correct angles)
% delta: acceptable angle deviation for detection

function [signal, noise_signal] = selection_data(type_of_data, angles, M, d, f, fs, N, u, noise, channel, snr)

switch type_of_data
    case "sine-complex"
        [signal, noise_signal] = create_signal("sine-complex", angles, M, d, f, fs, N, u, noise, channel, snr);
    case "sine-real"
        [signal, noise_signal] = create_signal("sine-real", angles, M, d, f, fs, N, u, noise, channel, snr);
    case "real"
        [signal, noise_signal] = load_data(angles, M, d, fs, N, noise, channel); % missing implement
    case "zadoff-chu"
        [signal, noise_signal] = create_signal("zadoff-chu", angles, M, d, f, fs, N, u, noise, channel, snr);
    case "random"
        [signal, noise_signal] = create_signal("random", angles, M, d, f, fs, N, u, noise, channel, snr);
    case "simulated-voice"
        [signal, noise_signal] = create_signal("voice", angles, M, d, f, fs, N, u, noise, channel, snr);
    case "demo-gong"
        [signal, noise_signal] = create_signal("gong", angles, M, d, f, fs, N, u, noise, channel, snr);
    case "demo-chirp"
        [signal, noise_signal] = create_signal("chirp", angles, M, d, f, fs, N, u, noise, channel, snr);
    case "demo-handel"
        [signal, noise_signal] = create_signal("handel", angles, M, d, f, fs, N, u, noise, channel, snr);
    case "demo-splat"
        [signal, noise_signal] = create_signal("splat", angles, M, d, f, fs, N, u, noise, channel, snr);
    case "demo-laughter"
        [signal, noise_signal] = create_signal("laughter", angles, M, d, f, fs, N, u, noise, channel, snr);
    case "demo-train"
        [signal, noise_signal] = create_signal("train", angles, M, d, f, fs, N, u, noise, channel, snr);
    otherwise
        error("Type of data invalid");
end

end
