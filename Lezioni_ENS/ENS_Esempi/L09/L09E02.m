%% Lezione 09 - Esempio 02
clear all;
clc;

b = [1 0];
a = [1 1/2];

figure
set(gca, 'FontSize', 14);
zplane(b, a);
