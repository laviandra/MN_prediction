function a=lev(r,p)
%algoritmul levinson durbin

a=zeros(p,1);  
k=zeros(p,1);    
E=zeros(p+1,1); 

%valori initiale
E(1)=r(1);
k(1)=-r(2)/E(1);
a(1)=k(1);
E(2)=E(1)*(1-k(1)*k(1));

for j=2:p
  %calcul suma
  s=0;
  for i=2:j
    s+=r(i)*a(j-i+1);
  endfor
  s=s+r(j+1);

  k(j)=-s/E(j);    
     
  a(j)=0;
  a(1:j)=a(1:j)+[a(j-1:-1:1)' 1]'*k(j);   
  %calcul eroare
  E(j+1)=E(j)*(1-k(j)*k(j));
endfor


endfunction