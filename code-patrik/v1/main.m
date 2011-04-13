% Testdaten Halbkugel
values=[]
hold on
for i=1:5
    values=[values; sin(0.05:((pi-.1)/9):(pi-.05))*sin(i*pi/20)];
    %plot(sin(0.05:((pi-.1)/9):(pi-.05))*sin(i*pi/20));
    i
end
for i=4:-1:0
    values=[values; sin(0.05:((pi-.1)/9):(pi-.05))*sin(i*pi/20)];
    i
end
values;
size(values)

% Interpolations Aufruf vorbereiten
% Q enthält 4 Eckpunkte & Höhen
% u gewünschte Zwischenstelle u=[x y]'
% Q=[x1 y1 h1;x2 y2 h2; x3 y3 h3; x4 y4 h4]
% 
u=[3.3 5.2]
xlow= floor(u(1))
ylow= floor(u(2))
xhigh= ceil(u(1))
yhigh= ceil(u(2))
Q=[xlow ylow values(ylow,xlow); 
    xhigh ylow values(ylow, xhigh); 
    xlow yhigh values(yhigh, xlow);
    xhigh yhigh values(yhigh, xhigh)]


plotstab(values,1,1);
% plot Stützstelle an beliebigem Ort
x=u(1)
y=u(2)
value=1 % aus interpol3(Q,u)
plotinter(x,y,value)
plotnetz(values,1,1)