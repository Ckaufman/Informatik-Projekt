
% Auflösung der gegebenen Funktion g(x)
n=50;
% Auflösung a-Matrix m x m
m=4;
% vorhandene Funktion g(x,y,n) plotten
clf
field=zeros(n+1,n+1);
for x=0:n
    for y=0:n
        field(x+1,y+1)=g(x,y,n);
        plot3([x x],[y y],[0 field(x+1,y+1)]);
        
        hold on
    end
end
grid on
field

surface(field)

%%% optimale a-Matrix suchen
% a mit 4x4
a= zeros(m,m);
fn=zeros(m,1);
h=0.1
% Zeilenweise fn und Jacobi bestimmen
% fn
% fn, 1. Zeile mit Spaltenvektor mxm=16 
% FN=fn1 + fn2 + fn3 + fn4 (4x16)
disp('fn(i)');
pos=0;
for y=0:n/(m-1):n;
    G=g(0:n,y,n);
    A=a((1+pos/m),:);
    for i=1:m
         fn(i+pos)= dsq(G,A,i,h,n);
    end
    pos=pos+m;
end
fn

%  J = j1 + j2 +j3 +j4 (4x16)
% x,y Position der Jakobi Matrix, welche m^2 x m^2 = 16x16  ist
pos=0;
for i=1:m
	for j= 1:m
        G=g(0:n,(i-1)*n/(m-1),n);
        A=a(i,:)'
        Ah=A;
        Ah=Ah(j)+h;
        J(i,j)= (dsq(G,Ah,j,h,n) - dsq(G,A,j,h,n))/h;
        
    end
end


% for x=1:dimension
% 	for y= 1:dimension
% 		Ah=a((1+pos/m),:);
% 		Ah(x,y)=a(x,y)+h;
% 		J(x,y)= (  dsq(G,ah,x,h,n) - dsq(G,a,x,h,n)  ) / h ;
% 	end
% end






% optimierung
% [4x4] = [4x4] - [4x16]\[4*16]
aneu = a - J\fn