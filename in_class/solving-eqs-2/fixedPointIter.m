

clear
format long

g = @(x) x + cos(x) - sin(x);
r = 0.78539816339;

curr = 0;
next = 0;
error_curr = 0;
error_prev = 0;

file = fopen('results.txt', 'wt');
fprintf(file, 'Cool Approximation Results\n\n');
fprintf(file, '%2s %8s %11s %11s %11s\n', 'i', 'x', 'g(x)', 'ei', 'ei/ei-1');

for i = 1:20
     
    next = g(curr);
    
    error_curr = abs(curr - r);
    disp(['x = ', num2str(curr), ', g(x) = ', num2str(next), ', curr = ', num2str(error_curr), ', prev = ', num2str(error_prev)]);
    fprintf(file, '%2i %11.7f %11.7f %11.7f %7.3f\n', i, curr, next, error_curr, error_curr/error_prev);
    error_prev = error_curr;
    curr = next;

    pause(0.1);

end

fclose(file);