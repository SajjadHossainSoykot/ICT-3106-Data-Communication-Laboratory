% MATLAB Combined Script: For Loop, If-Else, and Graph Plotting

% Section 1: For Loop Example - Display numbers from 1 to 10
disp('For Loop Example: Displaying Numbers from 1 to 10');
for i = 1:10
    fprintf('%d ', i); % Display the current number on the same line
end
fprintf('\n'); % Add a new line after printing all numbers

% Section 2: If-Else Example - Check if the number is even or odd
disp(' ');
num = input('Enter a number to check if it is even or odd: '); % User input
if mod(num, 2) == 0
    disp('The number is even.');
else
    disp('The number is odd.');
end

%Graph Plotting Example - Plot a Sine Wave
disp(' ');
x = 0:0.1:10;  % Define x-axis values from 0 to 10 with step size of 0.1
y = sin(x);    % Define y-axis values using the sine function

% Plot the sine wave
figure;        % Open a new figure window
plot(x, y, 'Linewidth', 2);    % Plot x against y
xlabel('X-axis');
ylabel('Y-axis');
title('Sine Wave');
grid on;       % Add grid to the plot

