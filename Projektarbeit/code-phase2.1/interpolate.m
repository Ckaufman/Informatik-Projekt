function [ y ] = interpolate( x,A,B,n )
% lineare Interpolation zwischen A und B
% x = relative Position zwischen A und B
% A,B = Stützstellen
% n = Abstand zwischen A und B

y = A+((B-A)*(x/n));

end

