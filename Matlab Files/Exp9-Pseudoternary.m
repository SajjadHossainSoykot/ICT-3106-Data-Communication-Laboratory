% Pseudoternary Bipolar Line Encoding and Decoding
clear;
clc;

bits = [1 0 1 1 1 0 0 1]; % Define bitstream
bitrate = 1; % Bit rate is considered as 1 bps
n = 1000; % Sampling rate (samples per bit)
T = length(bits) / bitrate; % Total time for the bitstream 
N = n * length(bits); % Total sampling points
dt = T / N; % Time for each sampling point
t = 0:dt:T; % Time array for all values of X-axis
x = zeros(1, length(t)); % Initialize amplitude array (set to zero)
lastbit = -1; % Declare lastbit as -1 for alternating polarity

% Encoding loop: Assign values based on bitstream
for i = 1:length(bits)
    if bits(i) == 0 % For bit '0', assign alternating polarity
        x((i-1)*n+1:i*n) = -lastbit; % Alternate polarity for '0'
        lastbit = -lastbit; % Change polarity for next bit
    else
        x((i-1)*n+1:i*n) = 0; % For bit '1', set to zero voltage
    end
end

% Plot the Encoding Signal
figure;
plot(t, x, 'LineWidth', 3); % Plot encoded signal
title('Pseudoternary Encoding: 1 0 1 1 1 0 0 1');
xlabel('Time'); % Label x-axis as time
ylabel('Amplitude'); % Label y-axis as amplitude
grid on; % Display grid for better visualization

% Decoding: Convert signal back to bitstream
counter = 0; % Initialize bit counter for decoding
result = zeros(1, length(bits)); % Preallocate result array
lastbit = -1; % Reset lastbit for decoding

% Decoding loop: Extract bits from the encoded signal
for i = 1:length(t)
    if t(i) > counter % Check if it's time to decode the next bit
        counter = counter + 1; % Increment the bit counter
        if x(i) == -lastbit % If signal is equal to -lastbit, decode as '0'
            result(counter) = 0;
            lastbit = -lastbit; % Alternate polarity for next bit
        else
            result(counter) = 1; % Decode as '1'
        end
    end
end

% Display the Decoded Bitstream
disp('Pseudoternary Decoding:');
disp(result); % Show decoded result in command window