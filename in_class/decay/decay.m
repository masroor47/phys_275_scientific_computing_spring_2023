clear



dt = 0.1;
T = 20;
N0 = 1e4;
lambda = 0.2;
t = (0:dt:T)';

total_nums = zeros(size(t));
trials = 10;

for i = 1 : trials
    nums = decay_func(N0, lambda, dt, T);
    total_nums = total_nums + nums;
end

semilogy(total_nums / trials);



function nums = decay_func(N0, lambda, dt, T)
    t = (0:dt:T)';
    nums = zeros(size(t));
    nums(1) = N0;

    for i = 1:length(t) - 1
%       copy number of nuclei from last time step  
        nums(i+1) = nums(i);
%       iter thru each nucleus to see if it decays  
        for j = 1:nums(i+1)
    %       if current nucleus decayed, subtract 1 from nucleus count
            if rand < lambda * dt
                nums(i+1) = nums(i+1) - 1;
            end
        end
    end
end

