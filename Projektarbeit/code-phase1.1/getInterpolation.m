function [h] = getInterpolation(u,values)
% Funktion welche interpolate(Q,u) mit den richtigen Werten aufruft
% u = x,y Koordinaten der gewüschnten Stelle
% Q = die 4 benachbarten bekannten Stützstellen

xlow= floor(u(1));
ylow= floor(u(2));
xhigh= ceil(u(1));
yhigh= ceil(u(2));
Q=[ xlow  ylow  values(ylow,  xlow); 
    xhigh ylow  values(ylow,  xhigh); 
    xlow  yhigh values(yhigh, xlow);
    xhigh yhigh values(yhigh, xhigh)];
h = interpolate(Q,u);
% dabei sind:
% x=h(1);
% y=h(2);
h=h(3);