function y=Hy(y,p,v,bt)
%aplica vector Householder unui vector y
m=length(y);
u=(v'(p:m)*y(p:m))/bt;
y(p:m)-=u*v(p:m);
endfunction