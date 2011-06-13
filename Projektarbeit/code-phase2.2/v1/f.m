function [ H ] = f( x,y,a,n )
% H = linear interpolierter St�tzwert bei Funktion mit 2 Parametern x,y
% a = Quadratische Matrix mit gegebenen St�tzwerten
% n = Aufl�sung der Funktion in x und y Richtung

% Position x,y liegt zwischen welchen St�tzwerten der Matrix a?
%% Position innerhalb a
ax= x/(n)* (size(a,2)-1)+1;
ay= y/(n)* (size(a,1)-1)+1;

%% benachbarte a(i)'s
% A,B,C,D sollen benachbarte a(i)'s im Uhrzeigersinn enthalten
% Achtung: a(Zeile, Spalte)=a(y-Werte,x-Werte)
A= a( floor(ay),floor(ax) );
B= a( floor(ay),ceil(ax)  );
C= a( ceil (ay),ceil(ax)  );
D= a( ceil (ay),floor(ax) );

%% linear interpolierter Funktionswert
H1= A+( (B-A)*(ax-floor(ax)) );
H2= D+( (C-D)*(ay-floor(ay)) );
H = H1+ (H2-H1)*(ay-floor(ay));

end

