a = 2;
b = 4;
h = 0.2;
i = 0;
x0 = 2;
z0 = -2;
y0 = 1;

function f_value = f (x, y, z)
f_value = z;
endfunction;

function g_value = g (x, y, z)
g_value = 2 * z - y;
endfunction;

shape = (b - a) / h + 1;

result_matrix = zeros(shape, 3);
result_matrix(1, 1) = x0;
result_matrix(1, 2) = y0;
result_matrix(1, 3) = z0;

for i=1:shape-1
xi = result_matrix(i, 1);
yi = result_matrix(i, 2);
zi = result_matrix(i, 3);
k0 = h * f(xi, yi, zi);
l0 = h * g(xi, yi, zi);
k1 = h * f(xi + h/2, yi + k0/2, zi + l0/2);
l1 = h * g(xi + h/2, yi + k0/2, zi + l0/2);
k2 = h * f(xi + h/2, yi + k1/2, zi + l1/2);
l2 = h * g(xi + h/2, yi + k1/2, zi + l1/2);
k3 = h * f(xi + h, yi + k2, zi + l2);
l3 = h * g(xi + h, yi + k2, zi + l2);
result_matrix(i+1, 1) = result_matrix(i, 1) + h;
result_matrix(i+1, 2) = result_matrix(i, 2) + 1/6 * (k0 + 2*k1 + 2*k2 + k3);
result_matrix(i+1, 3) = result_matrix(i, 3) + 1/6 * (l0 + 2*l1 + 2*l2 + l3);
endfor;

% Built-in methods

function ret = model (y, t)
u = y(1);
v = y(2);
ret(1) = v;
ret(2) = 2 * v - u;
endfunction;

resp = lsode("model", [1; -2], result_matrix(:, 1));