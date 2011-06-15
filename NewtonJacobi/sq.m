function [ sum ] = sq( a,n )
%SQ Quadratische Differenz (f(x)-g(x))^2 von 0 bis n
ss=size(a,2);  
sum=0;

for x=0:n
	sum=sum+  (f(x,a,n) - g(x,n))^2;
	
end



