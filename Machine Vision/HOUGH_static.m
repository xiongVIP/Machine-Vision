function [k,angle,longest_line] = HOUGH_static(frame)
%% ��Ե���
BW = edge(frame,'roberts', 0.0605);
%% hough�任
[H,theta,rho] = hough(BW,'Theta', -40:1:40);%-90:1:89
P = houghpeaks(H,2);%Ѱ�Ҽ�ֵ��
lines = houghlines(BW,theta,rho,P,'FillGap',720,'MinLength',20);%��ȡֱ��
% �Ƚϳ����ֱ��
max_len = 0;
longest_line = zeros(2,2);
for i = 1:length(lines)
    new_line = [lines(i).point1; lines(i).point2];
    Length = norm(lines(i).point1 - lines(i).point2);
    %�������ֱ��
    if(Length > max_len)
        max_len = Length;
        longest_line = new_line;
    end
end
% �������ֱ������б�Ƕ�
k = (longest_line(2,1)-longest_line(1,1)) / (longest_line(2,2) - longest_line(1,2));
radian = atan(k);%����б�ʼ��㻡��
angle = radian * 180 / pi;%����ת��Ϊ�Ƕ�


