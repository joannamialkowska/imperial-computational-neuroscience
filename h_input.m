function h_ext = h_input(N, theta0, thetav, c, epsilon)
h_ext = zeros([1 N]);
for i = 1:N
    h_ext(i) = c * ((1 - epsilon) + epsilon * cos(2 * (thetav(i) - theta0)));
end
end