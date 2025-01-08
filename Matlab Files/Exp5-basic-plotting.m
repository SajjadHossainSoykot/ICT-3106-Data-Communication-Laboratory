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

