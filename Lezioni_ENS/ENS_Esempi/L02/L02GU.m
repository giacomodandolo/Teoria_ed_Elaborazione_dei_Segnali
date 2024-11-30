%% Lezione 2 - Gradino unitario
clear all;
clc;

n = [-10:10];
y = zeros(1, 21);
y(11:21) = 1;
figure
set(gca,'FontSize',14)
stem(n, y, 'k')
xlabel('n')
title('u(n)')
axis([-10 10 -0.5 1.5])
grid on

pause;
close