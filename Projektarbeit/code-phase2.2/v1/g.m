function [ res ] = g( x,y,n )
% g(x,y,n) gibt den Funktionswert an der Koordinate x,y zurück
%   n      Auflösung in x oder y Richtung

res=zeros(size(y,2),size(x,2));
% Hügel
d=size(y);
d(2);
for i=1:d(2)
   res(i,:)= sin(x/n*pi).*sin(y(i)/n*pi);
end

%Fläche
 %res = x+y
end

