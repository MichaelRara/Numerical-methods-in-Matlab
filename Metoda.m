function [ output_args ] = Metoda( v,funkce,dm,hm,pd,e )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


%Vzorové volání: Metoda(4,@(x) x.*x,-2,2,4,0.003)
%Vstupy po øadì znamenají : Výbìr metody, funkce, dolní mez, horní mez,
%poèet dílkù, pøesnost


if v==1
    disp('Zvolila jste obdelníkovou formuli')
    fprintf('\n')
    n0=(hm-dm)/pd; %pøepoèítáme poèet dílkù na krok n0
    integral(funkce,dm,hm,n0,e)
elseif v==2    
    disp('Zvolila jste lichobìžníkovou formuli')
    fprintf('\n')
    IntegralLich(funkce,dm,hm,pd,e);
elseif v==3
    disp('Zvolila jste Simpsonovu formuli')
    fprintf('\n')
    IntegralSylv(funkce,dm,hm,pd,e);
elseif v==4
    disp('Zvolila jste Boolovu formuli')
    fprintf('\n')
    IntegralBool(funkce,dm,hm,pd,e);
end    
end

