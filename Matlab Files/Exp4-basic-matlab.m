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
