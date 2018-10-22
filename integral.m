function [obsah,pocetdilku ] = integral( fcex,a,b,n0,e )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%n0 je krok
x=a:n0:b;         %uzly 
g=1;              % slouží k násobení kroku viz øádek 18
S=0;              % obsah podgrafu    
i=0;                                
do=true;
while do==true                                % cyklus na výpoèet
    i=i+1;
    while a+g*n0<=b                                                        
       s=n0*fcex( (2*a+2*g*n0-n0 ) /2);                       % vzoreèek na výpoèet dané èásti podgrafu pro krok
       if a+(g+1)*n0>b                                 %pokud  interval pøesáhne hodnotu b
          Sposledni=(b-(a+g*n0))*fcex((b+a+n0*g)/2);   % obsah posledního intervalu
       else
           Sposledni=0;
       end    
       S=S+s+Sposledni;    % výpoèet obsahu pod køivkou s daným krokem
       g=g+1;           %pomocí g nasobíme krok n0 viz øádek 12
       S1=S;                 
    end
    S1=S;     %obsah podgrafu s krokem n0
       
    S=0;          %vynulování hodnot
    s=0;
    Sposledni=0;
    g=1;          %g nastavíme na 1
   
    n0=n0/2;             % krok je nyní polovièní, jemnìjší
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
    R=(1/3)*(S-S1);% výpoèet chyby
    fprintf('Obsah pod køivkou je roven: %15.13f.\n',S1); 
    fprintf('Obsah pod køivkou s polovièním dìlením je roven: %15.13f.\n',S);
    fprintf('Rozdíl obsahù R je roven: %15.13f.\n',R);  
    fprintf('\n');
    fprintf('-----------------------');
    fprintf('\n');
    
    if abs(R)<=e         %pokud je dosažená požadovaná pøesnost, tak se výpoèet ukonèí
        do=false;
        pocetdilku=(b-a)/n0;    %zjistí se poèet dílkù nutný k dosažení dané pøesnosti
    else                 % pøesnost není splnìna, znovu se provede celý výpoèet
        do=true;
        S=0;
        s=0;
        Sposledni=0;
        g=1;
    end    
end

obsah=R+S;  %celkový obsah

fprintf('Obsah pod køivkou je roven: %15.13f.\n',(R+S)); 
fprintf('Poèet dílkù je roven:%15.13f.\n',pocetdilku)
fprintf('Délka kroku k získání požadované pøesnosti:%15.13f.\n',n0)
end

