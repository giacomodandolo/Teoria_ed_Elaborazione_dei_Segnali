%% Lezione 02 - Sequenza triangolo
clear all;
clc;

N = 10;
n = [-N:N];
y = 1-abs(n)/N;
figure
set(gca,'FontSize',14)
stem(n, y, 'k')
xlabel('n')
title('t_{20}(n)')
axis([-10 10 -0.5 1.5])
grid on