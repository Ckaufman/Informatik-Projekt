function [ y ] = g( x,n )
%G mit y+1 nach oben verschobener Sinus


% unterschiedliche Funktionen hier einpflegen

%% Sinus + 1
% y=1+sin(x/n*pi);

%% Polynom
w=-4.3:(4.3+3.3)/(n):3.3;
g=0.6*((w+4).*(w+2).*(w+1).*(w-1).*(w-3)+87);
y=g(x+1);


end

