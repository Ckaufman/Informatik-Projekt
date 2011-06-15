function [ sum ] = SQ( a,n,fun )
% "Sum of Square"
% a = enthält m x m Stützstellen
% n = Auflösung der Funktionen f(x,y), und g(x,y)
% sum = Rückgabe quadratische Differenz von [f(x)-g(x)]^2 über alle 
% Möglichen Werte von g(x,y)
% fun = Übergabeparameter, welcher die zu verwendende Funktion g(x,y)
% bestimmt

max=n;
sum=0;
for y=0:max
   for x=1:max
   % disp(f(x,a))
   % disp(g(x))
   % disp('--')
	sum=sum + ( f(x,y,a,n)-g(x,y,n,fun) )^2 ;
	end
end

end

