clc;
close all;
clear;
% %%%�����ǹ켣ʾ��ͼ%%%%%%%%%%
t=0:0.05:100;
omega=2*pi*0.367
sita =omega*t;
r=110;%500��90
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
xlabel('���з���/Km');
ylabel('���췽��/Km');
title('������ģʽ�����켣ͼ');
legend('10�������','8�������','6�������','4�������','2�������','Orientation','horizontal');
legend('boxoff');























  
  
  

  







