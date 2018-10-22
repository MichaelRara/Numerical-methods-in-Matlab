function [ obsah,pocetdilku ] = IntegralBool( fcex,a,b,n,e )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%h je krok, n je pocet d�lk�
if mod(n,4)==0   %Kontorola vstupu, po�et d�lk� mus� b�t d�liteln� �ty�mi
h=(b-a)/n;  %v�po�et kroku
s2=0;s3=0;s4=0;   %dan� sumy ve formuli
do=true;
while do==true      %spo�ten� jednotliv�ch sum ze vzorce pro slo�enou boolovu formuli
    s1=7*fcex(a);
    %s2
    for j=1:2:(n-1)         %j,i,k slou�� k p�epo��t�n� uzlu, pomoc� n�soben� kroku h          
       s2=s2+fcex(a+j*h); 
    end
    s2=32*s2;
    %s3
    
    for i=2:4:(n-2)
       s3=s3+fcex(a+i*h);
     end    
    s3=12*s3;
    %s4
    for k=4:4:(n-4)
        s4=s4+fcex(a+k*h);
    end    
    s4=14*s4;
    s5=7*fcex(b);
    
    S=((2*h)/45)*(s1+s2+s3+s4+s5); %celkov� sou�et s krokem h
       
    %cyklus s polovi�n�m krokem
h=h/2;
n=(b-a)/h;
s2=0;s3=0;s4=0;

    s1=7*fcex(a);
    %s2
    for j=1:2:(n-1)        % spo�ten� jednotliv�ch sum ze vzorce pro slo�enou boolovu formuli
       s2=s2+fcex(a+j*h);
    end
    s2=32*s2;
    %s3
    
    for i=2:4:(n-2)
        s3=s3+fcex(a+i*h);
    end    
    s3=12*s3;
    %s4
    for k=4:4:(n-4)
        s4=s4+fcex(a+k*h);
    end    
    s4=14*s4;
    s5=7*fcex(b);
    
    S1=((2*h)/45)*(s1+s2+s3+s4+s5) ; %obsah s polovi�n�m krokem   
    R=(1/63)*(S1-S); %chyba
    
    fprintf('Obsah pod k�ivkou je roven: %15.13f.\n',S); 
    fprintf('Obsah pod k�ivkou s polovi�n�m d�len�m je roven: %15.13f.\n',S1);
    fprintf('Rozd�l obsah� R je roven: %15.13f.\n',R);  
    fprintf('\n');
    fprintf('-----------------------');
    fprintf('\n');
    if abs(R)<=e    %je-li spln�na p�esnost ukon�� se v�po�et
       do=false; 
       pocetdilku=(b-a)/h; %po�et d�lk�
    else           % nen�-li spln�na p�esnost ukon�� se v�po�et
        do=true;
        s2=0;s3=0;s4=0;
        S=0;
        S1=0;
        
    end  
end   
obsah=R+S1; %osbash s danou p�esnost�
fprintf('Obsah pod k�ivkou je roven: %15.13f.\n',(R+S1)); 
fprintf('Po�et d�lk� je roven:%15.13f.\n',pocetdilku)

else 
disp('�patn� vstup po�et d�l� mus� b�t d�liteln� �ty�mi.')
end

end

