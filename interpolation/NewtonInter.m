function yi = NewtonInter(x,y,xi)

% http://people.clarkson.edu/~ebollt/Classes/MA570ScientificComputingF07/
% Projects/Project2/NewtonInter.m

% Newton interpolation algorithm 
% x,y - row-vectors of (n+1) data values (x,y)
% xi - a row-vector of x-values, where interpolation is to be found (could be a single value)
% yi - a row-vector of interpolated y-values

n = length(x) - 1; % the degree of interpolation polynomial
ni = length(xi); % the number of x-values, where interpolation is to be found

D = ones(n,n); % the matrix for Newton divided differences 
                    % has n rows for divided differences of the corresponding order
                    % has n columns corresponding to data values x(1),x(2),...,x(n)
                   
for k = 1 : n 
    D(k,1) = (y(k+1)-y(k))/(x(k+1)-x(k)); % first divided difference
end
                   
for k = 2 : n % start the outer loop through the k-th order divided differences
    
    for kk = 1 : (n-k+1) % start the inner loop through the data values 
                        % the matrix of divided differences is triangular!
                        
        D(kk,k) = (D(kk+1,k-1) - D(kk,k-1))/(x(kk+k)-x(kk)); % see the Newton divided differences
    end % end of the inner loop
        
end % the end of the outer loop

% define the (n+1) coefficients of the Newton interpolating polynomial
a(1) = y(1); 

for k = 2 : (n+1)
    a(k) = D(1,k-1); % the first row of the matrix of divided differences corresponds to the point x(1)
end

% compute values of the Newton interpolating polynomial at each x-value of xi

% Note: the algorithm uses the Horner's rule for polynomial evaluation, 
% where the nested multiplication is performed in parallel for each x-value of the row xi

yi = a(n+1)*ones(1,ni); % initialization of the vector yi as the coefficient of the highest degree

for k = 1 : n
    yi = a(n+1-k)+yi.*(xi-x(n+1-k)); % nested multiplication, where xi is a row-vector
end

% BONUS-PROBLEM: this program can be improved for space savings (set D as a vector rather than a matrix!)
% If you get a solution, send it to the instructor. The first student, who gets a correct solution, 
% will get a bonus mark to the final mark. 


