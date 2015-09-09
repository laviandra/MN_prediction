function [v,x,bt]=Hx(x,p)
%determinare vector Householder care modifica pe x
m=length(x);
s=sign(x(p))*norm(x(p:m));
bt=s*(x(p)+s);
v=[zeros(p-1,1);x(p)+s;x(p+1:m)];
x=[x(1:p-1);(-1)*s;zeros(m-p,1)];
endfunction