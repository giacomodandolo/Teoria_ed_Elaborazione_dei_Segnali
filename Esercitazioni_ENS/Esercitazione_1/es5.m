clear all;
clc;

n = 0:1:10;
x = @(n) 5.*cos((5*pi.*n)./3);
y = x(n);
ac = xcorr(y,y);
[a, locs] = findpeaks(ac);
N = mean(diff(locs))

fig = figure(1);
axes = axes('parent', fig);
stem(axes, n, y, 'filled');
xlabel('n');
ylabel('x[n]');
title('x[n]');

pause;
close
