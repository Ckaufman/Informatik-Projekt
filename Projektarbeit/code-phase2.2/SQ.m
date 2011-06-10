function [ sum ] = SQ( a,n )
% "Sum of Square"
% Eingabe Vektor g (Grundfunktion als Wertetabelle)
%         a enth�lt Werte bei den 5 St�tzstellen
% R�ckgabe quadratische Differenz von [f(x)-g(x)]^2 als Wert

max=n+1;
sum=0;
for y=0:max
   for x=1:max
   % disp(f(x,a))
   % disp(g(x))
   % disp('--')
	sum=sum + ( f(x,y,a,n)-g(x,y,n) )^2 ;
	end
end

end

