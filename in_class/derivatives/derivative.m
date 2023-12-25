clear

f = @(x) exp(x);

repeat = 10000;
errorsFM = zeros([repeat, 1]);
errorsCM = zeros([repeat, 1]);
% hVals = zeros([repeat, 1]);
hVals = logspace(-1, -16, repeat);

% h = 0.1;
x = 0;

for i=1: repeat
    h = hVals(i);

    df_FM = (f(x + h) - f(x)) / h;

    df_CM = (f(x + h) - f(x - h)) / (2 * h);
    
    
    errDf = df_FM - 1;
    errCM = df_CM - 1;

    errorsFM(i) = abs(errDf);
    errorsCM(i) = abs(errCM);

end
% x = linspace(1, repeat, repeat);

% plot(hVals, errors);
loglog(hVals, errorsFM, hVals, errorsCM);


% function dy = FD(f, x, h)
%     dy = (f(x + h) - f(x)) / h;
% end