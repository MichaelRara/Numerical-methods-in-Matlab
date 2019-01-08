%% Vijayasundaram numerical flux

function [HVija,u_Vija,a_Vija] = Vijayasundaram(L,R)

wL = [L(1) L(2) L(3)];
wL = wL';
wR = [R(1) R(2) R(3)];
wR = wR';
gama=1.4;

w_Vija = 0.5*(wL+wR);
ro_Vija = w_Vija(1);
E_Vija = w_Vija(3);
u_Vija = w_Vija(2)/w_Vija(1);
p_Vija = (gama - 1)*(E_Vija - 0.5*ro_Vija*(u_Vija^2));
a_Vija = sqrt((gama*p_Vija)/ro_Vija);

lambda_1_Vija = u_Vija - a_Vija;
lambda_2_Vija = u_Vija;
lambda_3_Vija = u_Vija + a_Vija;

lambda_1_Vija_plus = max(0,lambda_1_Vija);
lambda_2_Vija_plus = max(0,lambda_2_Vija);
lambda_3_Vija_plus = max(0,lambda_3_Vija);

lambda_Vija_plus = [lambda_1_Vija_plus, lambda_2_Vija_plus, lambda_3_Vija_plus];

lambda_1_Vija_minus = min(0,lambda_1_Vija);
lambda_2_Vija_minus = min(0,lambda_2_Vija);
lambda_3_Vija_minus = min(0,lambda_3_Vija);

lambda_Vija_minus = [lambda_1_Vija_minus, lambda_2_Vija_minus, lambda_3_Vija_minus];

H_Vija = (a_Vija^2)/(gama-1) + 0.5*(u_Vija^2);

T_Vija = [1, 1, 1;(u_Vija - a_Vija),u_Vija,(u_Vija + a_Vija);H_Vija - (u_Vija*a_Vija),0.5*(u_Vija^2),H_Vija + (u_Vija*a_Vija)];
T_Vija_inv = inv(T_Vija);

D_Vija_plus = diag(lambda_Vija_plus);
D_Vija_minus = diag(lambda_Vija_minus);

A_Vija_plus = T_Vija*D_Vija_plus*T_Vija_inv;
A_Vija_minus = T_Vija*D_Vija_minus*T_Vija_inv;

HVija = A_Vija_plus*wL + A_Vija_minus*wR;

end