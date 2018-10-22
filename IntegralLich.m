function [ obsah,pocetdilku] = IntegralLich(  fcex,a,b,h,e )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
n0=(b-a)/h;  %n0 je krok, h je pocet d�lk� 
do=true;
while do==true

    x=a:n0:b; %uzly
    length(x); %po�et prvk� vektoru uzl�
    i=1; %slou�� k vybr�n� dan�ho uzlu z vektoru uzl�
    S=0; %obsah 
    while x(i)<=b      
        if x(i) == a          %Pro prvn� uzel   %V�po�et obsahu pro dan� krok lich. formul�. viz str 70 skripta.
          s=n0*0.5*fcex(a);    
        elseif x(i)==b       %pro posledn� uzel
          s=n0*0.5*fcex(b);
        else                 % pro uzly mezi prvn�m a posledn�m uzlem
          s=n0*fcex((a+(i)*n0));
        end
        S=S+s;  % na konci cyklu se do S nahraje obsah podgrafu pro krok n0 
        S1=S;       %obsah pro krok n0
        i=i+1;
        if i>length(x) 
            break  
        end
    end
    S=0; %resetujeme prom�nn� na jejich startovn� hodnotu
    s=0;
    i=1;
    n0=n0/2;  %zjemn�me krok
    x=a:n0:b; % p�epo��t�me uzly pro polovi�n� krok
    while x(i)<=b
        if x(i) == a %| x(i)==b            %prom�nn� maj� stejn� v�znam jako v prvn�m cyklu
          s=n0*0.5*fcex(a);    
        elseif x(i)==b
          s=n0*0.5*fcex(b);
        else
          s=n0*fcex((a+i*n0));  
        end
        S=S+s;              %Obsah pro polovi�n� krok
        i=i+1;
        if i>length(x) 
            break 
        end   
    end 
    R=(1/3)*(S-S1);%v�po�et chyby
    fprintf('Obsah pod k�ivkou je roven: %15.13f.\n',S1); 
    fprintf('Obsah pod k�ivkou s polovi�n�m d�len�m je roven: %15.13f.\n',S);
    fprintf('Rozd�l obsah� R je roven: %15.13f.\n',R);  
    fprintf('\n');
    fprintf('-----------------------');
    fprintf('\n');
    if abs(R)<=e            % Jeli dosa�en� po�adovan� p�esnost ukon�� se v�po�et
        do=false;
        pocetdilku=(b-a)/n0;
    else
        do=true; % nen�-li dosa�en� p�esnost zopakuje se v�po�et
        S=0;%resetujeme hodnoty
        s=0;
        i=1;
    end    
      
end
obsah=R+S; %v�sledn� obsah dan� p�esnosti
fprintf('Obsah pod k�ivkou je roven: %15.13f.\n',(R+S)); 
fprintf('Po�et d�lk� je roven:%15.13f.\n',pocetdilku)

end