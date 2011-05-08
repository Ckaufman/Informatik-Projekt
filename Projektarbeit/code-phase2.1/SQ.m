function [ sum ] = SQ( g,a )
% "Sum of Square"

l=size(g,2);
sum=0;

for x=1:l-1
   % disp(f(x,a))
   % disp(g(x))
   % disp('--')
    sum=sum+(f(x,a)-g(x))^2;
end


end

