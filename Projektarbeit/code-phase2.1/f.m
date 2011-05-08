function [ y ] = f( x,a )
% f gibt den linear interpolierten Wert an der Position x zwischen den
% St�tzstellen in a zur�ck

aufl=101;                   % Anzahl Werte zwischen 1 und letzter St�tzstelle
n=size(a,1);                % Anzahl St�tzstellen
abstand= (aufl-1)/(n-1);    % Abstand zwischen den St�tzstellen
stuetzpos=0:abstand:100;    % x Positionen der St�tzstellen

if (x>=0) && (x<100)
    %linear zwischen den Werten des a-Vektors interpolieren
    lowStuetzPos = floor((x/(abstand))+1);   % 1. St�tzstelle
    highStuetzPos= lowStuetzPos+1;           % 2. St�tzstelle
    A= a(lowStuetzPos);                      % Wert der 1. St�tzstelle
    B= a(highStuetzPos);                     % Wert der 2. St�tzstelle
    y= interpolate((x-(lowStuetzPos-1)*abstand),A,B,abstand);
   
elseif (x==100)
    y=a(n);
else
    y=0;
end
y;
end

