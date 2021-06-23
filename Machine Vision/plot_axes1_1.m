axes(handles.axes1);
imshow(frame_1);
hold on;
plot(longest_line_1(:,1),longest_line_1(:,2),'LineWidth',1,'color','red');%绘制最长的直线       
hold off;    