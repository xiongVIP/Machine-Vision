clc;clear;close all;

load('C:\Users\Administrator\Desktop\ͬ���ļ�\��ҵ����ĵ�\����\��̬ʵ��\����任�ֱ���.mat');
figure(1),
dcm_obj = datacursormode(gcf);
set(dcm_obj,'UpdateFcn',@NewCallback)
scatter(time,angle_1,'r');
xlabel('ʱ��/s'),ylabel('�Ƕ�/��'),
set(gca,'FontSize',16)
box on

load('C:\Users\Administrator\Desktop\ͬ���ļ�\��ҵ����ĵ�\����\��̬ʵ��\ransac��ȷ�ֱ���.mat');
figure(2),
dcm_obj = datacursormode(gcf);
set(dcm_obj,'UpdateFcn',@NewCallback)
scatter(time,angle_1,'b');
xlabel('ʱ��/s'),ylabel('�Ƕ�/��'),
set(gca,'FontSize',16)
box on

load('C:\Users\Administrator\Desktop\ͬ���ļ�\��ҵ����ĵ�\����\��̬ʵ��\ransac���ٷֱ���.mat');
figure(3),
dcm_obj = datacursormode(gcf);
set(dcm_obj,'UpdateFcn',@NewCallback)
scatter(time,angle_1,'m');
xlabel('ʱ��/s'),ylabel('�Ƕ�/��'),
set(gca,'FontSize',16)
box on