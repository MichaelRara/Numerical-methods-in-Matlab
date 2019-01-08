function [ k,v ] = Call(a,b,n,eps,t )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%[a,b] =  Call(50,25,10,0.01,1)
%[a,b] =  Call(50,25,10,0.04,2)
%[a,b] =  Call(50,25,10,0.04,3)
%[a,b] =  Call(50,25,10,0.01,4)
%[a,b] =  Call(50,25,10,0.01,5)
N=zeros(n,1);
e=zeros(n,1);
q=zeros(n-1,1);
h=zeros(n,1);
for k=1:n
   N(k)=a+b*k;
   h(k)=1/N(k);
   switch t
       case 1
            e(k)=Task1(N(k),eps);
       case 2
            e(k)=Task2(N(k),eps);
       case 3
            e(k)=Task3(N(k),eps);
       case 4
            e(k)=Task4(N(k),eps);
       case 5
            e(k)=Task5(N(k),eps);
       otherwise
            disp('Wrong entry.')
       return
   end
end
P=polyfit(log(h),log(abs(e)),1);
k=P(1);
for i=1:n-1
    q(i)=log(e(i+1)/e(i))/log(h(i+1)/h(i));
end;
v=q;
end

