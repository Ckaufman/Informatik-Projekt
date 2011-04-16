function [ ok ] = plotit( values,clearflag )
% --- Executes on button press in navright.

xmax=size(values,2)
ymax=size(values,1)
gcf
%how handle existing figure
if clearflag==1
    clf
end
if clearflag==0
    hold on
end

% plot
for x=1:xmax
    for y=1:ymax
        stuetz=[x, x; y, y; 0, values(y,x)]
        plot3(stuetz(1,:),stuetz(2,:),stuetz(3,:))
    end
end


ok=1

end
end

