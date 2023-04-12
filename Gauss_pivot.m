function x= Gauss_pivot(A,b)
% solve Ax=b using Gaussian elimination with 
%  row pivoting
% Inputs:  A is the n-by-n coefficient matrix
%       B is the n-by-1 right-hand-side vector
% Outputs:  x is the n-by-1 solution vector
[n,n1]=size(A);
for i=1:n-1
   [pivot,k]=max(abs(A(i:n,i)))
   % k is position of pivot, relative to row i
   % do not check rows above currente row
   if k > 1
      temp1=A(i,:); A(i,:)=A(i+k-1,:)
      temp2=b(i,:); b(i,:)=b(i+k-1,:)
      A(i+k-1,:)=temp1;b(i+k-1,:)=temp2;
   end
   for h=i+1:n
      m = A(h,i)/A(i,i);
      A(h,:) = A(h,:)- m*A(i,:);
      b(h,:) = b(h,:)- m*b(i,:);
   end
end
x(n,:)=b(n,:)./A(n,n);
for i = n-1:-1:1
   x(i,:)=(b(i,:)-A(i,i+1:n)*x(i+1:n,:))./A(i,i);
end
