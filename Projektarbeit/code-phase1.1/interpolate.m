function  [Pxy] = interpolate(Q,u) 
  % x,y = zu interpolierende Position zwischen den 4 Punkten (0-max)
  % H1, H2 bilden zwei Geraden, zwischen welchen die gesuchten Punkte berechnet werden
  % H1 verbindet A und B; H2 verbindet C und D
  x=u(1);
  y=u(2);
  Q;
  A=Q(1,3);
  B=Q(2,3);
  C=Q(4,3);
  D=Q(3,3);

  % n ist die Distanz zwischen A und B welche gleich ist wie zwischen B und C
  n=abs(Q(1,1)-Q(2,1)); 
  if n==0
	n=1;  % falls = 0 nehmen wir Schrittweite 1 an, so kann auch ein ganzen Gitter interpoliert werden
          % auch wenn bei der Stützstelle der Wert schon bekannt ist!
  end
  
  % x und y in relative Werte umrechnen
  x=x-Q(1,1);
  y=y-Q(1,2);
  
  % nun interpolieren 
  H1=A+ ((B-A)  * x/n);
  H2=D+ ((C-D)  * x/n);
  H =H1+((H2-H1)* y/n);
  %Pxy=[x/n y/n  H]'
  Pxy=[x+Q(1,1) y+Q(1,2)  H]';