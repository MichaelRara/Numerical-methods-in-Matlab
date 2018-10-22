function [ output_args ] = Metoda( v,funkce,dm,hm,pd,e )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


%Vzorov� vol�n�: Metoda(4,@(x) x.*x,-2,2,4,0.003)
%Vstupy po �ad� znamenaj� : V�b�r metody, funkce, doln� mez, horn� mez,
%po�et d�lk�, p�esnost


if v==1
    disp('Zvolila jste obdeln�kovou formuli')
    fprintf('\n')
    n0=(hm-dm)/pd; %p�epo��t�me po�et d�lk� na krok n0
    integral(funkce,dm,hm,n0,e)
elseif v==2    
    disp('Zvolila jste lichob�n�kovou formuli')
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

