vid_2 = videoinput('winvideo',2,'MJPG_1280x720');
%         imaqmex('feature','-limitPhysicalMemoryUsage',false);        
        % 设置源对象属性方式
        vid_src = getselectedsource(vid_2);
        set(vid_src,'Tag','motion detection setup');
        set(vid_2,'ReturnedColorSpace','grayscale');%设置为黑白模式 
        set(vid_2,'TriggerRepeat',Inf);%持续获取图像
        set(vid_2,'FramesPerTrigger',1)%设定每次触发捕获帧数为1
        vid_2.FrameGrabInterval = 1;%抓取时间间隔，每一帧抓取一张图像  
        vidRes_2=get(vid_2,'VideoResolution');          %获得流媒体的长与宽，是二维数组
        nBands_2=get(vid_2,'NumberOfBands');            %获得图像的颜色层数                                  
        axes(handles.axes2);
        hImage_2=image(zeros(vidRes_2(2),vidRes_2(1),nBands_2));%获得图像的句柄
        preview(vid_2,hImage_2);