function ui=NewtFit(x,y,z,u,xi,yi,zi)

% http://www.mathworks.com/matlabcentral/fileexchange/8970-3d-data-interpolation

% 3D interpolation. It may be used where griddata3 fails to find a triangularization 
% of the datagrid (x,y,z). The function uses a modified 4 point Newton interpolation 
% formula for vector arguments in 3D instead of scalars used in 1D. The interpolation 
% is performed for the 4 nearest neighbors for each point in the (xi,yi,zi).

% u=u(x,y,z) is the data from which ui(xi,yi,zi) is interpolated x,y,z,u are vectors 
% of same size and xi,yi,zi are also vectors. The fit is exact (u=ui) for points (xi,yi,zi) 
% that coinside with data points (x,y,z). Note: NewtFit also delivers result for points 
% outside the domain (i.e., extrapolation), but results may be inaccurate then.

%Example: Prepare data in random non-uniform grid
  xyz=rand(10003,3);
  x=xyz(:,1);y=xyz(:,2);z=xyz(:,3);
  u=x.^3+sin(pi*y).^2.*z.^2;
  
  %Gridpoints to fit:
  xyz=rand(8007,3);
  xi=xyz(:,1);yi=xyz(:,2);zi=xyz(:,3);
 
  %Interpolate
  ui=NewtFit(x,y,z,u,xi,yi,zi);
 
  %compare and plot
  uui=xi.^3+sin(pi*yi).^2.*zi.^2;%exact
  plot(uui,ui,'.');pause(4)
  hist(uui-ui,60);
  standard_deviation=std(uui-ui)