function [ HRoe,u,a ] = RoeMetod(L,R )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
roL=L(1);
uL=L(2)/L(1);
pL=(1.4-1)*(L(3)-0.5*roL*uL*uL);
roR=R(1);
uR=R(2)/R(1);
pR=(1.4-1)*(R(3)-0.5*roR*uR*uR);
u=(sqrt(roL)*uL+sqrt(roR)*uR)/(sqrt(roL)+sqrt(roR));
aL=sqrt(1.4*pL/roL);
aR=sqrt(1.4*pR/roR);
HL=(aL*aL)/(1.4-1)+0.5*uL*uL;
HR=(aR*aR)/(1.4-1)+0.5*uR*uR;
H=(sqrt(roL)*HL+sqrt(roR)*HR)/(sqrt(roL)+sqrt(roR));
a=sqrt((1.4-1)*(H-0.5*u*u));

EL=(pL)/(1.4-1)+0.5*roL*uL*uL;
ER=(pR)/(1.4-1)+0.5*roR*uR*uR;
wL=[L(1) L(2) L(3)];
wR=[R(1) R(2) R(3)];
%wL=[roL,roL*uL,EL];
%wR=[roR,roR*uR,ER];
delta=wR-wL;
g2=((1.4-1)/(a*a))*((H-u*u)*delta(1)+u*delta(2)-delta(3));
g1=(1/(2*a))*((u+a)*delta(1)-delta(2)-a*g2 ) ;
g3=delta(1)-g2-g1;%tady na tom øádku je možná chyba v -g1, v textu je psáno -g3
gamma=[g1, g2, g3];
lambdaRoe=[u-a, u, u+a];
lambdawL=[uL-aL, uL, uL+aL];
lambdawR=[uR-aR,uR,uR+aR];
if lambdaRoe(2)>0
    wLh=wL+gamma(1)*[1, u-a, H-a*u];
    PomU=wLh(2)/wLh(1);
    PomP=(1.4-1)*(wLh(3)-0.5*wLh(1)*PomU*PomU);
    PomA=sqrt(1.4*PomP/wLh(1));
    lambdawLh=[PomU-PomA, PomU, PomU+PomA];
    if (lambdawL(1)<0) && ( lambdawLh(1)>0)
        L1=lambdawL(1)*(lambdawLh(1)-lambdaRoe(1))/(lambdawLh(1)-lambdawL(1));
    else
        L1=lambdaRoe(1);
    end
    LRoe=min(0,L1);
    R1=[1, u-a, H-a*u];
    %E=(pL/(1.4-1))+0.5*roL*uL*uL;
    fwL=[roL*uL, roL*uL*uL+pL, (EL+pL)*uL];
    HRoe=fwL+LRoe*gamma(1)*R1;    
elseif lambdaRoe(2)<=0
    wRh=wR-gamma(3)*[1, u+a, H+a*u];
    PomU=wRh(2)/wRh(1);
    PomP=(1.4-1)*(wRh(3)-0.5*wRh(1)*PomU*PomU);
    PomA=sqrt(1.4*PomP/wRh(1));
    lambdawRh=[PomU-PomA,PomU,PomU+PomA];
    if (lambdawR(3)>0)&&(lambdawRh(3)<0)
        L3=lambdawR(3)*(lambdaRoe(3)-lambdawRh(3))/(lambdawR(3)-lambdawRh(3));
    else
        L3=lambdaRoe(3);
    end
    LRoe=max(L3,0);
    R3=[1, u+a, H+a*u];
    %E=(pR/(1.4-1))+0.5*roR*uR*uR;    
    fwR=[roR*uR, roR*uR*uR+pR, (ER+pR)*uR];
    HRoe=fwR-LRoe*gamma(3)*R3;
end



end

