A = [3 2 1; 1 6 2; 5 2 3; 4 2 1]
b = [15;16;17;15]
gram_matrix = A'*A
[V, lambda] = eig(gram_matrix)
L = sqrtm(rot90(rot90(lambda)))
V = rot90(V)
norms = zeros(rows(A), rows(A))

for i = 1:rows(V)
my_norm = (A * V(i, :)') / norm(A * V(i, :)', 2)
norms(i, :) = my_norm
endfor

norms(rows(A), :) = null(A')

my_diag = zeros(rows(V), rows(U))

for i = 1:rows(L)
my_diag(i, i) = 1 / L(i,i)
endfor

X = V'*my_diag*U*b
r = b - A * X
norm(r)

[U, L, V] = svd(A)

my_diag = zeros(rows(V), rows(U))

for i = 1:rows(L)
my_diag(i, i) = 1 / L(i,i)
endfor

X = V*my_diag*U'*b

r = b - A * X

norm(r)
