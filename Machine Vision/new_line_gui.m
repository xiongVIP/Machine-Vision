function varargout = new_line_gui(varargin)
% NEW_LINE_GUI MATLAB code for new_line_gui.fig
%      NEW_LINE_GUI, by itself, creates a new NEW_LINE_GUI or raises the existing
%      singleton*.
%
%      H = NEW_LINE_GUI returns the handle to a new NEW_LINE_GUI or the handle to
%      the existing singleton*.
%   
%      NEW_LINE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW_LINE_GUI.M with the given input arguments.
%
%      NEW_LINE_GUI('Property','Value',...) creates a new NEW_LINE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before new_line_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to new_line_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help new_line_gui

% Last Modified by GUIDE v2.5 05-May-2021 10:45:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @new_line_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @new_line_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before new_line_gui is made visible.
function new_line_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new_line_gui (see VARARGIN)

% Choose default command line output for new_line_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes new_line_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
movegui(gcf,'center');
set(gcf,'name','????????????????'); %????????????????????????????
% set(Frame,'FigureIcon',javax.swing.ImageIcon('D:\matlab-workspace\GUI\xiaohui.jpg')) %logo.jpg????????????
warning off;
imaqreset%??????????
axes(handles.axes1); %????????????????????
cla reset;
% box on; %????????????????????
set(handles.axes1,'xtick',[]);
set(handles.axes1,'ytick',[]);

axes(handles.axes2); %????????????????????
cla reset;
set(handles.axes2,'xtick',[]);
set(handles.axes2,'ytick',[]);

x = [0, 0];
y = [0, 0];
z = [0, -1];
axes(handles.axes3); %????????????????????
axis equal%????????????????????????
% set(gca,'ZDir','reverse')%????z??????
plot3(x,y,z,'-o');
grid on%????????????
axis([-2, 2, -2, 2, -2, 0]);
xlabel('x??'),ylabel('y??'),zlabel('z??');

axes(handles.axes4); %????????????????????
cla reset;
set(handles.axes4,'xtick',[]);
set(handles.axes4,'ytick',[]);
set(handles.text4, 'String',  '-' );
set(handles.text5, 'String',  '-' );
set(handles.text9, 'String',  '-' );
set(handles.text14, 'String',  '-' );


% global angle_0_hough_1
% angle_0_hough_1='0';
% global angle_0_hough_2
% angle_0_hough_2='0';
% global angle_0_RANSAC_1
% angle_0_RANSAC_1='0';
% global angle_0_RANSAC_2
% angle_0_RANSAC_2='0';
global angle_0_hough_x
global angle_0_hough_y
angle_0_hough_x = 0;
angle_0_hough_y = 0;
%??????????????
folder = 'D:\Machine-vision-data\'; %%????????
if exist(folder,'dir') == 0 %%??????????????????
    mkdir(folder);  %%??????????????????????
end

% --- Outputs from this function are returned to the command line.
function varargout = new_line_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% ????????
% algorithm = get(handles.popupmenu3,'Value');
global vid_1
global vid_2
global angle_0_hough_x
global angle_0_hough_y
angle_0_hough_x = 0;
angle_0_hough_y = 0;
% global angle_0_RANSAC_1
% global angle_0_RANSAC_2

%         switch algorithm
%             case 1
%                 angle_0_hough_1  = get(handles.text4,'String');   
%                 angle_0_hough_2  = get(handles.text5,'String');  
%             case {2,3}
%                 angle_0_RANSAC_1  = get(handles.text4,'String'); 
%                 angle_0_RANSAC_2  = get(handles.text5,'String');    
%             otherwise
%                 set(handles.text14, 'String',  '????????' );
%         end
camera_num = get(handles.popupmenu2,'Value'); 
if camera_num == 1    
    frame_1=getsnapshot(vid_1);
    [~,angle_0_hough_x,~] = HOUGH_static(frame_1);   
else
    if camera_num == 2
        frame_1=getsnapshot(vid_1);
        [~,angle_0_hough_x,~] = HOUGH_static(frame_1);      
        frame_2=getsnapshot(vid_2);
        [~,angle_0_hough_y,~] = HOUGH_static(frame_2);  
    end  
end
set(handles.text14, 'String',  '????????' );
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% ????????????
imaqreset%??????????
axes(handles.axes1); %????????????????????
cla reset;
% box on; %????????????????????
set(handles.axes1,'xtick',[]);
set(handles.axes1,'ytick',[]);

