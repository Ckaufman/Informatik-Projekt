function [ sum ] = SQ( g,a )
% "Sum of Square"
% Eingabe Vektor g (Grundfunktion als Wertetabelle)
%         a enthält Werte bei den 5 Stützstellen
% Rückgabe quadratische Differenz von [f(x)-g(x)]^2 als Wert

l=size(g,2);
sum=0;

for x=1:l-1
   % disp(f(x,a))
   % disp(g(x))
   % disp('--')
    sum=sum+(f(x,a)-g(x))^2;
end


end

