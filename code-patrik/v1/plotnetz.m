function [ ok ] = plotnetz( values,fig,clearflag  )
%PLOTNETZ Summary of this function goes here
%   Detailed explanation goes here
xmax=size(values,2)
ymax=size(values,1)

%how handle existing figure
if clearflag==1
    clf
end
if clearflag==0
    hold on
end
% select figure
figure(fig)
grid on
hold on
xlabel('x-Achse')
ylabel('y-Achse')

% plot
xl=1;
xh=2;
yl=3;
yh=4;

flaeche=[xl xh xh xl xl;       yl yl yh yh yl;       2  3 5 4 2];

  plot3(flaeche(1,:),flaeche(2,:),flaeche(3,:))
  flaeche
ok=1;
figure(3)
clf
grid on
hold on
surface(values)
plotinter(3.3,3.3,2)
end

