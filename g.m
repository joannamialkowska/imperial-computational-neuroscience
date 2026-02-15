function g_out = g(h, beta, T)
g_out = zeros(size(h));
for i = 1:length(h)
    if h(i) <= T
        g_out(i) = 0;
    elseif (h(i) > T) & (h(i) <= (T + 1/beta))
        g_out(i) = beta * (h(i) - T);
    elseif h(i) > (T + 1/beta)
        g_out(i) = 1;
    end
end
end