function [ E,I ] = MKP2(a,b,h,a0,al,b0,bl)
%UNTITLED Summary of this function goes here
%=============VOLÁNÍ=======================
% [ E,I ]=MKP2(0,1,0.1,7*3,-10*(-13),1.59*3,-3.66*(-13))
% =========================================
%% Napoèítání základních dat
format short;
I=[1 -1; -1 1];
n=(b-a)/h; % délka dílku
x=a:h:b; %uzly
K=zeros(n); % Matice K, zatím nulová a postupnì ji zaplníme
F=zeros(n,1); % Pravá strana soustavy, zatím nulová a postupnì ji zaplníme
%% SESTAVENÍ MATICE K
for i=1:n
    t=x(i)+0.5*h; %napoèítání budo mezi dvìma uzly x(i) a x(i+1)
    K1=((10*t*t+3)/h)*I; %doplòte vlastní funkci p
    K2=0.5*h*[(9.5/(x(i)+1)), 0; 0, 9.5/(x(i)+h+1)]; % Doplòte vlastní fuknci q
    K12=K1+K2; % elementární matice tuhosti K12
    % Elementární matici tuhosti K12 pøièteme k matici K.
    K(i,i)=K12(1,1)+K(i,i); 
    K(i+1,i+1)=K12(2,2);
    K(i,i+1)=K12(1,2);
    K(i+1,i)=K12(2,1);
    K;
%% SESTAVENÍ VEKTORU ZATÍŽENÍ F 
    F12=0.5*h*[sin(x(i)*x(i)); sin((x(i+1))*(x(i+1)))]; %doplòte vlastní fuknci f, pro výpoèet elementárního vektoru zatížení
    F(i)=F12(1)+F(i);
    F(i+1)=F12(2);
    F;
end
%% pøiètení prvkù na hlavní diagonále
K(1,1)=K(1,1)+a0; % pøiètení prvku k prvnímu prvku diagonály matice K
K(n+1,n+1)=K(n+1,n+1)+al; % pøiètení prvku k poslednímu prvku diagonály matice K
K;
%% pøiètení prvkù k první a poslední složce vektoru F
F(1)=F(1)+b0; % pøiètení prvku k prvnímu prvku vektoru zatížení F
F(n+1)=F(n+1)+bl; % pøiètení prvku k poslednímu prvku vektoru zatížení F
F;
%% SOUSTAVA ROVNIC JE HOTOVÁ a pokraèujeme jejím vyøešením
u = K\F; % øešení soustavy
plot(x,u') %---!POZOR! vektor x je øádkový a vektor u sloupcový--, vykreslení øešení získaného pomocí MKP
hold on
%% Volání bvp4c
I=BVP(); %Matice kde v prvním øádku jsou uzly, ve druhém hodnoty øešení bvp4c pro daný uzel
E=[x;u']; %Matice kde v prvním øádku jsou uzly, ve druhém hodnoty øešení MKP pro daný uzel

end





% dydt=@(x,y)[y(2); (sin(x*x)+20*x*y(2)-( (9.5*y(1))/(x+1)) )   / (-1*(10*x*x+3)) ];
% dydt=@(x,y)[y(2); (y(2).*20.*x-9.5/(x+1)*y(1)+sin(x.*x))/(10.*x.*x+3)];


%dydt=@(x,y)[y(2); (y(2).*20.*x-9.5/(x+1)*y(1)+sin(x.*x))/(-10.*x.*x-3)];
%bc=@(ya,yb)[ya(2)-7.*ya(1)+1.59; yb(2)+10.*yb(1)-3.66];
%yinit=@(x)[0; 1];
%solinit=bvpinit(linspace(0,1,10),yinit);
%sol=bvp4c(dydt,bc,solinit);