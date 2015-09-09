function x=householder(A,b)
% triunghiularizare ortogonala Householder
[m,n]=size(A);
b=b(:);
v=zeros(m,1);
for p=1:min(n,m-1)
  [v,A(:,p),bt]=Hx(A(:,p),p);
    for j=p+1:n
	A(:,j)=Hy(A(:,j),p,v,bt);
    endfor
  b=Hy(b,p,v,bt);
endfor
x=zeros(n,1);

%rezolvare sistem triunghiular
x(n)=b(n)/A(n,n);
for i=n-1:-1:1
    s=A(i,i+1:n)*x(i+1:n);
    x(i)=(b(i)-s)/A(i,i);
endfor
endfunction