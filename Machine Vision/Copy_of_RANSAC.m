
%%%ransac二维直线拟合
iteration = 40; %迭代次数
threshold =1;%距离阈值
model=1;%工作模式
frame = imread('D:\Machine-vision-data\20210526T011854_单摄静态.png');

switch model
    case 1
        BW = edge(frame,'roberts', 0.0605);%精确法   
    case 2
        BW = 1-im2bw(frame,40/255);%高速法
    otherwise
        msgbox('输入1：精确法；2：快速法');
end
%算法优化
            figure(2),
            imshow(1-BW);hold on,
BW_UP = BW(1 : 5, :);%提取图像上边缘几行
BW_DOWN = BW(2 / 3 * end - 4 : 2 / 3 * end , :);%提取图像下边缘几行

[row,column] = find(BW);
data = [row,column]';

[row_up,column_up] = find(BW_UP);
up_data = [row_up,column_up]';

[row_down,column_down] = find(BW_DOWN);
down_data = [row_down,column_down]';
down_data (1 , :) = down_data (1 , :) + 2 / 3 * size(BW,1);

bestParameter1=0; 
bestParameter2=0; %最佳匹配的参数
pretotal=0;     %符合拟合模型的数据的个数

k=0;
angle=0;
bast_point=zeros(2,2);
for i = 1:iteration
    %随机选择两个点
    if size(row_up,1) > 1 && size(row_down,1) > 1
        idx_up = randperm(size(row_up,1),1); 
        up_sample = up_data(:,idx_up); 

        idx_down = randperm(size(row_down,1),1); 
        down_sample = down_data(:,idx_down); 

        k = (up_sample(2) - down_sample(2)) / (up_sample(1) - down_sample(1));      %直线斜率
        b = down_sample(2) - k * down_sample(1);
        line = [k -1 b];

        mask = abs(line * [data;ones(1,size(data,2))]);    %求每个数据到拟合直线的距离
        total = sum(mask < threshold);              %计算数据距离直线小于一定阈值的数据的个数

           
        if total > pretotal            %找到符合拟合直线数据最多的拟合直线
            pretotal = total;
            bestline = line;          %找到最好的拟合直线
            bast_point = [up_sample(2), up_sample(1);down_sample(2), down_sample(1)];
%             plot(bast_point(:,1),bast_point(:,2),'LineWidth',1,'color','red');
        end  
        k = bestline(1);
        radian = atan(k);%根据斜率计算弧度
        angle = radian * 180 / pi;%弧度转换为角度
    end
end
%显示符合最佳拟合的数据
% mask2 = abs(bestline * [data; ones(1, size(data, 2))]) < sigma;    
% figure(1),
% hold on;
% j = 1;
% for i=1:length(mask2)
%     if mask2(i)
%         inliers(1,j) = data(1,i);
%         j = j + 1;
%         plot(data(1,i),data(2,i),'r+');
%     end
% end
%% 绘制最佳匹配曲线
% bestParameter1 = -bestline(1) / bestline(2);
% bestParameter2 = -bestline(3) / bestline(2);
% xAxis = min(inliers(1,:)):max(inliers(1,:));
% yAxis = bestParameter1*xAxis + bestParameter2;
% scatter(row,column);hold on,
% plot(xAxis,yAxis,'r-','LineWidth',1);
% set(gca,'YDir','reverse');  
% title(['bestLine:  y =  ',num2str(bestParameter1),'x + ',num2str(bestParameter2)]);
% hold off;
figure(3),
imshow(1-BW);hold on,
plot(bast_point(:,1),bast_point(:,2),'LineWidth',3,'color','red');
hold off;
