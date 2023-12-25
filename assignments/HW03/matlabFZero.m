clear

%%
fun = @sin;
x0 = 3;
x = fzero(fun, x0)

%%
fun = @cos;
x0 = [0, 1];
x = fzero(fun, x0)


%%
f = @(x) x.^3 - 2*x - 5;
fun = f;
x0 = 2;
z = fzero(fun, x0)

%%
fun = @(x) cos(x) - x;
x0 = [0, 1];
options = optimset('Display', 'iter');
[x fval exitflag output] = fzero(fun, x0, options)

%%
