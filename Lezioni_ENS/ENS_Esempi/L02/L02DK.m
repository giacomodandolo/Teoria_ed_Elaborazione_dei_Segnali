%% Lezione 02 - Delta di Kroenecher
clear all;
clc;

n = [-10:10];
y = zeros(1, 21);
y(11) = 1;
figure
set(gca,'FontSize',14)
stem(n, y, 'k')
xlabel('n')
title('\delta(n)')
axis([-10 10 -0.5 1.5])
grid on

pause;
close