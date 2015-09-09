function decompress(compressed_file_name)

f=fopen(compressed_file_name,'r');
[val,count]=fread(f,[4,1] ,'int16');
m=val(1,1);
n=val(2,1);
%ss-marimea intervalului
ss=val(3,1);

fs=8000;
bits=16;

%initializare vector valori
x=zeros(ss*m/2,1);

%citire matrice T
[T,count]=fread(f,[m,n],'float');

k=1;
for i=1:+2:m-1
  %preluare valori initiale
  for j=1:n
    x(k)=T(i+1,j);
    k++;
  endfor
   %calcularea valorilor prezise
  for t=k:ss-n-1+k
     for q=1:n
	x(t)+=T(i,q)*x(t-q);
     endfor
     x(t)=-x(t);
  endfor
  k=t+1;
endfor

%adaugarea valorilor pentru care nu s-au calculat coeficienti
l=val(4,1);
[y,count]=fread(f,l,'float');
for i=1:l
  x(k++)=y(i);
endfor

%subplot(2,1,2);
%plot(x);
  
fclose(f);

%stabilire nume fisier
compressed_file_name=substr(compressed_file_name,1,rindex(compressed_file_name,'.')-1);
nume=[compressed_file_name '2.wav'];

%scrierea fisierului final
wavwrite(x,fs,bits,nume);


endfunction
