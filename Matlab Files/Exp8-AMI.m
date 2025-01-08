% AMI (Alternate Mark Inversion) Encoding and Decoding
clear;
clc;

bits = [1 1 0 0 1 0 1 0]; % Define the bitstream (example: 1 1 0 0 1 0 1 0)
bitrate = 1; % Bit rate is considered as 1 bps
n = 1000; % Sampling rate (1000 samples per bit)
T = length(bits) / bitrate; % Total time needed for the bitstream 
N = n * length(bits); % Total sampling points
dt = T / N; % Set time for each sampling point
t = 0:dt:T; % Time array for all values of X-axis
x = zeros(1, length(t)); % Set all amplitude to zero
lastbit = -1; % Initialize the lastbit to -1 (representing negative polarity)

% Loop for encoding
for i = 1:length(bits) % Iterate through each bit in the bitstream
    if bits(i) == 1 % If the bit is 1
        x((i - 1) * n + 1:i * n) = -lastbit; % Alternate between -1 and +1 for 1
        lastbit = -lastbit; % Flip polarity for the next 1
    end
end

% Encoding Signal Plot
figure;
plot(t, x, 'LineWidth', 2); % Plot the signal with time on the x-axis and amplitude on the y-axis
title('AMI Encoding: 1 1 0 0 1 0 1 0'); % Title of the plot
xlabel('Time'); % Label the x-axis as time
ylabel('Amplitude'); % Label the y-axis as amplitude
grid on; % Enable grid for better visualization

% Decoding signal to bitstream
counter = 0; % Initialize counter for decoding
result = zeros(1, length(bits)); % Preallocate result array for decoded bits
lastbit = -1; % Reset lastbit to -1 for decoding

% Loop for decoding
for i = 1:length(t) % Iterate through the time array
    if t(i) > counter % Check if the current time exceeds the counter
        counter = counter + 1; % Increment the counter
        if x(i) == -lastbit % Check if the voltage alternates as expected for 1
            result(counter) = 1; % Decode as 1 if alternating polarity is detected
            lastbit = -lastbit; % Flip polarity for the next 1
        else
            result(counter) = 0; % Decode as 0 if no alternating polarity
        end
    end
end

% Display the Bitstream
disp('AMI Decoding:'); % Display the message for decoding
disp(result); % Display the decoded bitstream