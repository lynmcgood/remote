clear all
clc
theta = 0:pi/60:2*pi; 
r=600;
for i=0:35:3500
    x = i+r*cos(theta);
    y = r*sin(theta);
    h1=plot(x,y,'r-','Markersize',5);
    axis([0 3500 -800 800]);
    hold on
end
% axis equal; 
% grid on
% grid minor
set(gca,'FontSize',15);xlabel('飞行方向/m');ylabel('交轨方向/m');
title('高度计模式波束轨迹图');
