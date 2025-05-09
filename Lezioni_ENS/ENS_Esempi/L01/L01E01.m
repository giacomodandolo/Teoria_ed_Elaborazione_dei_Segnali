%% Lezione 01 - Esempio 01
clear all;
clc;

%% Funzione originale
% x(n)
n = [0:20];
x = sin(2*pi*n./40);

stem(n, x)
axis([0 20 -0.5 1.5])
title('x(n)')
xlabel('n')
grid on

pause;
close

%% Sottocampionamento
% x(2n)
x_new_2 = downsample(x, 2);
n_new_2 = [0:length(x_new_2)-1];
stem(n_new_2, x_new_2)
axis([0 20 -0.5 1.5])
title('x(2n)')
xlabel('n')
grid on

pause;
close

% x(4n)
x_new_4 = downsample(x, 4);
n_new_4 = [0:length(x_new_4)-1];
stem(n_new_4, x_new_4)
axis([0 20 -0.5 1.5])
title('x(4n)')
xlabel('n')
grid on

pause;
close

