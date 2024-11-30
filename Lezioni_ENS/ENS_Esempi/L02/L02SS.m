%% Lezione 02 - Sequenza sinc
clear all;
clc;

n = [-10:10];
y = sinc(n/3);
figure
set(gca,'FontSize',14)
stem(n, y, 'k')
xlabel('n')
title('sinc(n/3)')
axis([-10 10 -0.5 1.5])
grid on