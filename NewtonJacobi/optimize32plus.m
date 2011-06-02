% Demo zur Verfikation des Algorithmus
% Verarbeitet ein a mit 3 Stützstellen
%
% => fn(x) wurde am Ort der Stützstelle berechnet, müsste es nicht das Intervall des 
a=[1.6 1.6 1.6 1.6 1.6,1.7,2,3]';		% Stützstellen

n=80;					% Zwischenschritte zw. Stützstellen
%x=1;					% Distanz zwischen zwei Stützstellen
h=0.1;					% Ableitungsinkrement
dimension=size(a,1);
J=zeros(dimension);
fn=zeros(dimension,1);
sqalt=100000;
sqneu=0;
B=J;
clf

 %%% Original Funktion plotten
 max=50;
plot(0:n,g(0:n,n))
hold on
disp ('press return to continue')
pause
%%%%%%%%

while sqneu<sqalt
	disp('>>> next')
	sqalt= sq(a,n);
	
    % wrong ones:
    % fn0=sq(a,n) 		% = quad. Differenz von x0-x1: (fn(x)-g(x)) ^2
	%fn(1)=(  sq([a(1)+h a(2)     a(3)   ]' ,n) - sq(a,n)  ) / h ;
	%fn(2)=(  sq([a(1)   a(2)+h   a(3)   ]' ,n) - sq(a,n)  ) / h ;
	%fn(3)=(  sq([a(1)   a(3)     a(3)+h ]' ,n) - sq(a,n)  ) / h ;
    % fn(1)=(f(0,a,n)  -  g(0,n))^2;
	% fn(2)=(f(5,a,n)  -  g(5,n))^2;
	% fn(3)=(f(10,a,n) - g(10,n))^2;
	%dsq1=  (  sq([a(1)+h a(2)     a(3)],n)- sq(a,n) ) /h;
    %dsq2=  (  sq([a(1)   a(2)+h   a(3)   ]' ,n) - sq(a,n)  ) / h ;
    %dsq3=  (  sq([a(1)   a(2)     a(3)+h ]' ,n) - sq(a,n)  ) / h ;
    
    % good ones:
	% fn(1) = dsq(a,1,h,n);
	% fn(2) = dsq(a,2,h,n);
	% fn(3) = dsq(a,3,h,n);
	for i=1:dimension
	    fn(i) = dsq(a,i,h,n);
	end
		
	for x=1:dimension
		for y= 1:dimension
		    ah=a;
			ah(y)=a(y)+h;
			J(x,y)= (  dsq(ah,x,h,n) - dsq(a,x,h,n)  ) / h ;
		end
	end
	
	% J(1,1) =  (  dsq([a(1)+h a(2)   a(3)  ]',1,h,n) - sq(a,n)  ) / h ;
    % J(1,2) =  (  dsq([a(1)   a(2)+h a(3)  ]',1,h,n) - sq(a,n)  ) / h ;
    % J(1,3) =  (  dsq([a(1)   a(2)   a(3)+h]',1,h,n) - sq(a,n)  ) / h ;
    
    % J(2,1) =  (  dsq([a(1)+h a(2)   a(3)  ]',2,h,n) - sq(a,n)  ) / h ;
    % J(2,2) =  (  dsq([a(1)   a(2)+h a(3)  ]',2,h,n) - sq(a,n)  ) / h ;
    % J(2,3) =  (  dsq([a(1)   a(2)   a(3)+h]',2,h,n) - sq(a,n)  ) / h ;
    
	% J(3,1) =  (  dsq([a(1)+h a(2)   a(3)  ]',3,h,n) - sq(a,n)  ) / h ;
    % J(3,2) =  (  dsq([a(1)   a(2)+h a(3)  ]',3,h,n) - sq(a,n)  ) / h ;
    % J(3,3) =  (  dsq([a(1)   a(2)   a(3)+h]',3,h,n) - sq(a,n)  ) / h ;
	J
    J\fn
	a = a- ( J\(fn) );
	disp('a neu:')
	a'
	% disp('Sum of Squares neu:')
	sqneu = sq(a,n)
	
	%plot(0:pi/(dimension-1):pi,a,'r')
    
    plot(0:n/(size(a,1)-1):n,a','r*-')
	hold on
    pause
    
	sqalt=0;
end








