vid_1 = videoinput('winvideo',1,'MJPG_1280x720');
%         imaqmex('feature','-limitPhysicalMemoryUsage',false);
        % ����Դ�������Է�ʽ
        vid_src = getselectedsource(vid_1);
        set(vid_src,'Tag','motion detection setup');
        set(vid_1,'ReturnedColorSpace','grayscale');%����Ϊ�ڰ�ģʽ 
        set(vid_1,'TriggerRepeat',Inf);%������ȡͼ��
        set(vid_1,'FramesPerTrigger',1)%�趨ÿ�δ�������֡��Ϊ1
        vid_1.FrameGrabInterval = 1;%ץȡʱ������ÿһ֡ץȡһ��ͼ��
%         src=getselectedsource(vid_1);%�õ�Դ���������
        start(vid_1);    