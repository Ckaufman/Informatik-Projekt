function [ ok ] = plotstab( values,fig,clearflag )
%PLOTSTAB plottet die Werte des 2D values Arrays in einem 3D Raum
% mit den einzelnen Werten äls Säulenstäben
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
for x=1:xmax
    for y=1:ymax
        stuetz=[x, x; y, y; 0, values(y,x)]
        plot3(stuetz(1,:),stuetz(2,:),stuetz(3,:))
    end
end


ok=1
view(45,45)
end

