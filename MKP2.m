function [ E,I ] = MKP2(a,b,h,a0,al,b0,bl)
%UNTITLED Summary of this function goes here
%=============VOL�N�=======================
% [ E,I ]=MKP2(0,1,0.1,7*3,-10*(-13),1.59*3,-3.66*(-13))
% =========================================
%% Napo��t�n� z�kladn�ch dat
format short;
I=[1 -1; -1 1];
n=(b-a)/h; % d�lka d�lku
x=a:h:b; %uzly
K=zeros(n); % Matice K, zat�m nulov� a postupn� ji zapln�me
F=zeros(n,1); % Prav� strana soustavy, zat�m nulov� a postupn� ji zapln�me
%% SESTAVEN� MATICE K
for i=1:n
    t=x(i)+0.5*h; %napo��t�n� budo mezi dv�ma uzly x(i) a x(i+1)
    K1=((10*t*t+3)/h)*I; %dopl�te vlastn� funkci p
    K2=0.5*h*[(9.5/(x(i)+1)), 0; 0, 9.5/(x(i)+h+1)]; % Dopl�te vlastn� fuknci q
    K12=K1+K2; % element�rn� matice tuhosti K12
    % Element�rn� matici tuhosti K12 p�i�teme k matici K.
    K(i,i)=K12(1,1)+K(i,i); 
    K(i+1,i+1)=K12(2,2);
    K(i,i+1)=K12(1,2);
    K(i+1,i)=K12(2,1);
    K;
%% SESTAVEN� VEKTORU ZAT͎EN� F 
    F12=0.5*h*[sin(x(i)*x(i)); sin((x(i+1))*(x(i+1)))]; %dopl�te vlastn� fuknci f, pro v�po�et element�rn�ho vektoru zat�en�
    F(i)=F12(1)+F(i);
    F(i+1)=F12(2);
    F;
end
%% p�i�ten� prvk� na hlavn� diagon�le
K(1,1)=K(1,1)+a0; % p�i�ten� prvku k prvn�mu prvku diagon�ly matice K
K(n+1,n+1)=K(n+1,n+1)+al; % p�i�ten� prvku k posledn�mu prvku diagon�ly matice K
K;
%% p�i�ten� prvk� k prvn� a posledn� slo�ce vektoru F
F(1)=F(1)+b0; % p�i�ten� prvku k prvn�mu prvku vektoru zat�en� F
F(n+1)=F(n+1)+bl; % p�i�ten� prvku k posledn�mu prvku vektoru zat�en� F
F;
%% SOUSTAVA ROVNIC JE HOTOV� a pokra�ujeme jej�m vy�e�en�m
u = K\F; % �e�en� soustavy
plot(x,u') %---!POZOR! vektor x je ��dkov� a vektor u sloupcov�--, vykreslen� �e�en� z�skan�ho pomoc� MKP
hold on
%% Vol�n� bvp4c
I=BVP(); %Matice kde v prvn�m ��dku jsou uzly, ve druh�m hodnoty �e�en� bvp4c pro dan� uzel
E=[x;u']; %Matice kde v prvn�m ��dku jsou uzly, ve druh�m hodnoty �e�en� MKP pro dan� uzel

end





% dydt=@(x,y)[y(2); (sin(x*x)+20*x*y(2)-( (9.5*y(1))/(x+1)) )   / (-1*(10*x*x+3)) ];
% dydt=@(x,y)[y(2); (y(2).*20.*x-9.5/(x+1)*y(1)+sin(x.*x))/(10.*x.*x+3)];


%dydt=@(x,y)[y(2); (y(2).*20.*x-9.5/(x+1)*y(1)+sin(x.*x))/(-10.*x.*x-3)];
%bc=@(ya,yb)[ya(2)-7.*ya(1)+1.59; yb(2)+10.*yb(1)-3.66];
%yinit=@(x)[0; 1];
%solinit=bvpinit(linspace(0,1,10),yinit);
%sol=bvp4c(dydt,bc,solinit);