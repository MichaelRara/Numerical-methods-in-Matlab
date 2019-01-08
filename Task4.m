function [ e ] = Task4( N,eps )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
h=1/N;
Points=[0:h:1];
r(1)=0;
r(N+1)=0;
MainDiag(1:N-2)=(2*eps)/(h*h)+3/(2*h);
MainDiag=[2*eps/(h*h) MainDiag];
UpDiag(1:N-3)= -eps/(h*h);
UpDiag=[-eps/(h*h)+1/(2*h) UpDiag];
LowDiag1(1:N-2)= -(eps)/(h*h)-2/h;
LowDiag2(1:N-3)=1/(2*h);
M=diag(MainDiag)+diag(UpDiag,1)+diag(LowDiag1,-1)+diag(LowDiag2,-2);
v(1:N-1)=1;
r=M\v';
r2=[0 r' 0];
plot(Points,r2)
hold on
x=Points;
f=@(x) x-(1-exp(x/eps))/(1-exp(1/eps));
y=f(x);
plot(x,y)
e=norm(r2-y,Inf);
end

