clear;clc;close all;
% scatter(frame_time(1:length(angle_1)),angle_1,'r.')

load('C:\Users\Administrator\Desktop\ͬ���ļ�\��ҵ����ĵ�\����\��̬ʵ��\pid\pid-1.mat')
angle_coder = theta.signals.values * ( - 62.57);
time_coder = theta.time+0.065;
% load('C:\Users\Administrator\Desktop\ͬ���ļ�\��ҵ����ĵ�\����\��̬ʵ��\pid\ʵ��2\pid-2.mat')
% angle_coder = theta.signals.values * ( - 62.57);
% time_coder = theta.time + 2.224;

load('C:\Users\Administrator\Desktop\ͬ���ļ�\��ҵ����ĵ�\����\��̬ʵ��\pid\ʵ��1\��Ƶ����-hough.mat')
angle_hough = angle_1;
time_hough = frame_time;
load('C:\Users\Administrator\Desktop\ͬ���ļ�\��ҵ����ĵ�\����\��̬ʵ��\pid\ʵ��1\��Ƶ����-ransac1.mat')
angle_ransac_1 = angle_1;
time_ransac_1 = frame_time;
load('C:\Users\Administrator\Desktop\ͬ���ļ�\��ҵ����ĵ�\����\��̬ʵ��\pid\ʵ��1\��Ƶ����-ransac2.mat')
angle_ransac_2 = angle_1;
time_ransac_2 = frame_time;

figure(1),
% subplot(3,1,1),
plot(time_coder,angle_coder,'g','MarkerFaceColor','g','LineWidth',2);hold on,
plot(time_hough(1:length(angle_hough)),angle_hough,'r+','MarkerFaceColor','r');
legend('������','����任','FontSize',16),
xlim([0,21]);
ylim([-8,8]);
xlabel('ʱ��/s'),
ylabel('�Ƕ�/��'),
set(gca,'FontSize',16)
hold off
figure(2),
% subplot(3,1,2),
plot(time_coder,angle_coder,'g','MarkerFaceColor','g','LineWidth',2);hold on,
plot(time_ransac_1(1:length(angle_ransac_1)),angle_ransac_1,'b+','MarkerFaceColor','b');
legend('������','RANSAC��ȷ','FontSize',16)
xlim([0,21]);
ylim([-8,8]);
xlabel('ʱ��/s'),
ylabel('�Ƕ�/��'),
set(gca,'FontSize',16)
hold off
figure(3),
% subplot(3,1,3),
plot(time_coder,angle_coder,'g','MarkerFaceColor','g','LineWidth',2);hold on,
plot(time_ransac_2(1:length(angle_ransac_2)),angle_ransac_2,'m+','MarkerFaceColor','m');
legend('������','RANSAC����','FontSize',16)
xlim([0,21]);
ylim([-8,8]);
xlabel('ʱ��/s'),
ylabel('�Ƕ�/��'),
set(gca,'FontSize',16)
hold off


