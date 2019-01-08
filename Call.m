function [ Mat,Time,UzlyX ] = Call(l,N1,x0,T,N2,roL,uL,pL,roR,uR,pR,Metod)
%UNTITLED Summary of this function goes here
%   l=1; N1=100; x0=0.5; T=0.2; N2=70; wL=[1 0 1]; wR=[0.125, 0, 0.1]; wL=[1 0 1]
% [A,B,C]=Call(1,100,0.5,0.2,70,1,0,1,0.125,0,0.1); test 0
% [A,B,C]=Call(1,100,0.3,0.2,70,1,0.75,1,0.125,0,0.1); test 1
% [A,B,C]=Call(1,100,0.5,0.15,70,1,-2,0.4,1,2,0.4); test 2
% [A,B,C]=Call(1,100,0.5,0.012,70,1,0,1000,1,0,0.01); test 3
% [A,B,C]=Call(1,100,0.4,0.035,70,5.99924,19.5975,460.894,5.99942,-6.19633,46.095); test 4
% [A,B,C]=Call(1,100,0.8,0.012,70,1,-19.59754,1000,1,-19.59745,0.01); test 5

wL=[roL,roL*uL, (pL/(1.4-1))+(0.5*roL*uL*uL)];
wR=[roR,roR*uR, (pR/(1.4-1))+(0.5*roR*uR*uR)];
ht=l/N1;
h=[0:ht:l]; %ht=uzly na ose x
h=[-ht, h, l+ht];%k uzl�m na ose kx p��d�me nult� a N+1. uzel
hN=length(h);%po�et uzl� na ose x
kt=T/N2; %
k=[0:kt:T];%uzly na �asov� ose
kN=length(k);%po�et uzl� na �asov� ose
W=zeros(hN,kN,3);%Matice �e�en�
for j=1:hN %nastaven� po��te�n� podm�nky pro uzly v �ase 0
    if h(j)<x0
        W(j,1,:)=wL;
    else
        W(j,1,:)=wR;
    end
end
%vypo��t�n� v�sledn� matice hodnot
for i=2:kN %Iterace p�es �as
    for j=2:hN-1 % iterace p�es osu x od 2. ��dku matice �e�en� a� po p�edposledn� ��dek matice �e�en�
        u=W(j,i-1,:);
        v=W(j+1,i-1,:);
        z=W(j-1,i-1,:);
        if Metod==1
            [HRoe1(1,1,:),uRoe(j),aRoe(j)]=RoeMetod(u(1,1,:),v(1,1,:));
            HRoe2(1,1,:)=RoeMetod(z,u);
        else 
            HRoe1(1,1,:)=Vijayasundaram(u,v);
            HRoe2(1,1,:)=Vijayasundaram(z,u); 
        end
        W(j,i,:)=W(j,i-1,:)-kt/ht*(HRoe1-HRoe2);
        if j==2
            W(j-1,i,:)=W(j,i,:);
        elseif j==hN-1
            W(j+1,i,:)=W(j,i,:);
        end
    end
    if Metod==1
        if kt > 0.9*ht*((max(uRoe + aRoe))^-1);
            disp('Nespln�na podm�nka d�lky �asov�ho kroku');
        end
    end;
end

Mat=W;%v�sledn� matice �e�en�
Time=k;%uzly na �asov� ose
UzlyX=h;%uzly na ose x







end

