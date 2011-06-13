
% Auflösung der gegebenen Funktion g(x)
n=50;
% Auflösung a-Matrix m x m
m=4;
% vorhandene Funktion g(x,y,n) plotten
clf
field=zeros(n,n);
for x=0:n
    for y=0:n
        field(x+1,y+1)=g(x,y,n);
        plot3([x x],[y y],[0 field(x+1,y+1)]);
        
        hold on
    end
end
tmp=ones(1,n);

for i=0:n
    %X=[1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4]'*n/m
    %Y=[1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4]'*n/m
    X(i+1,:)=ones(1,n)*i ;
    Y(:,i+1)=ones(n,1)*i ;
end
grid on
field;

surface(X,Y,field)
hold on
clf
%%% optimale a-Matrix suchen
% a mit 4x4
a= ones(m,m);
fn=zeros(m,1);
h=0.1;
% Zeilenweise fn und Jacobi bestimmen
% fn
% fn, 1. Zeile mit Spaltenvektor mxm=16 
% FN=fn1 + fn2 + fn3 + fn4 (4x16)
disp('fn(i)');
pos=0;
for x=1:m
    for y=1:m
        [x y]; % 1 -m  ; 1 -m
         select=[x;y];  
         fn(y+pos)= dsq(a,select,h,n);
    end
    pos=pos+m;
end
fn

%  J = j1 + j2 +j3 +j4 (4x16)
% x,y Position der Jakobi Matrix, welche m^2 x m^2 = 16x16  ist


for i=1:m*m
    
    selectfn=[  ceil(i/m),i-( ceil(i/m)-1)*m,]; % Index i von m x m Matrix auf m^2 Vektor umrechnen
	for j= 1:m*m
       selecta =[  ceil(j/m),j-( ceil(j/m)-1)*m,]; % x,y; % Index j von m x m Matrix auf m^2 Vektor umrechnen
       %J(i,j) =a(select(1),select(2));
       %pos=pos+1;
          aneu=a;
          aneu( selecta(1),selecta(2) )=aneu( selecta(1),selecta(2) )+h;
          J(i,j)= (dsq(aneu,[selectfn(1),selectfn(2)],h,n) - dsq(a,[selectfn(1),selectfn(2)],h,n))/h;
        
    end
    J(i,:);
end

% Für Optimierungsschritt Felder in richtige Form bringen
% a  = m x 1 SpaltenVektor nicht mehr m x m Matrix => a1
% fn = m x 1 SpaltenVektor
% J  = m^2 x m^2 Matrix

% a => a1
%a1d=[a(1,:) a(2,:) a(3,:) a(4,:)];
% a1 =[ 0 0];
% for i=1:m
%     a1 =[a1 a(i,:)]
% end
a1=a(:); % a  = m x 1 SpaltenVektor nicht mehr m x m Matrix => a1
    
a1=a1-J\fn

%aneu = a' - J\fn

% a1 zurück in m x m Matrix umformen
% ziel=[ziel(1:4)';ziel(5:8)';ziel(9:12)';ziel(13:16)']
a= reshape(a1,m,m)


%% nun noch darstellen
X=[];
Y=[];
boden=zeros(m^2,1);
tmp=ones(1,m);
for i=1:m
    %X=[1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4]'*n/m
    %Y=[1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4]'*n/m
    X=[X 1:m  ];
    Y=[Y i*tmp];
end
X=reshape(((X-1)*(n/(m-1)))',m,m)
Y=reshape(((Y-1)*(n/(m-1)))',m,m)
a1

% for i=1:m^2
%     plot3([X(i); X(i)],[Y(i) Y(i)],[boden a1]);
%     hold on
% end
% grid on;
view(45,40);
surface(X,Y,a)
grid on
