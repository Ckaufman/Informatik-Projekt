%Auflösung erhöhen
%vorgegebene Punkte
A=3
B=7
C=11
D=5
Z=[[0 0 A]',[1 0 B]',[1 1 C]',[0 1 D]']

plot3(Z(1,:),Z(2,:),Z(3,:),'r*')

%  Berechnung
max=10
I=zeros(3,(max)^2)
pos=1
I=[];
for n=0:max
    for m=0:max
        Pxy= interpolate(n,m,max,A,B,C,D)
        I=[I Pxy];
        pos=pos+1;
    end
end 
I
hold on
plot3(I(1,:),I(2,:),I(3,:),'gd')
