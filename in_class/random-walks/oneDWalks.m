clear

n = 1000;
x = zeros(n);
curr = 0;

for i = 1:n
    
    if rand < 0.5
        curr = curr + 1;
    else
        curr = curr - 1;
    end
    x(i) = curr;
end

plot(x)