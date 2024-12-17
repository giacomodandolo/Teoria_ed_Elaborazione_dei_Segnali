clear all;
clc;

n = -10:1:10;

%% a
x = @(n) exp(-n) .* (n >= 0);

y = x(n);
fig1 = figure(1);
axesFig1 = axes('parent', fig1);
stem(axesFig1, n, y, 'filled');
axis([-13 13 -2 2]);
xlabel('n');
ylabel(['x[n]']);
title('a');

syms ne k;
energy_A = symsum(exp(-2.*k), k, 0, inf)
energy_value_A = vpa(energy_A)

syms N k;
power_A = limit(symsum(1/(2*N+1)*(exp(-2*k)), k, -N, N), N, inf)
power_value_A = vpa(power_A)

pause;
close

%% b
A = 2;
x = @(n) A.*(n>=0 | n < 0);

y = x(n);
fig2 = figure(2);
axesFig2 = axes('parent', fig2);
stem(axesFig2, n, y, 'filled');
axis([-13 13 -3 3]);
xlabel('n');
ylabel(['x[n]']);
title('a');

syms ne k;
energy_B = symsum(2^2, k, -inf, inf)
energy_value_B = vpa(energy_B)

syms N k;
power_B = limit(symsum(1/(2*N+1)*(2^2), k, -N, N), N, inf)
power_value_B = vpa(power_B)

pause;
close

%% d
x = @(n) A.*(n >= 0);

y = x(n);
fig3 = figure(3);
axesFig3 = axes('parent', fig3);
stem(axesFig3, n, y, 'filled');
axis([-13 13 -3 3]);
xlabel('n');
ylabel(['x[n]']);
title('a');

syms ne k;
energy_D = symsum(A^2, k, 0, inf)
energy_value_D = vpa(energy_B)

syms N k;
power_D = limit(symsum(1/(2*N+1)*(A^2), k, 0, N), N, inf)
power_value_D = vpa(power_D)

pause;
close

%% e
n0 = 0;
x = @(n) A.*((n-n0 <= 2) & (n-n0 >= -2));

y = x(n);
fig4 = figure(4);
axesFig4 = axes('parent', fig4);
stem(axesFig4, n, y, 'filled');
axis([-13 13 -3 3]);
xlabel('n');
ylabel(['x[n]']);
title('a');

syms ne k;
energy_E = symsum(A^2, k, -2, 2)
energy_value_E = vpa(energy_E)

syms N k;
power_E = limit(symsum(1/(2*N+1)*(A^2), k, -2, 2), N, inf)
power_value_E = vpa(power_E)

pause;
close
