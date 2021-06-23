function createfigure(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  x 数据的向量
%  Y1:  y 数据的向量

%  由 MATLAB 于 25-Apr-2021 18:47:25 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 plot
plot(X1,Y1,'MarkerFaceColor',[1 0 0],'Marker','o','LineStyle',':',...
    'Color',[0 0 0]);

% 创建 ylabel
ylabel('角度/°');

% 创建 xlabel
xlabel('时间/ms');

box(axes1,'on');
