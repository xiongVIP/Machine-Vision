clear;clc;close all;
% scatter(frame_time(1:length(angle_1)),angle_1,'r.')

load('C:\Users\Administrator\Desktop\同步文件\毕业设计文档\数据\动态实验\pid\pid-1.mat')
angle_coder = theta.signals.values * ( - 62.57);
time_coder = theta.time+0.065;
% load('C:\Users\Administrator\Desktop\同步文件\毕业设计文档\数据\动态实验\pid\实验2\pid-2.mat')
% angle_coder = theta.signals.values * ( - 62.57);
% time_coder = theta.time + 2.224;

load('C:\Users\Administrator\Desktop\同步文件\毕业设计文档\数据\动态实验\pid\实验1\视频测量-hough.mat')
angle_hough = angle_1;
time_hough = frame_time;
load('C:\Users\Administrator\Desktop\同步文件\毕业设计文档\数据\动态实验\pid\实验1\视频测量-ransac1.mat')
angle_ransac_1 = angle_1;
time_ransac_1 = frame_time;
load('C:\Users\Administrator\Desktop\同步文件\毕业设计文档\数据\动态实验\pid\实验1\视频测量-ransac2.mat')
angle_ransac_2 = angle_1;
time_ransac_2 = frame_time;

figure(1),
% subplot(3,1,1),
plot(time_coder,angle_coder,'g','MarkerFaceColor','g','LineWidth',2);hold on,
plot(time_hough(1:length(angle_hough)),angle_hough,'r+','MarkerFaceColor','r');
legend('编码器','霍夫变换','FontSize',16),
xlim([0,21]);
ylim([-8,8]);
xlabel('时间/s'),
ylabel('角度/°'),
set(gca,'FontSize',16)
hold off
figure(2),
% subplot(3,1,2),
plot(time_coder,angle_coder,'g','MarkerFaceColor','g','LineWidth',2);hold on,
plot(time_ransac_1(1:length(angle_ransac_1)),angle_ransac_1,'b+','MarkerFaceColor','b');
legend('编码器','RANSAC精确','FontSize',16)
xlim([0,21]);
ylim([-8,8]);
xlabel('时间/s'),
ylabel('角度/°'),
set(gca,'FontSize',16)
hold off
figure(3),
% subplot(3,1,3),
plot(time_coder,angle_coder,'g','MarkerFaceColor','g','LineWidth',2);hold on,
plot(time_ransac_2(1:length(angle_ransac_2)),angle_ransac_2,'m+','MarkerFaceColor','m');
legend('编码器','RANSAC高速','FontSize',16)
xlim([0,21]);
ylim([-8,8]);
xlabel('时间/s'),
ylabel('角度/°'),
set(gca,'FontSize',16)
hold off