axes(handles.axes2); %????????????????????
cla reset;
set(handles.axes2,'xtick',[]);
set(handles.axes2,'ytick',[]);

x = [0, 0];
y = [0, 0];
z = [0, -1];
axes(handles.axes3); 
axis equal%????????????????????????
% set(gca,'ZDir','reverse')%????z??????
plot3(x,y,z,'-o');
grid on%????????????
axis([-2, 2, -2, 2, -2, 0]);
xlabel('x??'),ylabel('y??'),zlabel('z??');

axes(handles.axes4); %????????????????????
cla reset;
set(handles.axes4,'xtick',[]);
set(handles.axes4,'ytick',[]);
set(handles.text4,'String','-');
set(handles.text5,'String','-');
set(handles.text9,'String','-');
set(handles.text14,'String','-');

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid_1
global hImage_1

global vid_2
global hImage_2
global Dynamic_switch
Dynamic_switch = 0;
global Image_switch

% global angle_0_hough_1
% global angle_0_hough_2
% global angle_0_RANSAC_1
% global angle_0_RANSAC_2

global angle_0_hough_x
global angle_0_hough_y
imaqreset%??????????
set(handles.text4,'String','-');
set(handles.text5,'String','-');
set(handles.text9,'String','-');
set(handles.text14, 'String',  '??????' );

set(handles.togglebutton1, 'Value',0);
axes(handles.axes1); %????????????????????
cla reset;
% box on; %????????????????????
set(handles.axes1,'xtick',[],'ytick',[]);

axes(handles.axes2); %????????????????????
cla reset;
set(handles.axes2,'xtick',[],'ytick',[]);

x = [0, 0];
y = [0, 0];
z = [0, -1];
axes(handles.axes3); 
axis equal%????????????????????????
% set(gca,'ZDir','reverse')%????z??????
plot3(x,y,z,'-o');
grid on%????????????
axis([-2, 2, -2, 2, -2, 0]);
xlabel('x??'),ylabel('y??'),zlabel('z??');

axes(handles.axes4); %????????????????????
cla reset;
set(handles.axes4,'xtick',[],'ytick',[]);

%????????????
kinestate = get(handles.popupmenu1,'Value');
camera_num = get(handles.popupmenu2,'Value');
algorithm = get(handles.popupmenu3,'Value');

if kinestate == 1 %1????????2??????
    preview_vid_1;
    set(handles.text14, 'String',  '????' );
    if camera_num == 2 %1????????????2??????????   
        preview_vid_2;
        set(handles.text14, 'String',  '????' );
    end
else
%%     ????????????
    if camera_num == 1
        start_vid_1;
        Dynamic_switch = 1;
        set(handles.text14, 'String',  '??????' );
        tic
        for i=1:100
