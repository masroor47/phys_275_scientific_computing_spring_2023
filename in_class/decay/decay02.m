
clear





N0 = [1e5, 0, 0];

lambda = [0.2, 0.1, 0.1, 0.2];

dt = 0.1;
T = 30;
t = (0:dt:T)';

total_nums = zeros([length(t), length(lambda)]);
% size(total_nums)

trials = 1;

for i = 1 : trials
    nums = decay_func(N0, lambda, dt, T);
%     size(nums)
%     size(total_nums)
    total_nums = total_nums + nums;
end

semilogy(t, total_nums(:, 1) / trials, t, total_nums(:, 2) / trials, t, total_nums(:, 3) / trials);



function N = decay_func(N0, lambda, dt, T)

    t = (0:dt:T)';
    N = zeros([length(t), length(N0)]);
%     size(N)

    N(1,:) = N0;

    for i = 1:length(t) - 1

%       copy number of nuclei from last time step  
        N(i+1, :) = N(i, :);

%       iter thru each nucleus to see if it decays  
        for j = 1:N(i,1)
            toss = rand;

    %       if current nucleus decayed, subtract 1 from nucleus count
            if toss < lambda(1) * dt
                N(i+1, 1) = N(i+1, 1) - 1;
                N(i+1, 2) = N(i+1, 2) + 1;
            elseif toss < (lambda(1) + lambda(3)) * dt
                N(i+1, 1) = N(i+1, 1) - 1;
                N(i+1, 3) = N(i+1, 3) + 1;
            end
        end

        for j = 1:N(i, 2)
            if rand < lambda(2) * dt
                N(i+1, 2) = N(i+1, 2) - 1;
            end
        end

        for j = 1:N(i, 3)
            if rand < lambda(2) * dt
                N(i+1, 3) = N(i+1, 3) - 1;
            end
        end
    end
end

