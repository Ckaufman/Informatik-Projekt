function [ g ] = g( x,y,n, fun )
% g(x,y,n) gibt den Funktionswert an der Koordinate x,y zurück
%   n      Auflösung in x oder y Richtung

g =zeros(size(y,2),size(x,2));

switch fun
    case 1
        % Hügel
%         d=size(y);
%         disp('dimension d:')
%         d(2)
%         for i=1:d(2)
%             g(i,:)= sin(x/n*pi).*sin(y(i)/n*pi);
%         end
        g= sin(x/n*pi)*sin(y/n*pi);
    case 2
        %Fläche
        g = x+y;
        
    case 3
        g = sin(x/n*2*pi)+cos(y/n*2*pi);
    case 4
        g = 0;
        if (x > 0.5*n)
            g=1; 
        end
        if (y > 0.5*n)
            g=1;
        end
        
    case 5
        g = 0;
        if (x == 20) 
            g=1; 
        end;
        if (y == 20) 
            g=1; 
        end;
end

