function [ output_args ] = Graf( A,B,x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
T=length(B);
hustota=A(:,T,1);
rychlost=A(:,T,2)./hustota;
tlak=0.4*(A(:,T,3)-0.5*hustota.*rychlost.*rychlost);

figure
subplot(3,1,1);
line(x,hustota);
subplot(3,1,2);
line(x,rychlost);
subplot(3,1,3);
line(x,tlak);

end

