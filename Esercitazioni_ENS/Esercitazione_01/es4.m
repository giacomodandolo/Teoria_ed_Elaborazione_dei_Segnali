clear all;
clc;

delta = @(n) double(n == 0);

% functions
x1 = @(n) - delta(n) + 4.*delta(n-1) + 5.*delta(n-2) - 2.*delta(n-3) - 3.*delta(n-4);
x2 = @(n) - 2.*delta(n) + 3.*delta(n-1) + 5.*delta(n-2) + 4.*delta(n-3) - delta(n-4);
xr = @(n) - delta(n) + 2.*delta(n-2) - delta(n-4);

% values of functions
n = 0:1:4;
y1 = x1(n);
y2 = x2(n);
yr = xr(n);


%% <--- FIRST METHOD --->
disp('<--- First method --->')
% energies
syms k
energy_x1 = sum(y1.^2);
energy_x2 = sum(y2.^2);
energy_xr = sum(yr.^2);

% coefficients
a1 = sqrt(energy_xr/energy_x1);
a2 = sqrt(energy_xr/energy_x2);

% normalized
y1n = a1.*y1;
y2n = a2.*y2;
yr;

% difference signals
e1 = y1n - yr;
e2 = y2n - yr;

% energies difference signals
energy_e1 = sum(e1.^2)
energy_e2 = sum(e2.^2)

%% <--- SECOND METHOD --->
disp('<--- Second method --->')
% correlations
corr_y1 = xcorr(yr, y1);
corr_y2 = xcorr(yr, y2);
corr_yr = xcorr(yr, yr);

% energy correlations
energy_corr_y1 = sum(corr_y1.^2);
energy_corr_y2 = sum(corr_y2.^2);
energy_corr_yr = sum(corr_yr.^2);

% coefficients
b1 = sqrt(energy_corr_yr/energy_corr_y1);
b2 = sqrt(energy_corr_yr/energy_corr_y2);

% normalized correlations
corr_y1n = b1*corr_y1;
corr_y2n = b2*corr_y2;

% difference signals correlations
energy_difference_y1n = sum((corr_yr - corr_y1n).^2)
energy_difference_y2n = sum((corr_yr - corr_y2n).^2)

%% <--- THIRD METHOD --->
disp('<--- Third method --->')
% get sounds
a = audioread('four_noise.wav');
b = audioread('three_noise.wav');
c = audioread('three_ref.wav');

fs = 44100;

disp('Riproduco four_noise.wav')
sound(a, fs); pause
disp('Riproduco three_noise.wav')
sound(b, fs); pause
disp('Riproduco three_ref.wav')
sound(c, fs); pause

% energies
disp('Energie dei segnali originali')
E_x1 = sum(a.^2)
E_x2 = sum(b.^2)
E_xr = sum(c.^2)

% normalized functions
x1n = a./sqrt(E_x1).*sqrt(E_xr);
x2n = b./sqrt(E_x2).*sqrt(E_xr);

% normalized energies
E_x1n = sum(x1n.^2)
E_x2n = sum(x2n.^2)

% energies difference signals
disp('Energie dei segnali errori')
E_e1 = sum((a - c).^2)
E_e2 = sum((b - c).^2)

% cross correlations
Rc1 = xcorr(c, a);
Rc2 = xcorr(c, b);
Rr = xcorr(c, c);

% energy cross correlations
disp('Energie delle cross correlazioni')
E_Rc1 = sum(Rc1.^2)
E_Rc2 = sum(Rc2.^2)
E_Rr = sum(Rr.^2)

% normalized cross correlations
Rc1n = Rc1*sqrt(E_Rr/E_Rc1);
Rc2n = Rc2*sqrt(E_Rr/E_Rc2);

% energy difference cross correlations
disp('Energie delle differenze tra cross correlazioni')
E_diff1 = sum((Rc1n - Rr).^2)
E_diff2 = sum((Rc2n - Rr).^2)
