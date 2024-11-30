%% Lezione 02 - Sequenza Porta
clear all;
clc;

n = [-10:10];
y = zeros(1, 21);
y(6:16) = 1;
figure
set(gca,'FontSize',14)
stem(n, y, 'k')
xlabel('n')
title('p_{10}(n)')
axis([-10 10 -0.5 1.5])
grid on