%% Lezione 02 - Sequenza esponenziale
clear all;
clc;

n = [-10:10];
a = (2/3);
y = a.^n.*(n>=0);
figure
set(gca,'FontSize',14)
stem(n, y, 'k')
xlabel('n')
title('(2/3)^n')
axis([-10 10 -0.5 1.5])
grid on