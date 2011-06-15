function [ ret ] = dsq( a,select,h,n,fun )
% Ableitung der Sum of Squares nach dem mit select definierten Wert aus dem a-Vektor
% a und select k�nnen auch Matrix/XY-Vektor Kombination sein
% a = Matrix der gesuchten St�tzstellen
% select = Koordinate der gew�nschten Ableitung
% h = Schrittweite f�r Ableitung
% n = max. Aufl�sung der Funktionen
% fun = �bergabeparameter, welcher die zu verwendende Funktion g(x,y)
% bestimmt
res=[0 0 0]';

% fixe Version mit nur 3 m�glichen Ableitungen
% res(1)= (  sq([a(1)+h a(2)     a(3)   ]' ,n) - sq(a,n)  ) / h ;
% res(2)= (  sq([a(1)   a(2)+h   a(3)   ]' ,n) - sq(a,n)  ) / h ;
% res(3)= (  sq([a(1)   a(2)     a(3)+h ]' ,n) - sq(a,n)  ) / h ;
% ret=res(select);

% Ableitung f�r beliebig grosse A-Vektoren
aneu=a;
aneu(select(1),select(2))=aneu(select(1),select(2))+h;
[a aneu ];
ret= (  SQ( aneu,n,fun) - SQ(a,n,fun)  ) / h ;