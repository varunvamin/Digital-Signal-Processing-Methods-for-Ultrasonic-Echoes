function denoised_signal = tikhonov_regularization(noisy_signal, lambda)
% TIKHONOV_REGULARIZATION Applies Tikhonov regularization (Ridge regression) for denoising.
% This aims to minimize ||x - y||_2^2 + lambda * ||Dx||_2^2
% where D is the first difference matrix.
%
% Inputs:
%   noisy_signal - The 1D input noisy signal (column vector)
%   lambda       - Regularization parameter (controls smoothness)
%
% Outputs:
%   denoised_signal - The reconstructed signal

    N = length(noisy_signal);
    
    % Create the first-order difference matrix D
    % e.g. for N=4, D = [-1 1 0 0; 0 -1 1 0; 0 0 -1 1]
    e = ones(N, 1);
    D = spdiags([-e e], [0 1], N-1, N);
    
    % Construct the system matrix: A = I + lambda * (D^T * D)
    I = speye(N);
    A = I + lambda * (D' * D);
    
    % Solve the linear system A * x = y
    % We use the backslash operator which efficiently solves sparse systems
    denoised_signal = A \ noisy_signal;
end
