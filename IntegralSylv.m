function [ obsah,pocetdilku ] = IntegralSylv( fcex,a,b,n,e )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%n poèet dílkù, h=krok, e=pøesnost
if mod(n,2)==0   %Kontrola vstupu, poèet dílkù musí být dìlitelná dvìma

h=(b-a)/(2*n);   % napoèítání kroku
i=1; %slouží pro získání daného uzlu: k poèáteènímu uzlu pøièteme i násobek kroku, tka získáme i. uzel
S=0; %obsah
do=true;
while do==true
    while i<=n
        s=((2*h)/6)*( fcex(a+2*(i-1)*h) +4*fcex(a+(2*i-1)*h)+fcex(a+2*i*h)   );  %Spoètení obsahu pro daný krok, poèet dílkù
        S=S+s;
        i=i+1;
        S1=S;%výsledný obsah s daným krokem
    end

    i=1; %resetujeme velièiny na pùvodní hodnoty
    S=0;s=0;
    h=h/2;  %polovièní krok
    n=(b-a)/(2*h); %pøepoèítání poètu dílkù
    while i<=n 
       s= ((2*h)/6)*( fcex(a+2*(i-1)*h) +4*fcex(a+(2*i-1)*h)+fcex(a+2*i*h)   ); %Spoètení obsahu pro polovièní krok, poèet dílkù
       S=S+s;%obsah pro polovièní krok
       i=i+1;
    end   
    R=(1/15)*(S-S1);%chyba
    fprintf('\n');
    fprintf('Obsah pod køivkou je roven: %15.13f.\n',S1); 
    fprintf('Obsah pod køivkou s polovièním dìlením je roven: %15.13f.\n',S);
    fprintf('Rozdíl obsahù R je roven: %15.13f.\n',R); 
    fprintf('\n'); 
    if abs(R)<e    % je-li pøesnost splnìna ukonèí se výpoèet
        do=false;
        pocetdilku=((b-a)/h);%poèet dílkù
    else
        do=true; %není-li pøesnost splnìna ukonèí se výpoèet
        i=1;S=0;s=0;%resetujeme hodnoty
    end
end   
obsah=R+S; %výsledný obsah
fprintf('Obsah pod køivkou je roven: %15.13f.\n',(R+S)); 
fprintf('Poèet dílkù s krokem h je roven:%15.13f.\n',pocetdilku)
fprintf('Poèet dílkù s krokem 2*h je roven:%15.13f.\n',((pocetdilku)/2))


else 
disp('špatný vstup poèet dílù musí být dìlitelný dvìma.')
end
end