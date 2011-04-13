
interpolate.m
function  [Pxy] = interpolate(x,y,max,A,B,C,D) 
  % x,y = zu interpolierende Position zwischen den 4 Punkten (0-max)
  % H1, H2 bilden zwei Geraden, zwischen welchen die gesuchten Punkte berechnet werden
  % H1 verbindet A und B; H2 verbindet C und D
  
  n=max;

  H1=A+ (abs(A-B)  *1/n*x);
  H2=D+ (abs(D-C)  *1/n*x);
  H =H1+(abs(H2-H1)*1/n*y);
  Pxy=[x/n y/n  H]';