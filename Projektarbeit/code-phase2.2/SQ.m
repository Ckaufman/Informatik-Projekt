function [ sum ] = SQ( a,n,fun )
% "Sum of Square"
% a = enth�lt m x m St�tzstellen
% n = Aufl�sung der Funktionen f(x,y), und g(x,y)
% sum = R�ckgabe quadratische Differenz von [f(x)-g(x)]^2 �ber alle 
% M�glichen Werte von g(x,y)
% fun = �bergabeparameter, welcher die zu verwendende Funktion g(x,y)
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

