clc;clear;
%静态测量验证
frame1= imread('C:\Users\Administrator\Desktop\同步文件\毕业设计文档\数据\静态实验\static_1_12.0131.png');
imshow(frame1);
axis equal;   
x = [0.797408251769829 0.890793465777611];
y = [0.86865671641791 0.195522388059701];
longest_line=[x;y];
k = (longest_line(2,1)-longest_line(1,1)) / (longest_line(2,2) - longest_line(1,2));

% longest_line = [1094,1;1247,720];
% k = (longest_line(2,1)-longest_line(1,1)) / (longest_line(2,2) - longest_line(1,2));
radian = atan(k);%根据斜率计算弧度
angle = radian * 180 / pi;%弧度转换为角度