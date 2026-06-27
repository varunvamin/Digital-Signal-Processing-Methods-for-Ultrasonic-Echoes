function [t, clean_signal, noisy_signal] = simulate_echo(fs, t_duration, f0, snr_db)
% SIMULATE_ECHO Generates a synthetic ultrasonic echo signal and adds noise.
%
% Inputs:
%   fs         - Sampling frequency (Hz)
%   t_duration - Duration of the signal (seconds)
%   f0         - Center frequency of the ultrasonic pulse (Hz)
%   snr_db     - Target Signal-to-Noise Ratio (dB)
%
% Outputs:
%   t            - Time vector
%   clean_signal - The original, noiseless echo signal
%   noisy_signal - The signal with added Gaussian white noise

    % Time vector
    t = (0:1/fs:t_duration)';
    
    % Generate multiple echoes with different delays and amplitudes
    delays = [0.2*t_duration, 0.5*t_duration, 0.8*t_duration];
    amplitudes = [1.0, 0.6, 0.3];
    
    % Envelope function (Gaussian pulse)
    sigma = 0.02 * t_duration;
    
    clean_signal = zeros(size(t));
    for i = 1:length(delays)
        % Gaussian enveloped sinusoidal pulse
        pulse = amplitudes(i) * exp(-((t - delays(i)).^2) / (2 * sigma^2)) .* sin(2 * pi * f0 * t);
        clean_signal = clean_signal + pulse;
    end
    
    % Calculate signal power
    signal_power = rms(clean_signal)^2;
    
    % Calculate noise power based on target SNR
    noise_power = signal_power / (10^(snr_db / 10));
    
    % Generate Additive White Gaussian Noise (AWGN)
    noise = sqrt(noise_power) * randn(size(t));
    
    % Create noisy signal
    noisy_signal = clean_signal + noise;
end
