vid_1 = videoinput('winvideo',1,'MJPG_1280x720');
%     imaqmex('feature','-limitPhysicalMemoryUsage',false);        
    % ����Դ�������Է�ʽ
    vid_src = getselectedsource(vid_1);
    set(vid_src,'Tag','motion detection setup');
    set(vid_1,'ReturnedColorSpace','grayscale');%����Ϊ�ڰ�ģʽ 
    set(vid_1,'TriggerRepeat',Inf);%������ȡͼ��
    set(vid_1,'FramesPerTrigger',1)%�趨ÿ�δ�������֡��Ϊ1
    vid_1.FrameGrabInterval = 1;%ץȡʱ������ÿһ֡ץȡһ��ͼ��
    vidRes_1=get(vid_1,'VideoResolution');          %�����ý��ĳ�����Ƕ�ά����
    nBands_1=get(vid_1,'NumberOfBands');            %���ͼ�����ɫ����                                  
    axes(handles.axes1);
    hImage_1=image(zeros(vidRes_1(2),vidRes_1(1),nBands_1));%���ͼ��ľ��
    preview(vid_1,hImage_1);