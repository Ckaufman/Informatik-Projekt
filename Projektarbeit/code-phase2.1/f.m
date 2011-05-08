function [ y ] = f( x,a )
% f gibt den linear interpolierten Wert an der Position x zwischen den
% Stützstellen in a zurück

aufl=101;                   % Anzahl Werte zwischen 1 und letzter Stützstelle
n=size(a,1);                % Anzahl Stützstellen
abstand= (aufl-1)/(n-1);    % Abstand zwischen den Stützstellen
stuetzpos=0:abstand:100;    % x Positionen der Stützstellen

if (x>=0) && (x<100)
    %linear zwischen den Werten des a-Vektors interpolieren
    lowStuetzPos = floor((x/(abstand))+1);   % 1. Stützstelle
    highStuetzPos= lowStuetzPos+1;           % 2. Stützstelle
    A= a(lowStuetzPos);                      % Wert der 1. Stützstelle
    B= a(highStuetzPos);                     % Wert der 2. Stützstelle
    y= interpolate((x-(lowStuetzPos-1)*abstand),A,B,abstand);
   
elseif (x==100)
    y=a(n);
else
    y=0;
end
y;
end

