function [ y ] = f( x,a,n )
% a enth�lt beliebig viele St�tzstellen
% Die Funktion gibt den zwischen den St�tzstellen linear interpolierten Funtionswert zur�ck
% wobei n die Aufl�sung angibt, es gilt
% x <= n
% x=0 => y= a(1)
% x=n => y= a("letzter")
% erste St�tzstelle = a(1), letzte = a(size(a,1))
if size(a,2)>size(a,1)
	a=a';
end

if size(a,1)==2
	a1=a(1);
	a2=a(2);
	y= a1+x/n * (a2-a1);
else
	dimension=size(a,1);            % Anzahl �bergebene St�tzstellen
	parts=dimension-1;              % 0 bis n ist in (abh. von dimension) "parts" lineare Bereiche
	ioben  = ceil (x/n*parts)+1;    % i-te St�tzstelle oberhalb der x Position
	iunten = floor(x/n*parts)+1;
	% relative Position
	rel = rem(x,parts);
	if rel == 0
	    y=a(iunten);                % x entspricht einer St�tzstelle
	else
		y= a(iunten) + rel/parts *(a(ioben) - a(iunten));
	end
		
end


end

