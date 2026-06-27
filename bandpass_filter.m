function filtered_signal = bandpass_filter(noisy_signal, fs, f_low, f_high, order)
% BANDPASS_FILTER Applies a Butterworth bandpass filter to the signal.
%
% Inputs:
%   noisy_signal - The input noisy signal
%   fs           - Sampling frequency (Hz)
%   f_low        - Lower cutoff frequency (Hz)
%   f_high       - Upper cutoff frequency (Hz)
%   order        - Filter order
%
% Outputs:
%   filtered_signal - The signal after applying the bandpass filter

    % Normalize frequencies to Nyquist frequency (fs/2)
    Wn = [f_low, f_high] / (fs / 2);
    
    % Design the Butterworth filter
    [b, a] = butter(order, Wn, 'bandpass');
    
    % Apply the filter using zero-phase filtering (filtfilt) to avoid phase shift
    filtered_signal = filtfilt(b, a, noisy_signal);
end
