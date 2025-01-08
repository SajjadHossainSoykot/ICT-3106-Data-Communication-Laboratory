% Manchester Encoding and Decoding
clc;
clear;

bits = [1 0 1 1 1 0 0 1]; % Define bitstream
bitrate = 1; % Bit rate is considered as 1 bps
n = 1000; % Sampling rate
T = length(bits) / bitrate; % Total time needed for the bitstream 
N = n * length(bits); % Total sampling points
dt = T / N; % Set time for each sampling point
t = 0:dt:T; % Time array for all values of X-axis
x = zeros(1, length(t)); % Set all amplitude to zero

% Loop for encoding
for i = 1:length(bits)
    if bits(i) == 1
        x((i - 1) * n + 1:(i - 1) * n + n / 2) = 1;    % High-to-low transition for 1
        x((i - 1) * n + n / 2:i * n) = -1;               % Low-to-high transition for 1
    else
        x((i - 1) * n + 1:(i - 1) * n + n / 2) = -1;    % Low-to-high transition for 0
        x((i - 1) * n + n / 2:i * n) = 1;               % High-to-low transition for 0
    end
end

% Encoding Signal (Manchester waveform)
figure;
plot(t, x, 'LineWidth', 2);
title('Manchester Encoding: 1 0 1 1 1 0 0 1');
xlabel('Time');
ylabel('Amplitude');
grid on;

% Decoding signal to bitstream
% Initialize counter for decoding
counter = 0;
result = zeros(1, length(bits));  % Preallocate result array

% Loop for decoding
for i = 1:length(t)
    if t(i) > counter
        counter = counter + 1;
        % Sampling the signal at the midpoint of each bit
        if x(i) > 0        
            result(counter) = 0;   % Low-to-high (0 bit)
        else
            result(counter) = 1;   % High-to-low (1 bit)
        end
    end
end

% Display the decoded bitstream
disp('Manchester Decoding:');
disp(result);
