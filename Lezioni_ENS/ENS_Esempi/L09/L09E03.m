%% Lezione 09 - Esempio 03
clear all;
clc;

b = [2 1/6 0];
a = [1 1/6 -1/6];

figure
set(gca, 'FontSize', 14);
zplane(b, a);
