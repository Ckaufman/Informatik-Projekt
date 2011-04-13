w=0:(2*pi/30):2*pi
n=1
for v=0:(2/20):2
    data(n,:)=5*sin(w+v)
    n=n+1
end

% 3D Darstellung
dreid=[]
for x=1:20
    for y=1:30
        wert=[x,y,data(x,y)]'
        dreid=[dreid wert];
        t=1000*x+y
        
    end
end
plot3(dreid(1,1:599),dreid(2,1:599),dreid(3,1:599))

figure(2)
clf
hold on
for x=1:20
    for y=1:30
        wert=[x,y,0;x,y,data(x,y)]'
        dreid=[dreid wert];
        
        plot3(wert(1,:),wert(2,:),wert(3,:))
        
        
    end
    
end

