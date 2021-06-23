vid_1 = videoinput('winvideo',1,'MJPG_1280x720');
%         imaqmex('feature','-limitPhysicalMemoryUsage',false);
        % 设置源对象属性方式
        vid_src = getselectedsource(vid_1);
        set(vid_src,'Tag','motion detection setup');
        set(vid_1,'ReturnedColorSpace','grayscale');%设置为黑白模式 
        set(vid_1,'TriggerRepeat',Inf);%持续获取图像
        set(vid_1,'FramesPerTrigger',1)%设定每次触发捕获帧数为1
        vid_1.FrameGrabInterval = 1;%抓取时间间隔，每一帧抓取一张图像
%         src=getselectedsource(vid_1);%得到源对象的属性
        start(vid_1);    