% Testprogramm, einfache Tests, die sicherstellen, dass Funktionen konsistent arbeiten
% f(x,y)
if (f(10,20,[1 2; 3 4],20)- 3.8345 < 0.0001)
    disp( ' f(x,y) ok')
end

% g(x,y)
T=0;
if (g(12,22,30,1)- 0.706772728821 < 0.000000001)
    T=0;
else
    T=1;
end
if (g(12,22,30,2) == 34)
    T=0;
else
    T=1;
end
if (g(12,22,30,3)- 0.483256789024 < 0.000000001)
    T=0;
else
    T=1;
end
if ( g(21,21,40,4) == 1 && g(21,21,40,4) == 0)
    T=0;
else
    T=1;
end
if (g(12,20,30,5) == 1)
    T=0;
else
    T=1;
end

if (T==0)
    disp( ' g(x,y) ok')
end

% SQ
if (SQ([1 2; 3 4],20,1)- 2.680154478750426e+03 < 0.000000001)
    disp( ' SQ ok')
	
end

% dsq
if( dsq([1 2; 3 4],[1;1],0.1,20,1)+dsq([1 2; 3 4],[1;2],0.1,20,1) + dsq([1 2; 3 4],[2;1],0.1,20,1)+dsq([1 2; 3 4],[2;2],0.1,20,1) - 2.098731133658375e+03 < 0.0000001 )
	disp(' dsq(a,i,h,n) ok')
end
	
