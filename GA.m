clc
clear all
close all
%% ��������ͼ
H=519*10^3;%ƽ̨�߶�519km
c=3e8;%����
T=6840*10^6;%��ʱ��1����
t1=4534;%4405+129�ȴ�SAR������
t2=7167;
t3=2*H/c;
t4=2*H/c;
tt=5;%SAR����
t=20;%����ģʽ����
P1=7000;%SAR��ֵ���ʣ�W��
P2=75;%ɢ��Ʒ�ֵ���ʣ�W��
P3=120;%�����Ƿ�ֵ���ʣ�W��
P4=57;%�߶ȼƷ�ֵ���ʣ�W��
lbx=140;ubx=190; %�����Ա���x��Χ��PRI
lby=500;uby=561; %�����Ա���y��Χ����һ�η���SAR��ʱ��
z= @(x,y)P1*(tt*(T-y-t1)*0.64./10.64*x)*10^(-6)+P2*(20*(T-2*t-t2)./3*x)*10^(-6)+P3*(20*(T-2*t-t3)./3*x)*10^(-6)+P4*(20*(T-2*t-t4)./3*x)*10^(-6);

%% �����Ŵ��㷨����
NIND=40;        %������Ŀ
MAXGEN=50;      %����Ŵ�����
PRECI=20;       %�����Ķ�����λ��
GGAP=0.95;      %����
px=0.7;         %�������
pm=0.01;        %�������
trace=zeros(3,MAXGEN);                        %Ѱ�Ž���ĳ�ʼֵ
FieldD=[PRECI PRECI;lbx lby;ubx uby;1 1;0 0;1 1;1 1];                      %����������
Chrom=crtbp(NIND,PRECI*2);                      %��ʼ��Ⱥ
%% �Ż�
gen=0;                                  %��������
XY=bs2rv(Chrom,FieldD);                 %�����ʼ��Ⱥ��ʮ����ת��
X=XY(:,1);Y=XY(:,2);
ObjV=P1*(tt*(T-Y-t1)./X)*10^(-6)+P2*(20*(T-2*t-t2)./X)*10^(-6)+P3*(20*(T-2*t-t3)./X)*10^(-6)+P4*(20*(T-2*t-t4)./X)*10^(-6);        %����Ŀ�꺯��ֵ
while gen<MAXGEN
   FitnV=ranking(ObjV);                              %������Ӧ��ֵ
   SelCh=select('sus',Chrom,FitnV,GGAP);              %ѡ��
   SelCh=recombin('xovsp',SelCh,px);                  %����
   SelCh=mut(SelCh,pm);                               %����
   XY=bs2rv(SelCh,FieldD);               %�Ӵ������ʮ����ת��
   X=XY(:,1);Y=XY(:,2);
   ObjVSel=P1*(tt*(T-Y-t1)./X)*10^(-6)+P2*(20*(T-2*t-t2)./X)*10^(-6)+P3*(20*(T-2*t-t3)./X)*10^(-6)+P4*(20*(T-2*t-t4)./X)*10^(-6);             %�����Ӵ���Ŀ�꺯��ֵ
   [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %�ز����Ӵ����������õ�����Ⱥ
   XY=bs2rv(Chrom,FieldD);
   gen=gen+1;                                             %������������
   %��ȡÿ�������Ž⼰����ţ�YΪ���Ž�,IΪ��������
   [Y,I]=min(ObjV);
   trace(1:2,gen)=XY(I,:);                       %����ÿ��������ֵ
   trace(3,gen)=Y;                               %����ÿ��������ֵ
end

%% ������ͼ
plot(1:MAXGEN,trace(3,:),'-o');
% grid on
xlabel('�Ŵ�����')
ylabel('�����ź��������/J')
title('��������')
bestZ=trace(3,end);
bestX=trace(1,end);
bestY=trace(2,end);
fprintf(['���Ž�:\nX=',num2str(bestX),'\nY=',num2str(bestY),'\nZ=',num2str(bestZ),'\n'])
hold on



%% �����Ŵ��㷨����
NIND=50;        %������Ŀ
MAXGEN=50;      %����Ŵ�����
PRECI=20;       %�����Ķ�����λ��
GGAP=0.95;      %����
px=0.9;         %�������
pm=0.03;        %�������
trace=zeros(3,MAXGEN);                        %Ѱ�Ž���ĳ�ʼֵ
FieldD=[PRECI PRECI;lbx lby;ubx uby;1 1;0 0;1 1;1 1];                      %����������
Chrom=crtbp(NIND,PRECI*2);                      %��ʼ��Ⱥ
%% �Ż�
gen=0;                                  %��������
XY=bs2rv(Chrom,FieldD);                 %�����ʼ��Ⱥ��ʮ����ת��
X=XY(:,1);Y=XY(:,2);
ObjV=P1*(tt*(T-Y-t1)./X)*10^(-6)+P2*(20*(T-2*t-t2)./X)*10^(-6)+P3*(20*(T-2*t-t3)./X)*10^(-6)+P4*(20*(T-2*t-t4)./X)*10^(-6);        %����Ŀ�꺯��ֵ
while gen<MAXGEN
   FitnV=ranking(ObjV);                              %������Ӧ��ֵ
   SelCh=select('sus',Chrom,FitnV,GGAP);              %ѡ��
   SelCh=recombin('xovsp',SelCh,px);                  %����
   SelCh=mut(SelCh,pm);                               %����
   XY=bs2rv(SelCh,FieldD);               %�Ӵ������ʮ����ת��
   X=XY(:,1);Y=XY(:,2);
   ObjVSel=P1*(tt*(T-Y-t1)./X)*10^(-6)+P2*(20*(T-2*t-t2)./X)*10^(-6)+P3*(20*(T-2*t-t3)./X)*10^(-6)+P4*(20*(T-2*t-t4)./X)*10^(-6);             %�����Ӵ���Ŀ�꺯��ֵ
   [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %�ز����Ӵ����������õ�����Ⱥ
   XY=bs2rv(Chrom,FieldD);
   gen=gen+1;                                             %������������
   %��ȡÿ�������Ž⼰����ţ�YΪ���Ž�,IΪ��������
   [Y,I]=min(ObjV);
   trace(1:2,gen)=XY(I,:);                       %����ÿ��������ֵ
   trace(3,gen)=Y;                               %����ÿ��������ֵ
end

%% ������ͼ

plot(1:MAXGEN,trace(3,:),'-*');
% grid on
xlabel('�Ŵ�����')
ylabel('�����ź��������/J')
title('��������')
bestZ=trace(3,end);
bestX=trace(1,end);
bestY=trace(2,end);
fprintf(['���Ž�:\nX=',num2str(bestX),'\nY=',num2str(bestY),'\nZ=',num2str(bestZ),'\n'])

