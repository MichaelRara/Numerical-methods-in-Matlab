function [ obsah,pocetdilku ] = IntegralBool( fcex,a,b,n,e )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%h je krok, n je pocet dílkù
if mod(n,4)==0   %Kontorola vstupu, poèet dílkù musí být dìlitelný ètyømi
h=(b-a)/n;  %výpoèet kroku
s2=0;s3=0;s4=0;   %dané sumy ve formuli
do=true;
while do==true      %spoètení jednotlivých sum ze vzorce pro složenou boolovu formuli
    s1=7*fcex(a);
    %s2
    for j=1:2:(n-1)         %j,i,k slouží k pøepoèítání uzlu, pomocí násobení kroku h          
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
    
    S=((2*h)/45)*(s1+s2+s3+s4+s5); %celkový souèet s krokem h
       
    %cyklus s polovièním krokem
h=h/2;
n=(b-a)/h;
s2=0;s3=0;s4=0;

    s1=7*fcex(a);
    %s2
    for j=1:2:(n-1)        % spoètení jednotlivých sum ze vzorce pro složenou boolovu formuli
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
    
    S1=((2*h)/45)*(s1+s2+s3+s4+s5) ; %obsah s polovièním krokem   
    R=(1/63)*(S1-S); %chyba
    
    fprintf('Obsah pod køivkou je roven: %15.13f.\n',S); 
    fprintf('Obsah pod køivkou s polovièním dìlením je roven: %15.13f.\n',S1);
    fprintf('Rozdíl obsahù R je roven: %15.13f.\n',R);  
    fprintf('\n');
    fprintf('-----------------------');
    fprintf('\n');
    if abs(R)<=e    %je-li splnìna pøesnost ukonèí se výpoèet
       do=false; 
       pocetdilku=(b-a)/h; %poèet dílkù
    else           % není-li splnìna pøesnost ukonèí se výpoèet
        do=true;
        s2=0;s3=0;s4=0;
        S=0;
        S1=0;
        
    end  
end   
obsah=R+S1; %osbash s danou pøesností
fprintf('Obsah pod køivkou je roven: %15.13f.\n',(R+S1)); 
fprintf('Poèet dílkù je roven:%15.13f.\n',pocetdilku)

else 
disp('špatný vstup poèet dílù musí být dìlitelný ètyømi.')
end

end

