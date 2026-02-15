function Jout = mat_connect(J0, J2, thetav)
n = length(thetav);
Jout = zeros([n n]);

for i = 1:n
    for j = 1:n
           Jout(i,j) = -J0 +J2 * cos(2*(thetav(i)-thetav(j)));
    end
end
end