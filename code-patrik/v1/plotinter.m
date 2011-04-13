function [ ok ] = plotinter( x,y,value )
%PLOTINTER Summary of this function goes here
%   Detailed explanation goes here

line=[x x;y y; 0 value];
set(line,'LineWidth',2)
plot3(line(1,:),line(2,:),line(3,:),'r')

ok=1
end

