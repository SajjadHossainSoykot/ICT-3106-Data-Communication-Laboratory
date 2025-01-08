% NRZ-L (Non Return to Zero Level) Encoding and Decoding
clear;
clc;

% Define bitstream
bits = [1 0 1 1 0 1 0 0];
bitrate = 1; % Bit rate (1 bps)
n = 1000; % Sampling rate
T = length(bits) / bitrate; % Total time for the bitstream
N = n * length(bits); % Total sampling points
dt = T / N; % Time interval for each sampling point
t = 0:dt:T; % Time array
x = zeros(1, length(t)); % Initialize signal amplitude

% Define voltage levels for NRZ-L
high = 1;  % Voltage level for binary 1
low = -1;  % Voltage level for binary 0

% NRZ-L Encoding
for i = 1:length(bits)
    if bits(i) == 1
        x((i - 1) * n + 1:i * n) = high; % High voltage for binary 1
    else
        x((i - 1) * n + 1:i * n) = low; % Low voltage for binary 0
    end
end

% Plot the NRZ-L Encoded Signal
figure;

subplot(2, 1, 1);
plot(t, x, 'LineWidth', 3);
title('NRZ-L Encoding: Bitstream "1 0 1 1 0 1 0 0"');
xlabel('Time');
ylabel('Amplitude');
ylim([-1.5 1.5]);
grid on;

% NRZ-L Decoding
decoded_bits = zeros(1, length(bits)); % Initialize decoded bitstream
counter = 0; % Counter for decoding
for i = 1:length(t)
    if t(i) > counter
        counter = counter + 1;
        if x(i) == high
            decoded_bits(counter) = 1; % Detect high voltage level as binary 1
        else
            decoded_bits(counter) = 0; % Detect low voltage level as binary 0
        end
    end
end

% Plot the Decoded Bitstream
subplot(2, 1, 2);
stairs(bits, 'LineWidth', 3); % Use stairs plot for clarity
title('Decoded Bitstream');
xlabel('Bit Position');
ylabel('Bit Value');
ylim([-0.5 1.5]);
grid on;

% Display the decoded bitstream in the command window
disp('NRZ-L Decoding:');
disp(decoded_bits);