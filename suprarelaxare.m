function x=suprarelaxare(A,b,x0,w,eps,maxiter)
%suprarelaxare
it=0;
n=length(x0);
x=zeros(n,1);

while(it<maxiter)
    
      for i=1:n
	s=0;
	for j=1:i-1
	  s+=A(i,j)*x(j);
	endfor
	for j=i+1:n
	  s+=A(i,j)*x0(j);
	endfor
	x(i)=(1-w)*x0(i)+(w/A(i,i))*(b(i)-s);
      endfor	
      p = norm(x-x0,1);
      q = norm(x, 1);
      x0 = x;
      if p < eps*q
	break;
      endif
      it++;

endwhile

endfunction
