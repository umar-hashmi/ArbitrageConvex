clear 
close all
clc
load('real_time_data')
tic
pts = 96; %%number of points considered
%time=real(1:pts,2);
price=real(:,1);
h=0.25;
load('consumption')
P_cons=P_consumption*h;

e_ch=0.95;
e_dis =0.95;
del_max = 0.26;
del_min = -0.52;
B_0 = 0.5*ones(pts,1);
B_max = 1*ones(pts,1);
B_min = 0.1*ones(pts,1);
alpha=10.5;
p_b=price;
p_s=alpha*price;
x_upper= del_max*h*ones(pts,1);
x_lower= del_min*h*ones(pts,1);

M = tril(ones(pts,pts));

cvx_begin 
variables x_ch(pts,1) x_ds(pts,1) 
variables b_p_bat(pts,1)
variables lhouse(pts,1) 
% theta_max(pts,1) theta_min(pts,1)
minimize sum(price'*subplus(lhouse) - alpha*price'*min(0,lhouse))           %trace((x_ch/e_ch-x_ds*e_dis)*price')
subject to 
    zeros(pts,1)<= x_ch <= x_upper;    %%charging 
    zeros(pts,1)<= x_ds <= -x_lower;    %% discharging 
    b_p_bat == x_ch-x_ds;
    lhouse == x_ch/e_ch - x_ds*e_dis + P_cons;
%     theta_max == max(0,lhouse);
% %     theta_max >= lhouse;
%     theta_min >= -max(0,-lhouse);
%     theta_min >= -lhouse;
    B_min <= B_0 + M*b_p_bat <= B_max;  %%battery capacity
cvx_end
profit_only_arbitrage =  (p_b'*subplus(P_cons) - p_s'*subplus(-P_cons)) - (p_b'*subplus(lhouse) - p_s'*subplus(-lhouse))
B = B_0 + M*b_p_bat;

figure
plot(B)
hold on
%
%% alpha 1
cvx_begin 
variables x_ch(pts,1) x_ds(pts,1) 
variables b_p_bat(pts,1)
minimize sum(price'*x_ch/e_ch-price'*x_ds*e_dis)           %trace((x_ch/e_ch-x_ds*e_dis)*price')
subject to 
    zeros(pts,1)<= x_ch <= x_upper;    %%charging 
    zeros(pts,1)<= x_ds <= -x_lower;    %% discharging 
    b_p_bat == x_ch-x_ds;
    B_min <= B_0 + M*b_p_bat <= B_max;  %%battery capacity
cvx_end
profit_only_arbitrage =  sum(price'*x_ch/e_ch-price'*x_ds*e_dis)
B = B_0 + M*b_p_bat;

plot(B)