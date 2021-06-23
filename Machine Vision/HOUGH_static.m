function [k,angle,longest_line] = HOUGH_static(frame)
%% 边缘检测
BW = edge(frame,'roberts', 0.0605);
%% hough变换
[H,theta,rho] = hough(BW,'Theta', -40:1:40);%-90:1:89
P = houghpeaks(H,2);%寻找极值点
lines = houghlines(BW,theta,rho,P,'FillGap',720,'MinLength',20);%提取直线
% 比较出最长的直线
max_len = 0;
longest_line = zeros(2,2);
for i = 1:length(lines)
    new_line = [lines(i).point1; lines(i).point2];
    Length = norm(lines(i).point1 - lines(i).point2);
    %储存最长的直线
    if(Length > max_len)
        max_len = Length;
        longest_line = new_line;
    end
end
% 根据最长的直线求倾斜角度
k = (longest_line(2,1)-longest_line(1,1)) / (longest_line(2,2) - longest_line(1,2));
radian = atan(k);%根据斜率计算弧度
angle = radian * 180 / pi;%弧度转换为角度


