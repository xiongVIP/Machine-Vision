vid_2 = videoinput('winvideo',2,'MJPG_1280x720');
%         imaqmex('feature','-limitPhysicalMemoryUsage',false);
        % ����Դ�������Է�ʽ
        vid_src = getselectedsource(vid_2);
        set(vid_src,'Tag','motion detection setup');
        set(vid_2,'ReturnedColorSpace','grayscale');%����Ϊ�ڰ�ģʽ 
        set(vid_2,'TriggerRepeat',Inf);%������ȡͼ��
        set(vid_2,'FramesPerTrigger',1)%�趨ÿ�δ�������֡��Ϊ1
        vid_2.FrameGrabInterval = 1;%ץȡʱ������ÿһ֡ץȡһ��ͼ��
%         src=getselectedsource(vid_2);%�õ�Դ���������
        start(vid_2);    