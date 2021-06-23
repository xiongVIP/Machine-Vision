axes(handles.axes1);
imshow(frame_1);%显示原图
hold on
plot(longest_line_1(:,1),longest_line_1(:,2),'LineWidth',1,'color','red'); %绘制最长的直线
hold off;
% pause(0.001);%暂停使得图像充分显示，程序更流畅，原因不明