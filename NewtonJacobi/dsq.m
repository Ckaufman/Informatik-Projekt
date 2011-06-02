function [ ret ] = dsq( a,select,h,n )
% Ableitung der Sum of Squares nach dem mit select definierten Wert aus dem a-Vektor
res=[0 0 0]';

% fixe Version mit nur 3 möglichen Ableitungen
% res(1)= (  sq([a(1)+h a(2)     a(3)   ]' ,n) - sq(a,n)  ) / h ;
% res(2)= (  sq([a(1)   a(2)+h   a(3)   ]' ,n) - sq(a,n)  ) / h ;
% res(3)= (  sq([a(1)   a(2)     a(3)+h ]' ,n) - sq(a,n)  ) / h ;
% ret=res(select);

% Ableitung für beliebig grosse A-Vektoren
aneu=a;
aneu(select)=aneu(select)+h;
ret= (  sq([ aneu ] ,n) - sq(a,n)  ) / h ;