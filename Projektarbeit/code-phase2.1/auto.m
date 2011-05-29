function [ anew ] = auto( a, g )

a = a';

% Funktion G = 50+40*sin(x) - Ableitung G' = 40*cos(x)
for i = 1 : 5
J(i,1) = 40*cos(a(i,1)); %Jacobi
G(i,1) = 50+40*sin(a(i,1))-a(i,1); 
end

% Optimierungsschritte - tbd
for i = 1:3
a = a - J \ G;
end

anew = a

end

