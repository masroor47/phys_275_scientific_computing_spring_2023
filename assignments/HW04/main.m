clear

f1 = @(x) x.^2;


intervals = 10;

disp(['left int: ', num2str(leftint(f1, 0, 1, intervals))]);

disp(['right int: ', num2str(rightint(f1, 0, 1, intervals))]);

disp(['trap int: ', num2str(trap(f1, 0, 1, intervals))]);

disp(['midpoint int: ', num2str(midpoint(f1, 0, 1, intervals))]);


method = "qwert";

disp(['of your choice: ', num2str(int(f1, 0, 1, intervals, method))]);