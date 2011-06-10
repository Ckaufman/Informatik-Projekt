function [ y ] = f( x,a,n )
% a enthält beliebig viele Stützstellen
% Die Funktion gibt den zwischen den Stützstellen linear interpolierten Funtionswert zurück
% wobei n die Auflösung angibt, es gilt
% x <= n
% x=0 => y= a(1)
% x=n => y= a("letzter")
% erste Stützstelle = a(1), letzte = a(size(a,1))
if size(a,2)>size(a,1)
	a=a';
end

if size(a,1)==2
	a1=a(1);
	a2=a(2);
	y= a1+x/n * (a2-a1);
else
	dimension=size(a,1);            % Anzahl übergebene Stützstellen
	parts=dimension-1;              % 0 bis n ist in (abh. von dimension) "parts" lineare Bereiche
	ioben  = ceil (x/n*parts)+1;    % i-te Stützstelle oberhalb der x Position
	iunten = floor(x/n*parts)+1;
	% relative Position
	rel = rem(x,parts);
	if rel == 0
	    y=a(iunten);                % x entspricht einer Stützstelle
	else
		y= a(iunten) + rel/parts *(a(ioben) - a(iunten));
	end
		
end


end

