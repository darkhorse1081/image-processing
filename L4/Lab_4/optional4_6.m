% ex 4.6

x = linspace(-1, 1, 10);
y = linspace(-2, 2, 10);

final = zeros(length(y), length(x));
for i = length(x)
    for j = length(y)
        final(i,j) = 1 / exp((5*x(i))^2 + (5*y(j))^2);
    end
end

mesh(x, y, final);
title('Surface using Method 1');
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
