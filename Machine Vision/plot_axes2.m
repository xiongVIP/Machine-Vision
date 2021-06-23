axes(handles.axes2);
imshow(frame_2);
hold on;
plot(longest_line_2(:,1),longest_line_2(:,2),'LineWidth',1,'color','red');%绘制最长的直线
hold off;