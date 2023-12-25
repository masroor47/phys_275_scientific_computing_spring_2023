


rawData = importdata("extinctionSpectrum.txt");
lambda = rawData.data(:, 1);
k = rawData.data(:, 2);

% plot(lambda, k);



%%

% converting wavelength to angular frequency
w = 2.*pi.*3e8./lambda;

dw = w(2:end) - w(1:end-1);

n = zeros([length(w), 1]);

%%

% numerator = w.*k;

forN = zeros([length(w), 1]);

for i=1:1000

    currSum = 0;

    for j=1:999
        if(w(i) ~= w(j))
            currSum = currSum + w(i)*k(j)*dw(j) / (w(i)^2 - w(j)^2);
        end
    end
    forN(i) = currSum;
   
end

forN = 1.+(2/pi).*forN;

plot(w, k, w, forN);

