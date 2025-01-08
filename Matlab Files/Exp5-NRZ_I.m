% NRZ-I (Non Return to Zero Inverted) Encoding and Decoding
clear;
clc;

bits = [1 0 1 1 1 0 0 1]; % Define bitstream
bitrate = 1; % Bit rate is considered as 1 bps
n = 1000; % Sampling rate
T = length(bits) / bitrate; % Total time needed for the bitstream
N = n * length(bits); % Total sampling points
dt = T / N; % Set time for each sampling point
t = 0:dt:T; % Time array for all values of X-axis
x = zeros(1, length(t)); % Set all amplitude to zero
lastbit = 1; % Declare Lastbit as 1 (initial signal level)

% Loop for encoding
for i = 1:length(bits)
    if bits(i) == 1
        x((i - 1) * n + 1:i * n) = -lastbit; 
        % Set lastbit as -1 to invert the signal for next 1
        lastbit = -lastbit;
    else
        x((i - 1) * n + 1:i * n) = lastbit;
        % Set lastbit as 1 (no inversion)
    end
end

% Encoding Signal Plot
figure;

% Plot the NRZ-I Encoded Signal
subplot(2, 1, 1);
plot(t, x, 'Linewidth', 3);
title('NRZ-I Encoding: Bitstream "1 0 1 1 1 0 0 1"');
xlabel('Time');
ylabel('Amplitude');
ylim([-1.5 1.5]);
grid on;

% Decoding signal to bitstream
counter = 0; % Define counter for counting bits for decoding
lastbit = 1; % Define Lastbit as it changed
decoded_bits = zeros(1, length(bits)); % Loop for decoding

for i = 1:length(t)
    if t(i) > counter
        counter = counter + 1;
        if x(i) ~= lastbit
            decoded_bits(counter) = 1; % Detect transition to 1
            lastbit = -lastbit; % Invert signal for next bit
        else
            decoded_bits(counter) = 0; % No transition, so it's 0
        end
    end
end

% Plot the Decoded Bitstream
subplot(2, 1, 2);
stairs(bits, 'Linewidth', 3); % Use stairs plot to show bitstream clearly
title('Decoded Bitstream');
xlabel('Bit Position');
ylabel('Bit Value');
ylim([-0.5 1.5]);
grid on;

% Display the decoded bitstream in the command window
disp('NRZ-I Decoding:');
disp(decoded_bits);
