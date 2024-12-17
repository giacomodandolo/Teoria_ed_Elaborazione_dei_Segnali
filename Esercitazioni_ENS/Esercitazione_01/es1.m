clear all;
clc;

delta = @(x) double(x==0);

%% original
n = 0:1:10;
x = @(n) n;
y = x(n);

original = figure(1);
originalAxes = axes('Parent', original);
stem(originalAxes, n, y, 'filled');
xlabel("n");
ylabel("x[n]");
title("original");
pause;
close

%% a
y = x(n+5);

a = figure(2);
aAxes = axes('Parent', a);
stem(aAxes, n, y, 'filled');
xlabel("n");
ylabel("x[n+5]");
title("a");
pause;
close

%% b
y = x(-n+5);

b = figure(3);
bAxes = axes('Parent', b);
stem(bAxes, n, y, 'filled');
xlabel("n");
ylabel("x[-n+5]");
title("b");
pause;
close

%% c
y = x(2.*n);

c = figure(4);
cAxes = axes('Parent', c);
stem(cAxes, n, y, 'filled');
xlabel("n");
ylabel("x[2n]");
title("c");
pause;
close

%% d
nd = [-10:1:10];
y1 = x(nd+10).*((nd + 10 >= 0) & (nd + 10 <= 10));

d = figure(5);
dAxes = axes('Parent', d);
stem(dAxes, nd, y1, 'filled');
xlabel("n");
ylabel("x[n+10] + x[-n+10] - 10delta[n]");
title("d");

hold on

y2 = x(-nd+10).*((-nd + 10 >= 0) & (-nd + 10 <= 10));
stem(nd, y2, 'filled');

y3 = -10.*delta(nd);
stem(nd, y3, 'filled');

hold off
pause;
close

%% e
ne = [-10:1:10];
xp = 1/2 .* (x(ne).*((ne >= 0) & (ne <= 10)) ...
            + x(-ne).*((-ne >= 0) & (-ne <= 10)));

e = figure(6);
eAxes = axes('Parent', e);
stem(eAxes, ne, xp, 'filled');
xlabel("n");
ylabel("xp[n], xd[n]");
title("e");

hold on

xd = 1/2 .* (x(ne).*((ne >= 0) & (ne <= 10)) ...
            - x(-ne).*((-ne >= 0) & (-ne <= 10)));
stem(ne, xd);

hold off
pause;
close

y = xp + xd;

e2 = figure(7);
e2Axes = axes('Parent', e2);
stem(e2Axes, ne, y, 'filled');
xlabel("n");
ylabel("xp[n] + xd[n]");
title("e2");

pause;
close
