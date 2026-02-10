% Integrate and Fire Model

%% Code integrate and fire model
tauv = 10; %time constant, ms
R = 1; %resistance
vth = 10; %threshold
v = 0; %initialize v
dt = 1; %timestep, ms

% Simulate neuron model
figure; 
hold on; 

for I = [9 11 15]
    dvdt = (-v + R*I)/tauv; %calculate dvdt for given current
    result = zeros([1 100]); %initialize result matrix
    for i=1:100
        v_new = v + dvdt * dt;
        if v_new > vth
            v = 0; 
        else
            v = v_new;
        end
        result(i) = v_new; %append result
    end
    plot(result, 'DisplayName', ['I = ' num2str(I)])
end

hold off;
legend show;

% Conclusion: Given higher current, the neuron spikes faster