%             algorithm = get(handles.popupmenu3,'Value');
            time(i) = toc ;%??????
            frame_1 = getsnapshot(vid_1);%??????????????    
            switch algorithm
                case 1% hough????                              
                    [k_1,angle_1(i),longest_line_1] = HOUGH_static(frame_1); 
                case 2%RANSAC(frame,model,iteration,threshold)                   
                    [k_1,angle_1(i),longest_line_1] = RANSAC(frame_1,1,100,1);  
                case 3          
                    [k_1,angle_1(i),longest_line_1] = RANSAC(frame_1,2,100,1);      
                otherwise
                    set(handles.text14, 'String',  '????????' );
                    break
            end  
            angle_1(i) = angle_1(i) - angle_0_hough_x;
            if rem(i,50)==0
                flushdata(vid_1);%??????????????????????????    
            end       
            if i == 1
                single_time = time(1);
            else
            	single_time = time(i) - time(i-1);
            end
            
            set(handles.text4,'String',[num2str(angle_1(i)) '??']);
            set(handles.text9,'String',[num2str(single_time * 1000) 'ms']);
            if Image_switch == 1%????????
                plot_axes1_1;
                plot3_axes3_2D;
            end
            if Dynamic_switch == 0%????
                break;
            end
            drawnow();
        end
        imaqreset 
        plot_axes4;
        %% ????????????
        save(strcat('D:\Machine-vision-data\',filesep,[datestr(now,30) '_????????'],'.mat'),'angle_1' ,'time');
        set(handles.text14, 'String',  '??????' );
    else
        %% ????????
        Dynamic_switch = 1;
        start_vid_1;
        start_vid_2;
        set(handles.text14, 'String',  '??????' );
        tic
        for i=1:50     
            frame_1 = getsnapshot(vid_1);%?????????????? 
            frame_2 = getsnapshot(vid_2);
            switch algorithm
                case 1% hough????                              
                    [k_1,angle_1(i),longest_line_1] = HOUGH_static(frame_1);    
                    [k_2,angle_2(i),longest_line_2] = HOUGH_static(frame_2);
                case 2%RANSAC(frame,model,iteration,threshold)                   
                    [k_1,angle_1(i),longest_line_1] = RANSAC(frame_1,1,50,1); 
                    [k_2,angle_2(i),longest_line_2] = RANSAC(frame_2,1,20,1);
                case 3          
                    [k_1,angle_1(i),longest_line_1] = RANSAC(frame_1,2,50,1);
                    [k_2,angle_2(i),longest_line_2] = RANSAC(frame_2,2,20,1); 
                otherwise
                    set(handles.text14, 'String',  '????????' );
            end  
            time(i) = toc ;%??????
            %????????
            angle_1(i) = angle_1(i) - angle_0_hough_x;
            angle_2(i) = angle_2(i) - angle_0_hough_y;
            
            if i == 1
                single_time = time(1);
            else
            	single_time = time(i) - time(i-1);
            end
            
         
            if rem(i,20)==0
                flushdata(vid_1);%??????????????????????????
                flushdata(vid_2);%??????????????????????????    
            end 
            set(handles.text4,'String',[num2str(angle_1(i)) '??']);
            set(handles.text5,'String',[num2str(angle_2(i)) '??']);
            set(handles.text9,'String',[num2str((single_time) * 1000) 'ms']);
            if Image_switch==1%????????
                plot_axes1_1;
                plot_axes2_2;
                plot3_axes3_3D;
                pause(0.01);
            end
            
            if Dynamic_switch==0%????
                break;
            end
            drawnow();
        end
        imaqreset %??????????
        plot3_axes4_3D
       %% ????????
        save(strcat('D:\Machine-vision-data\',filesep,[datestr(now,30) '_????????'],'.mat'),'angle_1','angle_2' ,'time');
        set(handles.text14, 'String', '??????' );
    end      
 end 
        

    

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% ????????????
global vid_1
global vid_2
global Image_switch
Image_switch = 1;
global Dynamic_switch
Dynamic_switch = 0;

% global angle_0_hough_1
% global angle_0_hough_2
% global angle_0_RANSAC_1
% global angle_0_RANSAC_2
global angle_0_hough_x
global angle_0_hough_y

kinestate = get(handles.popupmenu1,'Value');
camera_num = get(handles.popupmenu2,'Value');   
algorithm = get(handles.popupmenu3,'Value');  
%     for i = 1:1:camera_num    
%    str2func(handles.axes )
%         frame(i) = getimage((['handles.axes' num2str(i)]));
%     end

if kinestate == 1
    if camera_num == 1     
        frame_1=getsnapshot(vid_1);
        tic
        switch algorithm
            case 1                       
                [k_1,angle_1,longest_line_1] = HOUGH_static(frame_1);                    
            case 2           
                [k_1,angle_1,longest_line_1] = RANSAC(frame_1,1,100,1);             
            case 3        
                [k_1,angle_1,longest_line_1] = RANSAC(frame_1,2,100,1);           
            otherwise
                set(handles.text14, 'String',  '????????' );
        end
          time = toc;
          angle_1 = angle_1 - angle_0_hough_x;
        % ????
        if Image_switch==1%????????
            plot_axes1;
            plot3_axes3_2D;
        end
        set(handles.text4,'String',[num2str(angle_1) '??']);
        set(handles.text9,'String',[num2str(time * 1000) 'ms']);%[] ????????????????????
        %% ????????????
        imwrite(frame_1,strcat('D:\Machine-vision-data\',filesep,[datestr(now,30) '_????????'],'.png'));%????????frame_1
        save(strcat('D:\Machine-vision-data\',filesep,[datestr(now,30) '_????????'],'.mat'),'frame_1','angle_1','time','angle_0_hough_x');%????????
    else
        %% ????????
        frame_1=getsnapshot(vid_1);
        frame_2=getsnapshot(vid_2);
        
        switch algorithm
            case 1% hough????
                tic                     
                [k_1,angle_1,longest_line_1] = HOUGH_static(frame_1);     
                [k_2,angle_2,longest_line_2] = HOUGH_static(frame_2);
                time = toc;
                angle_1 = angle_1 - angle_0_hough_x;
                angle_2 = angle_2 - angle_0_hough_y;
            case 2%RANSAC(frame,model,iteration,threshold)
                tic           
                [k_1,angle_1,longest_line_1] = RANSAC(frame_1,1,50,1);
                [k_2,angle_2,longest_line_2] = RANSAC(frame_2,1,20,1);
                time = toc;
                angle_1 = angle_1 - angle_0_hough_x;
                angle_2 = angle_2 - angle_0_hough_y;
            case 3
                tic   
                [k_1,angle_1,longest_line_1] = RANSAC(frame_1,2,50,1);
                [k_2,angle_2,longest_line_2] = RANSAC(frame_2,2,20,1);
                time = toc;
                angle_1 = angle_1 - angle_0_hough_x;
                angle_2 = angle_2 - angle_0_hough_y;
            otherwise
                set(handles.text14, 'String', '????????' );
        end

        %% ????
        if Image_switch==1%????????????
                plot_axes1_1;
                plot_axes2_2;
                plot3_axes3_3D;
        end
        
        set(handles.text4,'String',[num2str(angle_1) '??']);
        set(handles.text5,'String',[num2str(angle_2) '??']);
        set(handles.text9,'String',[num2str(time * 1000) 'ms']);%[] ????????????????????
      %% ????????????

        save(strcat('D:\Machine-vision-data\',filesep,[datestr(now,30) '_????????'],'.mat'),'frame_1','frame_2','angle_1','angle_2' ,'time','angle_0_hough_x','angle_0_hough_y');%????????
        set(handles.text14, 'String',  '??????' );
    end
end  


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% ????????
global video_path
global Image_switch;
Image_switch=1;
global Dynamic_switch
Dynamic_switch = 1;
global angle_0_hough_x


algorithm = get(handles.popupmenu3,'Value');

obj = VideoReader(video_path);%????????????
Video_Duration = obj.Duration;%????????????/??
numFrames = obj.NumberOfFrames;% ????????
Frame_rate = numFrames / Video_Duration;%????????/??
time = 0;
% processing_time = 0;
i=1;
set(handles.text14, 'String',  '??????' );
while (1)
    frame_number(i) = ceil(1 + Frame_rate * sum(time));
    if frame_number(i) < numFrames
        frame_1 = read(obj,frame_number(i));%??????????
        frame_1 = frame_1(:,:,1);
        %      imwrite(frame,strcat('im',num2str(i),'.jpg'),'jpg');% ??????
        tic
        switch algorithm
            case 1        
                [k_1,angle_1(i),longest_line_1] = HOUGH_static(frame_1);      
            case 2       
                [k_1,angle_1(i),longest_line_1] = RANSAC(frame_1,1,50,1);
            case 3                 
                [k_1,angle_1(i),longest_line_1] = RANSAC(frame_1,2,20,1);        
            otherwise
                set(handles.text14, 'String',  '????????' );
        end
        angle_1(i) = angle_1(i) - angle_0_hough_x;
        time(i) = toc;

        %     if i == 1
        %         single_time = time(1);
        %     else
        %         single_time = time(i) - time(i-1);
        %     end
        % ????
%             if Image_switch == 1%????????
%                 plot_axes1;
%                 plot3_axes3_2D;
%         %         pause(0.001);%??????????????????????????????????????????
%             end
%             set(handles.text4,'String',num2str(angle_1(i)));
%             set(handles.text9,'String',[num2str(time(i)*1000) 'ms']);
        %     pause(1/vidObj.FrameRate);

            if Dynamic_switch==0%????
                break;
            end
        i = i + 1;
    else
         break;
    end
end
frame_time = frame_number * Video_Duration / numFrames;
axes(handles.axes4); 
% plot(time,angle_1,'k:.','MarkerFaceColor','r');
plot(frame_time(1:length(angle_1)),angle_1,'k:.','MarkerFaceColor','r');
xlabel('????/s');
ylabel('????/??');
%% ????????????
save(strcat('D:\Machine-vision-data\',filesep,[datestr(now,30) '????????'],'.mat'),'angle_1' ,'time','frame_time');
set(handles.text14, 'String',  '????????' );
 

% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2
%% ????????
global Image_switch
if get(handles.togglebutton2, 'Value') == 0
    Image_switch = 1;
end

if get(handles.togglebutton2, 'Value') == 1
    Image_switch = 0;
end

axes(handles.axes1); %????????????????????
cla reset;
% box on; %????????????????????
set(handles.axes1,'xtick',[]);
set(handles.axes1,'ytick',[]);
axes(handles.axes2); %????????????????????
cla reset;
set(handles.axes2,'xtick',[]);
set(handles.axes2,'ytick',[]);
axes(handles.axes3); %????????????????????
cla reset;
% box on; %????????????????????
set(handles.axes3,'xtick',[]);
set(handles.axes3,'ytick',[]);
% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
%% ????????
global Dynamic_switch
if get(handles.togglebutton1, 'Value') == 0
    Dynamic_switch = 1;
end

if get(handles.togglebutton1, 'Value') == 1
    Dynamic_switch = 0;
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% %% ??????????????????????????
% folder = 'D:\Machine-vision-data\'; %%????????
% if exist(folder,'dir') == 0 %%??????????????????
%     mkdir(folder);  %%??????????????????????
% else
%     save(strcat('D:\Machine-vision-data\',filesep,datestr(now,30),'.mat'),'angle_1' ,'time','frame_time');
% end
% set(handles.text14, 'String',  '??????' );
%% ????????
axes(handles.axes4); %????axes??????
if isempty(handles.axes4)
	return;
end
new_f_handle=figure('visible','off');
new_axes=copyobj(handles.axes4,new_f_handle); %picture??GUI????????????????????
set(new_axes,'units','default','position','default');
[filename,pathname,fileindex]=uiputfile({'*.jpg';'*.bmp'},'save picture as');
if ~filename
     return
else
      file=strcat(pathname,filename);
      switch fileindex %??????????????????????????????
      case 1
                  print(new_f_handle,'-djpeg',file);
      case 2
                  print(new_f_handle,'-dbmp',file);
      end
end
delete(new_f_handle);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes4); %????????????????????
cla reset;
set(handles.axes4,'xtick',[],'ytick',[]);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% ????????
global video_path
[filename, pathname, FileIndex] = uigetfile({'*.avi;*.mp4;', 'All video file(*.avi;*.mp4; )'; ...
'*.*', 'All Files (*.*)'}, ...
 'Pick an excel file');
 if FileIndex == 0  % ????????????cancel??
 	set(handles.text14, 'String','??????');
 else
	video_path = [pathname filename];
	set(handles.text14, 'String',  filename );
 end
% msgbox('??????????????????');


% --- Executes during object creation, after setting all properties.
function pushbutton5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% ????????
global frame_path
[filename, pathname, FileIndex] = uigetfile({'*.png; *.jpg', 'All pictures file(*.png; *.jpg; )'; ...
'*.*', 'All Files (*.*)'}, ...
 'Pick an excel file');
 if FileIndex == 0  % ????????????cancel??
 	set(handles.text14, 'String','??????');
 else
	frame_path = [pathname filename];
	set(handles.text14, 'String',  filename );
    frame_1 = imread(frame_path);
    axes(handles.axes1);
    imshow(frame_1);
 end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% ????????
% global angle_0_hough_1
% global angle_0_RANSAC_1

global angle_0_hough_x
% global angle_0_hough_y

global frame_path
kinestate = get(handles.popupmenu1,'Value');
camera_num = get(handles.popupmenu2,'Value');   
algorithm = get(handles.popupmenu3,'Value');  

if kinestate == 1
    if camera_num == 1     
        frame_1 = imread(frame_path);
        %rgb2gray
        dimension = numel(size(frame_1));
        if dimension == 3
            frame_1 = rgb2gray(frame_1);
        end
        tic 
        switch algorithm
            case 1                   
                [k_1,angle_1,longest_line_1] = HOUGH_static(frame_1);            
            case 2                   
                [k_1,angle_1,longest_line_1] = RANSAC(frame_1,1,50,1);        
            case 3                     
                [k_1,angle_1,longest_line_1] = RANSAC(frame_1,2,20,1);        
            otherwise
                set(handles.text14, 'String',  '????????' );
        end
        angle_1 = angle_1 - angle_0_hough_x;
        time = toc;
        % ????
        plot_axes1;
        plot3_axes3_2D;
        set(handles.text4,'String',[num2str(angle_1) '??']);
        set(handles.text9,'String',[num2str(time * 1000) 'ms']);%[] ????????????????????
        %% ????????????
        save(strcat('D:\Machine-vision-data\',filesep,[datestr(now,30) '_????????'],'.mat'),'frame_1','angle_1' ,'time');
        set(handles.text14, 'String',  '??????' );
    end  
end
