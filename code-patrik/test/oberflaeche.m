[x,y,z] = sphere(20);
h = surf(x,y,z);
set(h,'FaceColor','b','EdgeColor','none')
rot =0.1
gruen=0.1
blau=0.1
light('color',[rot gruen blau])
axis square