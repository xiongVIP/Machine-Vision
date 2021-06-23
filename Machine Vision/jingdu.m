clc;clear;close all;

load('C:\Users\Administrator\Desktop\同步文件\毕业设计文档\数据\静态实验\霍夫变换分辨率.mat');
figure(1),
dcm_obj = datacursormode(gcf);
set(dcm_obj,'UpdateFcn',@NewCallback)
scatter(time,angle_1,'r');
xlabel('时间/s'),ylabel('角度/°'),
set(gca,'FontSize',16)
box on

load('C:\Users\Administrator\Desktop\同步文件\毕业设计文档\数据\静态实验\ransac精确分辨率.mat');
figure(2),
dcm_obj = datacursormode(gcf);
set(dcm_obj,'UpdateFcn',@NewCallback)
scatter(time,angle_1,'b');
xlabel('时间/s'),ylabel('角度/°'),
set(gca,'FontSize',16)
box on

load('C:\Users\Administrator\Desktop\同步文件\毕业设计文档\数据\静态实验\ransac高速分辨率.mat');
figure(3),
dcm_obj = datacursormode(gcf);
set(dcm_obj,'UpdateFcn',@NewCallback)
scatter(time,angle_1,'m');
xlabel('时间/s'),ylabel('角度/°'),
set(gca,'FontSize',16)
box on