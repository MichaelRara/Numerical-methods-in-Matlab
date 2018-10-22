function [obsah,pocetdilku ] = integral( fcex,a,b,n0,e )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%n0 je krok
x=a:n0:b;         %uzly 
g=1;              % slou�� k n�soben� kroku viz ��dek 18
S=0;              % obsah podgrafu    
i=0;                                
do=true;
while do==true                                % cyklus na v�po�et
    i=i+1;
    while a+g*n0<=b                                                        
       s=n0*fcex( (2*a+2*g*n0-n0 ) /2);                       % vzore�ek na v�po�et dan� ��sti podgrafu pro krok
       if a+(g+1)*n0>b                                 %pokud  interval p�es�hne hodnotu b
          Sposledni=(b-(a+g*n0))*fcex((b+a+n0*g)/2);   % obsah posledn�ho intervalu
       else
           Sposledni=0;
       end    
       S=S+s+Sposledni;    % v�po�et obsahu pod k�ivkou s dan�m krokem
       g=g+1;           %pomoc� g nasob�me krok n0 viz ��dek 12
       S1=S;                 
    end
    S1=S;     %obsah podgrafu s krokem n0
       
    S=0;          %vynulov�n� hodnot
    s=0;
    Sposledni=0;
    g=1;          %g nastav�me na 1
   
    n0=n0/2;             % krok je nyn� polovi�n�, jemn�j��
    while a+g*n0<=b
       s=n0*fcex((2*a+2*g*n0-n0 )/2);
       if a+(g+1)*n0>b
          Sposledni=(b-(a+g*n0))*fcex((b+a+n0*g)/2); 
       else
           Sposledni=0;
       end   
       S=S+s+Sposledni;
       g=g+1;
    end  
    S;
    R=(1/3)*(S-S1);% v�po�et chyby
    fprintf('Obsah pod k�ivkou je roven: %15.13f.\n',S1); 
    fprintf('Obsah pod k�ivkou s polovi�n�m d�len�m je roven: %15.13f.\n',S);
    fprintf('Rozd�l obsah� R je roven: %15.13f.\n',R);  
    fprintf('\n');
    fprintf('-----------------------');
    fprintf('\n');
    
    if abs(R)<=e         %pokud je dosa�en� po�adovan� p�esnost, tak se v�po�et ukon��
        do=false;
        pocetdilku=(b-a)/n0;    %zjist� se po�et d�lk� nutn� k dosa�en� dan� p�esnosti
    else                 % p�esnost nen� spln�na, znovu se provede cel� v�po�et
        do=true;
        S=0;
        s=0;
        Sposledni=0;
        g=1;
    end    
end

obsah=R+S;  %celkov� obsah

fprintf('Obsah pod k�ivkou je roven: %15.13f.\n',(R+S)); 
fprintf('Po�et d�lk� je roven:%15.13f.\n',pocetdilku)
fprintf('D�lka kroku k z�sk�n� po�adovan� p�esnosti:%15.13f.\n',n0)
end

