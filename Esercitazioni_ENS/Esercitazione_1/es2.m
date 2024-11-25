clear all;
clc;

delta = @(x) double(x==0);

n = 0:1:5;
nc = 0:1:10;
x1 = @(n) delta(n) + 2*delta(n-1) + delta(n-2);
x2 = @(n) 3*delta(n) + 2*delta(n-1) + delta(n-2);

%% x1
y1 = x1(n);
fig1 = figure(1);
axesFig1 = axes('Parent', fig1);
stem(axesFig1, n, y1, 'filled');
xlabel('n');
ylabel('x1[n]');
title('x1');
pause;
close

%% x2
y2 = x2(n);
fig2 = figure(2);
axesFig2 = axes('Parent', fig2);
stem(axesFig2, n, y2, 'filled');
xlabel('n');
ylabel('x2[n]');
title('x2');
pause;
close

%% conv
y = conv(y1, y2);
fig3 = figure(3);
axesFig3 = axes('Parent', fig3);
stem(axesFig3, nc, y, 'filled');
xlabel('n');
ylabel('x1[n]*x2[n]');
title('conv(x1, x2)');
pause;
close