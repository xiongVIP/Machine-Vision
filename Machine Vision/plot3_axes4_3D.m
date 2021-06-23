
axes(handles.axes4);
plot3(angle_1,angle_2,time,'k:.','MarkerFaceColor','r');
grid on%开启刻度虚线
% axis([-2, 2, -2, 2, -2, 0]);
xlabel('x角度/°');
ylabel('y角度/°');
zlabel('时间/s');