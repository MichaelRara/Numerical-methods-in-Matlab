function [ obsah,pocetdilku] = IntegralLich(  fcex,a,b,h,e )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
n0=(b-a)/h;  %n0 je krok, h je pocet dílkù 
do=true;
while do==true

    x=a:n0:b; %uzly
    length(x); %poèet prvkù vektoru uzlù
    i=1; %slouží k vybrání daného uzlu z vektoru uzlù
    S=0; %obsah 
    while x(i)<=b      
        if x(i) == a          %Pro první uzel   %Výpoèet obsahu pro daný krok lich. formulí. viz str 70 skripta.
          s=n0*0.5*fcex(a);    
        elseif x(i)==b       %pro poslední uzel
          s=n0*0.5*fcex(b);
        else                 % pro uzly mezi prvním a posledním uzlem
          s=n0*fcex((a+(i)*n0));
        end
        S=S+s;  % na konci cyklu se do S nahraje obsah podgrafu pro krok n0 
        S1=S;       %obsah pro krok n0
        i=i+1;
        if i>length(x) 
            break  
        end
    end
    S=0; %resetujeme promìnné na jejich startovní hodnotu
    s=0;
    i=1;
    n0=n0/2;  %zjemníme krok
    x=a:n0:b; % pøepoèítáme uzly pro polovièní krok
    while x(i)<=b
        if x(i) == a %| x(i)==b            %promìnné mají stejný význam jako v prvním cyklu
          s=n0*0.5*fcex(a);    
        elseif x(i)==b
          s=n0*0.5*fcex(b);
        else
          s=n0*fcex((a+i*n0));  
        end
        S=S+s;              %Obsah pro polovièní krok
        i=i+1;
        if i>length(x) 
            break 
        end   
    end 
    R=(1/3)*(S-S1);%výpoèet chyby
    fprintf('Obsah pod køivkou je roven: %15.13f.\n',S1); 
    fprintf('Obsah pod køivkou s polovièním dìlením je roven: %15.13f.\n',S);
    fprintf('Rozdíl obsahù R je roven: %15.13f.\n',R);  
    fprintf('\n');
    fprintf('-----------------------');
    fprintf('\n');
    if abs(R)<=e            % Jeli dosažená požadovaná pøesnost ukonèí se výpoèet
        do=false;
        pocetdilku=(b-a)/n0;
    else
        do=true; % není-li dosažená pøesnost zopakuje se výpoèet
        S=0;%resetujeme hodnoty
        s=0;
        i=1;
    end    
      
end
obsah=R+S; %výsledný obsah dané pøesnosti
fprintf('Obsah pod køivkou je roven: %15.13f.\n',(R+S)); 
fprintf('Poèet dílkù je roven:%15.13f.\n',pocetdilku)

end