function  compress(original_file_name)

[y,fs,bits]=wavread(original_file_name);
l=length(y);


m=fs*0.015; %interval 
p=19;
n=floor(l/m)*(m-1);
s=1;
T=zeros(n/(m-1),p);
for j=1:+m:n
    R=zeros(p+1,1);
    %construieste vector R
    for k=0:p
	for i=k+j:j+m
	    R(k+1)+=y(i)*y(i-k);
	endfor
    endfor

     a=lev(R,p);
      %construirea matricii T
     T(s,1:p)=a(1:p);
     T(s+1,1:p)=y(j:j+p-1);
     s=s+2;
endfor

%stabilire nume fisier compresat
original_file_name=substr(original_file_name,1,rindex(original_file_name,'.')-1);
nume=[original_file_name '.compressed'];

%marimea matricii T 
[c,t]=size(T);
v=zeros(4,1);
k=1;
for i=n+1+m:+1:l
  x(k++)=y(i);
endfor
v(1,1)=c;
v(2,1)=t;
%marime interval
v(3,1)=m;
%cate valori se mai adauga pe langa cele initiale si coeficienti
v(4,1)=k-1;

%scriere in fisier
f1=fopen(nume,'w');
count=fwrite(f1,v,'int16');
count=fwrite(f1,T,'float');
count=fwrite(f1,x,'float');
fclose(f1);
endfunction
