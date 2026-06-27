# Digital Signal Processing Methods for Ultrasonic Echoes

[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=varunvamin/Digital-Signal-Processing-Methods-for-Ultrasonic-Echoes)

This repository contains a MATLAB simulation designed for processing and denoising ultrasonic echo signals. Ultrasonic testing often suffers from high levels of measurement noise, and extracting accurate echo features is critical for non-destructive testing (NDT) and medical imaging.

This project implements a simulated environment to generate synthetic ultrasonic pulses, adds white Gaussian noise to model physical conditions, and evaluates the performance of three distinct signal denoising techniques.

## Features

- **Signal Simulation**: Generates a synthetic ultrasonic signal consisting of multiple Gaussian-enveloped sinusoidal pulses.
- **Noise Modeling**: Injects Additive White Gaussian Noise (AWGN) to achieve a target Signal-to-Noise Ratio (SNR).
- **Denoising Techniques**:
  - **Bandpass Filtering**: A standard Butterworth IIR filter tuned around the ultrasonic center frequency.
  - **Tikhonov Regularization (Ridge Regression)**: A matrix-based approach that smooths the signal by penalizing the L2 norm of the first derivative.
  - **Total Variation (TV) Denoising**: Uses a proximal gradient method (Chambolle's algorithm) to preserve sharp transitions while aggressively smoothing flat regions, minimizing the L1 norm of the gradient.
- **Performance Evaluation**: Computes and compares output SNRs across all methods and provides a comprehensive visual plot.

## Project Structure

- `main.m`: The primary script to run the simulation, apply all filters, calculate SNRs, and generate comparison plots.
- `simulate_echo.m`: Function for generating the clean and noisy ultrasonic signals.
- `bandpass_filter.m`: Function implementing the zero-phase Butterworth bandpass filter.
- `tikhonov_regularization.m`: Function implementing Tikhonov denoising.
- `tv_denoising.m`: Function implementing 1D Total Variation denoising.

## Getting Started

### Prerequisites

- MATLAB (R2018a or newer recommended).
- Signal Processing Toolbox (required for `butter` and `filtfilt` functions).

### Running the Application (Recommended)

1. Clone this repository.
2. Open MATLAB and navigate to the repository directory.
3. Run the **`run_gui.m`** script.
4. An interactive window will launch! You can drag the SNR slider at the bottom to dynamically adjust the noise level and watch how the three denoising algorithms perform in real-time.

### Running the Standard Script

If you prefer to see the output in the console and standard MATLAB figures:
1. Run the `main.m` script.
2. Observe the console output for SNR comparisons and the generated figure displaying the time-domain signals.

## Example Results

When running `main.m` with an input SNR of ~5.00 dB, you can expect typical improvements such as:

- **Bandpass Filter SNR**: ~13-14 dB
- **Tikhonov Regularization SNR**: ~11-12 dB
- **TV Denoising SNR**: ~12-14 dB

*(Note: Actual values will vary slightly per run due to the random nature of the generated noise).*

## License

This project is licensed under the MIT License.
