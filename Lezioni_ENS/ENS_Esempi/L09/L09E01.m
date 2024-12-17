%% Lezione 09 - Esempio 01
clear all;
clc;

b = [1 0];
a = [1 -1/3];

figure
set(gca, 'FontSize', 14);
zplane(b, a);
