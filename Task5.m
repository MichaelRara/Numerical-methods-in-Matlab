function [ e ] = Task5( N,eps )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
h=1/N; % poèet dílkù
Points=0:h:1; %uzly
A=zeros(N+1,N+1);
B=zeros(N+1,N+1);
d=ones(N+1,1);
A(2,1)=-2/(6*h);A(2,2)=-3/(6*h);A(2,3)=6/(6*h);A(2,4)=-1/(6*h);
A(3,1)=1/(6*h);A(3,2)=-6/(6*h);A(3,3)=3/(6*h);A(3,4)=2/(6*h);
for i=4:N
    A(i,i-3)=-2/(6*h);
    A(i,i-2)=9/(6*h);
    A(i,i-1)=-18/(6*h);
    A(i,i)=11/(6*h);
end
B(2,1)=11/(12*h*h);B(2,2)=-20/(12*h*h);B(2,3)=6/(12*h*h);B(2,4)=4/(12*h*h);B(2,5)=-1/(12*h*h);
for i=3:N-1
    B(i,i-2)=-1/(12*h*h);
    B(i,i-1)=16/(12*h*h);
    B(i,i)=-30/(12*h*h);
    B(i,i+1)=16/(12*h*h);
    B(i,i+2)=-1/(12*h*h);
end;
B(N,N-3)=-1/(12*h*h);B(N,N-2)=4/(12*h*h);B(N,N-1)=6/(12*h*h);B(N,N)=-20/(12*h*h);B(N,N+1)=11/(12*h*h);
C=A-eps*B;
C(1,1)=1; C(N+1,N+1)=1;
d(1)=0; d(N+1)=0;
U=C\d;
plot(Points,U)
hold on
x=Points;
f=@(x) x-(1-exp(x/eps))/(1-exp(1/eps));
y=f(x);
plot(x,y)
e=norm(U'-y,Inf);
end

