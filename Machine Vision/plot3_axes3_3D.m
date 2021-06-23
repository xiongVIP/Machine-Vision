v = [k_1 k_2 1];%方向向量
d = norm(v);%模长
x = [0, (k_1 / d)];
y = [0, (k_2 / d)];
z = [0,-1 / d];

axes(handles.axes3);
axis equal%每个轴等间距隔开刻度单位
% set(gca,'ZDir','reverse')%设置z轴方向
plot3(x,y,z,'-o');
grid on%开启刻度虚线
axis([-2, 2, -2, 2, -2, 0]);
xlabel('x轴'),ylabel('y轴'),zlabel('z轴');