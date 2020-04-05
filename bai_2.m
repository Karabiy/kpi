X = [0, 1, 2, 3, 4, 5];
Y = [3.2, 7.8, 15.3, 23.6, 35.5, 47.5];
calculation_data = nan(6, 7);
calculation_data(:, 1) = X;
calculation_data(:, 2) = Y;
calculation_data(1:5, 3) = diff(calculation_data(:, 2));
calculation_data(:, 4) = log(calculation_data(:, 3));
for i=1:5
calculation_data(i, 5) = (calculation_data(i, 1) + calculation_data(i+1, 1)) / 2
end;
calculation_data(:, 6) = calculation_data(:, 5) .^ 2;
calculation_data(:, 7) = calculation_data(:, 5) .* calculation_data(:, 4);

ln_dyt_sum = sum(calculation_data(1:5, 4));
dxt_sum = sum(calculation_data(1:5, 5));
dxt_sqr_sum = sum(calculation_data(1:5, 6));
dxt_ln_dyt_sum = sum(calculation_data(1:5, 7));

[a, b] = deal(num2cell(([5, dxt_sum; dxt_sum, dxt_sqr_sum]\[ln_dyt_sum; dxt_ln_dyt_sum])'){:});

B = b;
A = exp(a) / B;

calculate_c_data = zeros(6, 3);
calculate_c_data(:, 1) = X;
calculate_c_data(:, 2) = A * exp(B * X);
calculate_c_data(:, 3) = Y - calculate_c_data(:, 2)';

C = sum(calculate_c_data(:, 3)) / 6;

plot(X, Y, X, A * exp(B * X) + C);

func = @(x, p) p(1) * exp(p(2) * x) + p(3)
[f1, p1, kvg1, iter1, corp1, covp1, covr1, stdresid1, Z1, r21] = leasqr(X, Y, [0, 0, 0], func)
