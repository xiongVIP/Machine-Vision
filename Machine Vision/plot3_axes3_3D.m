v = [k_1 k_2 1];%��������
d = norm(v);%ģ��
x = [0, (k_1 / d)];
y = [0, (k_2 / d)];
z = [0,-1 / d];

axes(handles.axes3);
axis equal%ÿ����ȼ������̶ȵ�λ
% set(gca,'ZDir','reverse')%����z�᷽��
plot3(x,y,z,'-o');
grid on%�����̶�����
axis([-2, 2, -2, 2, -2, 0]);
xlabel('x��'),ylabel('y��'),zlabel('z��');