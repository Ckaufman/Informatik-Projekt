function [ res ] = g( x,y,n )
% g(x,y,n) gibt den Funktionswert an der Koordinate x,y zur�ck
%   n      Aufl�sung in x oder y Richtung

res=zeros(size(y,2),size(x,2));
% H�gel
d=size(y);
d(2);
for i=1:d(2)
   res(i,:)= sin(x/n*pi).*sin(y(i)/n*pi);
end

%Fl�che
 %res = x+y
end

