% warning off;
% clc;clear;
% vidObj = VideoReader('D:\matlab-workspace\GUI\test.avi');
% % vidObj.CurrentTime = 0;
% time = 0;
% i=1;
% tic
% 
% while hasFrame(vidObj)
% %     vidObj.CurrentTime = vidObj.CurrentTime + time(i);
%     frame = read(vidObj,1);
% %     vidFrame = readFrame(vidObj);
% %     frame = vidFrame(:,:,1);
%     frame = frame(:,:,1);
%     [k_1,angle_1(i),longest_line_1] = HOUGH_static(frame);
%     time(i) = toc;
%     imshow(frame);
% %     hold on;
% %     plot_axes1_1;
% %     plot3_axes3_2D;
% %     hold off;
%     i = i + 1;
% %     pause(1/vidObj.FrameRate);
% 
% end
% % 
obj = VideoReader('D:\matlab-workspace\GUI\test.avi');%������Ƶλ��
Duration = obj.Duration * 1000;%��ʱ������λ/����
numFrames = obj.NumberOfFrames;% ֡������
Frame_rate = numFrames / Duration;%֡�ʣ�֡/����
time = 0;
 for i = 1 : 150
%     aa = ceil(1 + Frame_rate * sum(time) * 1000);
     frame_1 = read(obj,ceil(1 + Frame_rate * sum(time) * 1000));%��ȡ�ڼ�֡
     frame_1 = frame_1(:,:,1);
%      imwrite(frame,strcat('im',num2str(i),'.jpg'),'jpg');% ����֡
    tic
    [k_1,angle_1(i),longest_line_1] = HOUGH_static(frame_1);
    time(i) = toc;
 end