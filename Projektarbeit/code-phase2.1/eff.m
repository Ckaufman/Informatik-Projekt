function [ v ] = eff( a,l )
% berechnet den Vektor v als Wertetabelle mit den Stützstellen von a
if size(a(1) < a(2))
    a=a'
end

    v=[];
    for i=1:l
        v=[v f(i,a)];
    end
end


