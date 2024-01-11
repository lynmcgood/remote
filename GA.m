clc
clear all
close all
%% 画出函数图
H=519*10^3;%平台高度519km
c=3e8;%光速
T=6840*10^6;%总时长1分钟
t1=4534;%4405+129等待SAR接收完
t2=7167;
t3=2*H/c;
t4=2*H/c;
tt=5;%SAR脉宽
t=20;%其余模式脉宽
P1=7000;%SAR峰值功率（W）
P2=75;%散射计峰值功率（W）
P3=120;%波谱仪峰值功率（W）
P4=57;%高度计峰值功率（W）
lbx=140;ubx=190; %函数自变量x范围，PRI
lby=500;uby=561; %函数自变量y范围，第一次发射SAR的时间
z= @(x,y)P1*(tt*(T-y-t1)*0.64./10.64*x)*10^(-6)+P2*(20*(T-2*t-t2)./3*x)*10^(-6)+P3*(20*(T-2*t-t3)./3*x)*10^(-6)+P4*(20*(T-2*t-t4)./3*x)*10^(-6);

%% 定义遗传算法参数
NIND=40;        %个体数目
MAXGEN=50;      %最大遗传代数
PRECI=20;       %变量的二进制位数
GGAP=0.95;      %代沟
px=0.7;         %交叉概率
pm=0.01;        %变异概率
trace=zeros(3,MAXGEN);                        %寻优结果的初始值
FieldD=[PRECI PRECI;lbx lby;ubx uby;1 1;0 0;1 1;1 1];                      %区域描述器
Chrom=crtbp(NIND,PRECI*2);                      %初始种群
%% 优化
gen=0;                                  %代计数器
XY=bs2rv(Chrom,FieldD);                 %计算初始种群的十进制转换
X=XY(:,1);Y=XY(:,2);
ObjV=P1*(tt*(T-Y-t1)./X)*10^(-6)+P2*(20*(T-2*t-t2)./X)*10^(-6)+P3*(20*(T-2*t-t3)./X)*10^(-6)+P4*(20*(T-2*t-t4)./X)*10^(-6);        %计算目标函数值
while gen<MAXGEN
   FitnV=ranking(ObjV);                              %分配适应度值
   SelCh=select('sus',Chrom,FitnV,GGAP);              %选择
   SelCh=recombin('xovsp',SelCh,px);                  %重组
   SelCh=mut(SelCh,pm);                               %变异
   XY=bs2rv(SelCh,FieldD);               %子代个体的十进制转换
   X=XY(:,1);Y=XY(:,2);
   ObjVSel=P1*(tt*(T-Y-t1)./X)*10^(-6)+P2*(20*(T-2*t-t2)./X)*10^(-6)+P3*(20*(T-2*t-t3)./X)*10^(-6)+P4*(20*(T-2*t-t4)./X)*10^(-6);             %计算子代的目标函数值
   [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %重插入子代到父代，得到新种群
   XY=bs2rv(Chrom,FieldD);
   gen=gen+1;                                             %代计数器增加
   %获取每代的最优解及其序号，Y为最优解,I为个体的序号
   [Y,I]=min(ObjV);
   trace(1:2,gen)=XY(I,:);                       %记下每代的最优值
   trace(3,gen)=Y;                               %记下每代的最优值
end

%% 画进化图
plot(1:MAXGEN,trace(3,:),'-o');
% grid on
xlabel('遗传代数')
ylabel('发射信号能量损耗/J')
title('进化过程')
bestZ=trace(3,end);
bestX=trace(1,end);
bestY=trace(2,end);
fprintf(['最优解:\nX=',num2str(bestX),'\nY=',num2str(bestY),'\nZ=',num2str(bestZ),'\n'])
hold on



%% 定义遗传算法参数
NIND=50;        %个体数目
MAXGEN=50;      %最大遗传代数
PRECI=20;       %变量的二进制位数
GGAP=0.95;      %代沟
px=0.9;         %交叉概率
pm=0.03;        %变异概率
trace=zeros(3,MAXGEN);                        %寻优结果的初始值
FieldD=[PRECI PRECI;lbx lby;ubx uby;1 1;0 0;1 1;1 1];                      %区域描述器
Chrom=crtbp(NIND,PRECI*2);                      %初始种群
%% 优化
gen=0;                                  %代计数器
XY=bs2rv(Chrom,FieldD);                 %计算初始种群的十进制转换
X=XY(:,1);Y=XY(:,2);
ObjV=P1*(tt*(T-Y-t1)./X)*10^(-6)+P2*(20*(T-2*t-t2)./X)*10^(-6)+P3*(20*(T-2*t-t3)./X)*10^(-6)+P4*(20*(T-2*t-t4)./X)*10^(-6);        %计算目标函数值
while gen<MAXGEN
   FitnV=ranking(ObjV);                              %分配适应度值
   SelCh=select('sus',Chrom,FitnV,GGAP);              %选择
   SelCh=recombin('xovsp',SelCh,px);                  %重组
   SelCh=mut(SelCh,pm);                               %变异
   XY=bs2rv(SelCh,FieldD);               %子代个体的十进制转换
   X=XY(:,1);Y=XY(:,2);
   ObjVSel=P1*(tt*(T-Y-t1)./X)*10^(-6)+P2*(20*(T-2*t-t2)./X)*10^(-6)+P3*(20*(T-2*t-t3)./X)*10^(-6)+P4*(20*(T-2*t-t4)./X)*10^(-6);             %计算子代的目标函数值
   [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %重插入子代到父代，得到新种群
   XY=bs2rv(Chrom,FieldD);
   gen=gen+1;                                             %代计数器增加
   %获取每代的最优解及其序号，Y为最优解,I为个体的序号
   [Y,I]=min(ObjV);
   trace(1:2,gen)=XY(I,:);                       %记下每代的最优值
   trace(3,gen)=Y;                               %记下每代的最优值
end

%% 画进化图

plot(1:MAXGEN,trace(3,:),'-*');
% grid on
xlabel('遗传代数')
ylabel('发射信号能量损耗/J')
title('进化过程')
bestZ=trace(3,end);
bestX=trace(1,end);
bestY=trace(2,end);
fprintf(['最优解:\nX=',num2str(bestX),'\nY=',num2str(bestY),'\nZ=',num2str(bestZ),'\n'])

