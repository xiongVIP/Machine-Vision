function createfigure(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  x ���ݵ�����
%  Y1:  y ���ݵ�����

%  �� MATLAB �� 25-Apr-2021 18:47:25 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% ���� plot
plot(X1,Y1,'MarkerFaceColor',[1 0 0],'Marker','o','LineStyle',':',...
    'Color',[0 0 0]);

% ���� ylabel
ylabel('�Ƕ�/��');

% ���� xlabel
xlabel('ʱ��/ms');

box(axes1,'on');
