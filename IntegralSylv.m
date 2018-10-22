function [ obsah,pocetdilku ] = IntegralSylv( fcex,a,b,n,e )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%n po�et d�lk�, h=krok, e=p�esnost
if mod(n,2)==0   %Kontrola vstupu, po�et d�lk� mus� b�t d�liteln� dv�ma

h=(b-a)/(2*n);   % napo��t�n� kroku
i=1; %slou�� pro z�sk�n� dan�ho uzlu: k po��te�n�mu uzlu p�i�teme i n�sobek kroku, tka z�sk�me i. uzel
S=0; %obsah
do=true;
while do==true
    while i<=n
        s=((2*h)/6)*( fcex(a+2*(i-1)*h) +4*fcex(a+(2*i-1)*h)+fcex(a+2*i*h)   );  %Spo�ten� obsahu pro dan� krok, po�et d�lk�
        S=S+s;
        i=i+1;
        S1=S;%v�sledn� obsah s dan�m krokem
    end

    i=1; %resetujeme veli�iny na p�vodn� hodnoty
    S=0;s=0;
    h=h/2;  %polovi�n� krok
    n=(b-a)/(2*h); %p�epo��t�n� po�tu d�lk�
    while i<=n 
       s= ((2*h)/6)*( fcex(a+2*(i-1)*h) +4*fcex(a+(2*i-1)*h)+fcex(a+2*i*h)   ); %Spo�ten� obsahu pro polovi�n� krok, po�et d�lk�
       S=S+s;%obsah pro polovi�n� krok
       i=i+1;
    end   
    R=(1/15)*(S-S1);%chyba
    fprintf('\n');
    fprintf('Obsah pod k�ivkou je roven: %15.13f.\n',S1); 
    fprintf('Obsah pod k�ivkou s polovi�n�m d�len�m je roven: %15.13f.\n',S);
    fprintf('Rozd�l obsah� R je roven: %15.13f.\n',R); 
    fprintf('\n'); 
    if abs(R)<e    % je-li p�esnost spln�na ukon�� se v�po�et
        do=false;
        pocetdilku=((b-a)/h);%po�et d�lk�
    else
        do=true; %nen�-li p�esnost spln�na ukon�� se v�po�et
        i=1;S=0;s=0;%resetujeme hodnoty
    end
end   
obsah=R+S; %v�sledn� obsah
fprintf('Obsah pod k�ivkou je roven: %15.13f.\n',(R+S)); 
fprintf('Po�et d�lk� s krokem h je roven:%15.13f.\n',pocetdilku)
fprintf('Po�et d�lk� s krokem 2*h je roven:%15.13f.\n',((pocetdilku)/2))


else 
disp('�patn� vstup po�et d�l� mus� b�t d�liteln� dv�ma.')
end
end