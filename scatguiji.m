clear all
clc
theta = 0:pi/60:2*pi; 
r=800;
r1=600;
for i=0:35:3500;
    x = i+r*cos(theta);
    y = r*sin(theta);
    h1=plot(x,y,'ro','Markersize',5);
    axis([0 3500 -1000 1000]);
    hold on
end
hold on
for i=0:35:3500
    x = i+r1*cos(theta);
    y = r1*sin(theta);
    h2=plot(x,y,'bo','Markersize',5);
    axis([0 3500 -1000 1000]);
    hold on
end
% axis equal; 
% grid on
% grid minor
set(gca,'FontSize',15);xlabel('���з���/Km');ylabel('���췽��/Km');
legend([h1,h2],'�Ⲩ��','�ڲ���','Orientation','horizontal');
legend('boxoff');
title('ɢ���ģʽ�����켣ͼ');
