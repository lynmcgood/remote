clc;
close all;
clear;
% %%%波谱仪轨迹示意图%%%%%%%%%%
t=0:0.05:100;
omega=2*pi*0.367
sita =omega*t;
r=110;%500差90
v=50;
x0=4;
y0=0;
x=x0+r*cos(sita)+v*t;
y=y0+r*sin(sita);
plot(x,y,'bo','Markersize',15);
% set(gcf,'color','w');
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:0.05:100;
omega=2*pi*0.367;
sita =omega*t;
r=90;
v=50;
x0=4;
y0=0;
x=x0+r*cos(sita)+v*t;
y=y0+r*sin(sita);
plot(x,y,'ro','Markersize',15);
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:0.05:100;
omega=2*pi*0.367;
sita =omega*t;
r=70;
v=50;
x0=4;
y0=0;
x=x0+r*cos(sita)+v*t;
y=y0+r*sin(sita);
plot(x,y,'go','Markersize',15);
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:0.05:100;
omega=2*pi*0.367;
sita =omega*t;
r=50;
v=50;
x0=4;
y0=0;
x=x0+r*cos(sita)+v*t;
y=y0+r*sin(sita);
plot(x,y,'mo','Markersize',15);
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:0.05:100;
omega=2*pi*0.367;
sita =omega*t;
r=30;
v=50;
x0=4;
y0=0;
x=x0+r*cos(sita)+v*t;
y=y0+r*sin(sita);
plot(x,y,'ko','Markersize',15);
axis equal; 
axis([0 450 -150 150])
set(gca,'FontSize',13);
xlabel('飞行方向/Km');
ylabel('交轨方向/Km');
title('波谱仪模式波束轨迹图');
legend('10°入射角','8°入射角','6°入射角','4°入射角','2°入射角','Orientation','horizontal');
legend('boxoff');























  
  
  

  







