v = [k_1 0 1];%��������
d = norm(v);%ģ��
x = [0, (k_1 / d)];
y = [0, 0];
z = [0,-1 / d];

axes(handles.axes3);
axis equal%ÿ����ȼ������̶ȵ�λ
% set(gca,'ZDir','reverse')%����z�᷽��
plot3(x,y,z,'-o');
grid on%�����̶�����
% view([1,1,1]);%�����ӽ�
axis([-2, 2, -2, 2, -2, 0]);
xlabel('x��'),ylabel('y��'),zlabel('z��');