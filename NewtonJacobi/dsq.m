function [ ret ] = dsq( a,select,h,n )
% Ableitung der Sum of Squares nach dem mit select definierten Wert aus dem a-Vektor

% fixe Version mit nur 3 möglichen Ableitungen
% ret=[0 0 0]';
% ret(1)= (  sq([a(1)+h a(2)     a(3)   ]' ,n) - sq(a,n)  ) / h ;
% ret(2)= (  sq([a(1)   a(2)+h   a(3)   ]' ,n) - sq(a,n)  ) / h ;
% ret(3)= (  sq([a(1)   a(2)     a(3)+h ]' ,n) - sq(a,n)  ) / h ;
% ret=res(select);

% Ableitung für beliebig grosse A-Vektoren
ah=a;
ah(select)=ah(select)+h;
ret= (  sq(ah, n) - sq(a, n)  ) / h ;