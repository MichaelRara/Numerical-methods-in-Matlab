function [ I ] = BVP(  )

dydt=@(x,y)[y(2); (y(2).*20.*x-9.5/(x+1)*y(1)+sin(x.*x))/(-10.*x.*x-3)];
bc=@(ya,yb)[ya(2)-7.*ya(1)+1.59; yb(2)+10.*yb(1)-3.66];
yinit=@(x)[0; 1];
solinit=bvpinit(linspace(0,1,10),yinit);
sol=bvp4c(dydt,bc,solinit);
plot(sol.x,sol.y(1,:)) %Vykreslení øešení pro metodu bvp4c
I=[sol.x(1:end); sol.y(1,:)]; % Tabulka hodnot získaných bvp4c
legend('MKP','bvp4c')

end

