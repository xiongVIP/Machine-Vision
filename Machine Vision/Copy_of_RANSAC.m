
%%%ransac��άֱ�����
iteration = 40; %��������
threshold =1;%������ֵ
model=1;%����ģʽ
frame = imread('D:\Machine-vision-data\20210526T011854_���㾲̬.png');

switch model
    case 1
        BW = edge(frame,'roberts', 0.0605);%��ȷ��   
    case 2
        BW = 1-im2bw(frame,40/255);%���ٷ�
    otherwise
        msgbox('����1����ȷ����2�����ٷ�');
end
%�㷨�Ż�
            figure(2),
            imshow(1-BW);hold on,
BW_UP = BW(1 : 5, :);%��ȡͼ���ϱ�Ե����
BW_DOWN = BW(2 / 3 * end - 4 : 2 / 3 * end , :);%��ȡͼ���±�Ե����

[row,column] = find(BW);
data = [row,column]';

[row_up,column_up] = find(BW_UP);
up_data = [row_up,column_up]';

[row_down,column_down] = find(BW_DOWN);
down_data = [row_down,column_down]';
down_data (1 , :) = down_data (1 , :) + 2 / 3 * size(BW,1);

bestParameter1=0; 
bestParameter2=0; %���ƥ��Ĳ���
pretotal=0;     %�������ģ�͵����ݵĸ���

k=0;
angle=0;
bast_point=zeros(2,2);
for i = 1:iteration
    %���ѡ��������
    if size(row_up,1) > 1 && size(row_down,1) > 1
        idx_up = randperm(size(row_up,1),1); 
        up_sample = up_data(:,idx_up); 

        idx_down = randperm(size(row_down,1),1); 
        down_sample = down_data(:,idx_down); 

        k = (up_sample(2) - down_sample(2)) / (up_sample(1) - down_sample(1));      %ֱ��б��
        b = down_sample(2) - k * down_sample(1);
        line = [k -1 b];

        mask = abs(line * [data;ones(1,size(data,2))]);    %��ÿ�����ݵ����ֱ�ߵľ���
        total = sum(mask < threshold);              %�������ݾ���ֱ��С��һ����ֵ�����ݵĸ���

           
        if total > pretotal            %�ҵ��������ֱ�������������ֱ��
            pretotal = total;
            bestline = line;          %�ҵ���õ����ֱ��
            bast_point = [up_sample(2), up_sample(1);down_sample(2), down_sample(1)];
%             plot(bast_point(:,1),bast_point(:,2),'LineWidth',1,'color','red');
        end  
        k = bestline(1);
        radian = atan(k);%����б�ʼ��㻡��
        angle = radian * 180 / pi;%����ת��Ϊ�Ƕ�
    end
end
%��ʾ���������ϵ�����
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
%% �������ƥ������
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
