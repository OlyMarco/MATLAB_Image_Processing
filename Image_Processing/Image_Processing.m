function varargout = Image_Processing(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Image_Processing_OpeningFcn, ...
                   'gui_OutputFcn',  @Image_Processing_OutputFcn, ...
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


% --- Executes just before Image_Processing is made visible.
function Image_Processing_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
handles.h = 0;
handles.v = 0;
handles.r = 0;
% 未打开图片时功能隐藏
set(handles.save,'Enable','off');
set(handles.reset,'Enable','off');
set(handles.exit,'Enable','off');

set(handles.Flip_Side2Side,'Enable','off');
set(handles.Upside2Down,'Enable','off');
set(handles.imgGrey,'Enable','off');

set(handles.hTranslation,'Enable','off');
set(handles.vTranslation,'Enable','off');
set(handles.imgResize,'Enable','off');
set(handles.imgRotate,'Enable','off');

set(handles.Sobel,'Enable','off');
set(handles.Roberts,'Enable','off');
set(handles.Prewitt,'Enable','off');
set(handles.LOG,'Enable','off');
set(handles.Canny,'Enable','off');

set(handles.averFiltering,'Enable','off');
set(handles.midFiltering,'Enable','off');
set(handles.gaussFilter,'Enable','off');

set(handles.imgAdd,'Enable','off');
set(handles.imgFuse,'Enable','off');

set(handles.Histeq,'Enable','off');
set(handles.contrastLighten,'Enable','off');
set(handles.contrastDarken,'Enable','off');

set(handles.imgSeg,'Enable','off');

set(handles.text121,'Enable','off');
set(handles.text122,'Enable','off');
set(handles.text123,'Enable','off');
set(handles.text124,'Enable','off');
set(handles.text2,'Enable','off');

set(handles.g11,'Visible','off');
set(handles.g12,'Visible','off');
set(handles.g21,'Visible','off');
set(handles.g22,'Visible','off');
set(handles.g23,'Visible','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Image_Processing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Image_Processing_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% 示波器g22彩色图象更新函数
function gUpdate22(handles)
    r = handles.img(:, :, 1);
    g = handles.img(:, :, 2);
    b = handles.img(:, :, 3);
    x = size(r);
    x = (1: x(1,2));
    r = r(1, :);
    g = g(1, :); 
    b = b(1, :);
    axes(handles.g22);
    cla;
    plot(x,r,'r');
    hold on
    plot(x, g, 'g'); 
    plot(x, b, 'b');
    hold off;

    ImageData1 = reshape(handles.img(:,:,1), [size(handles.img, 1) * size(handles.img, 2) 1]);
    ImageData2 = reshape(handles.img(:,:,2), [size(handles.img, 1) * size(handles.img, 2) 1]);
    ImageData3 = reshape(handles.img(:,:,3), [size(handles.img, 1) * size(handles.img, 2) 1]);
    [H1, X1] = hist(ImageData1, 1:5:256);
    [H2, X2] = hist(ImageData2, 1:5:256);
    [H3, X3] = hist(ImageData3, 1:5:256);
    axes(handles.g23); 
    cla;
    hold on;
    plot(X1, H1, 'r');
    plot(X2, H2, 'g');
    plot(X3, H3, 'b');    
    axis([0 256 0 max([H1 H2 H3])]);

% 示波器g23灰色图象更新函数
function gUpdate23(handles)
    k = handles.img(:, :, 1);
    x = size(k);
    x = (1: x(1,2));
    k = k(1, :);
    axes(handles.g22);
    cla;
    plot(x, k, 'k');

    ImageData = reshape(handles.img, [size(handles.img, 1) * size(handles.img, 2) 1]);
    [H, X] = hist(ImageData, 1:5:256);
    axes(handles.g23); 
    cla;
    hold on;
    plot(X, H, 'k');  
    axis([0 256 0 max(H)]);

% --- Executes on button press in open.
function open_Callback(hObject, ~, handles)
    % 打开按钮
    [file, path]=uigetfile({'*.jpg';'*.bmp';'*.jpeg';'*.png'}, 'Open');
    if file==0
       warndlg('Choose an image...') ;
    else
    
    image=[path file];
    handles.file=image;
    % 打开图片后功能显示
    set(handles.save,'Enable','on');
    set(handles.reset,'Enable','on');
    set(handles.exit,'Enable','on');

    set(handles.Flip_Side2Side,'Enable','on');
    set(handles.Upside2Down,'Enable','on');
    set(handles.imgGrey,'Enable','on');

    set(handles.hTranslation,'Enable','on');
    set(handles.vTranslation,'Enable','on');
    set(handles.imgResize,'Enable','on');
    set(handles.imgRotate,'Enable','on');

    set(handles.Sobel,'Enable','on');
    set(handles.Roberts,'Enable','on');
    set(handles.Prewitt,'Enable','on');
    set(handles.LOG,'Enable','on');
    set(handles.Canny,'Enable','on');

    set(handles.averFiltering,'Enable','on');
    set(handles.midFiltering,'Enable','on');
    set(handles.gaussFilter,'Enable','on');

    set(handles.imgAdd,'Enable','on');
    set(handles.imgFuse,'Enable','on');

    set(handles.Histeq,'Enable','on');
    set(handles.contrastLighten,'Enable','on');
    set(handles.contrastDarken,'Enable','on');

    set(handles.Histeq,'Enable','on');
    set(handles.imgAdd,'Enable','on');

    set(handles.imgSeg,'Enable','on');

    set(handles.text121,'Enable','on');
    set(handles.text122,'Enable','on');
    set(handles.text123,'Enable','on');
    set(handles.text124,'Enable','on');
    set(handles.text2,'Enable','on');
    
    set(handles.g11,'Visible','on');
    set(handles.g12,'Visible','on');
    set(handles.g21,'Visible','on');
    set(handles.g22,'Visible','on');
    set(handles.g23,'Visible','on');

    set(handles.open,'Enable','off');

    handles.img=imread(image);
    handles.i=imread(image);
    % 进度条功能
    h = waitbar(0,'Waiting...');
    steps = 100;
    for step = 1:steps
      waitbar(step / steps)
    end
    close(h) 
    cla; 
    imshow(handles.img);
    axes(handles.g11);
    imshow(handles.img);
    axes(handles.g12); 

    cla; 
    imshow(handles.img);
    guidata(hObject,handles); 
    end


% 示波器g21更新
mysize=size(handles.img);
if numel(mysize)>2
    r=handles.i(:,:,1);
    g=handles.i(:,:,2);
    b=handles.i(:,:,3);
    x=size(r); 
    x=(1:x(1,2));
    r=r(1,:); 
    g=g(1,:); 
    b=b(1,:);
    axes(handles.g21); 
    cla;
    plot(x,r,'r');
    hold on
    plot(x,g,'g');
    plot(x,b,'b'); 
    set(gca,'xtick',-inf:inf:inf);
    hold off;
else
    k=handles.img(:,:,1);
    x=size(k);
    x=(1:x(1,2));
    k=k(1,:);
    axes(handles.g21);
    cla;
    plot(x,k,'k');
end
    
guidata(hObject,handles);

mysize = size(handles.img);
if numel(mysize)>2
    gUpdate22(handles)
else
    gUpdate23(handles)
end 

% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in save.
function save_Callback(~, ~, handles)
    % 保存按钮
    [file, path]= uiputfile('*.jpg','Save Image as');
    if file==0
       warndlg('No change...') ;
    else
    save = [path file]; 
    imwrite(handles.img, save, 'jpg');
    end
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reset.
function reset_Callback(hObject, ~, handles)
    % 重置按钮
    handles.img = handles.i;
    axes(handles.g12); 
    cla; 
    imshow(handles.img);
    guidata(hObject,handles);
    mysize = size(handles.img);
    if numel(mysize)>2
       gUpdate22(handles)
    else
       gUpdate23(handles)
    end 

% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in exit.
function exit_Callback(~, ~, ~)
    % 退出按钮
    close all;

% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function g11_CreateFcn(~, ~, ~)
% hObject    handle to g11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function g11_DeleteFcn(~, ~, ~)
% Hint: place code in OpeningFcn to populate g11


% --- Executes during object creation, after setting all properties.
function g12_CreateFcn(~, ~, ~)
% hObject    handle to g12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate g12


% --- Executes during object creation, after setting all properties.
function g21_CreateFcn(~, ~, ~)
% hObject    handle to g21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate g21


% --- Executes during object creation, after setting all properties.
function g22_CreateFcn(~, ~, ~)
% hObject    handle to g22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate g22


% --- Executes during object creation, after setting all properties.
function g23_CreateFcn(~, ~, ~)
% hObject    handle to g23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate g23


% --- Executes on slider movement.
function hTranslation_Callback(hObject, ~, handles)
    % 水平平移
    h = (get(hObject,'Value'));
    V = [h - handles.h, 0];
    handles.h = h;
    handles.img = imtranslate(handles.img, V);
    axes(handles.g12); 
    cla; 
    imshow(handles.img)
    guidata(hObject, handles);
    mysize = size(handles.img);
    if numel(mysize)>2
        gUpdate22(handles)
    else
       gUpdate23(handles)
    end 

% hObject    handle to hTranslation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes on slider movement.
function vTranslation_Callback(hObject, ~, handles)
    % 垂直平移
    v = (get(hObject,'Value'));
    V = [0, v - handles.v];
    handles.v = v;
    handles.img = imtranslate(handles.img, V);
    axes(handles.g12); 
    cla; 
    imshow(handles.img)
    guidata(hObject, handles);
    mysize = size(handles.img);
    if numel(mysize)>2
       gUpdate22(handles)
    else
        gUpdate23(handles)
    end 

% hObject    handle to hTranslation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function hTranslation_CreateFcn(hObject, ~, ~)
% hObject    handle to hTranslation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function vTranslation_CreateFcn(hObject, ~, ~)
% hObject    handle to hTranslation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function imgRotate_Callback(hObject, ~, handles)
    % 图像旋转
    r = (get(hObject,'Value'));
    handles.img = imrotate(handles.i, r);
    axes(handles.g12);
    cla;
    imshow(handles.img);
    guidata(hObject, handles)
    mysize = size(handles.img);
    if numel(mysize)>2
       gUpdate22(handles)
    else
       gUpdate23(handles)
    end 

% hObject    handle to imgRotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function imgRotate_CreateFcn(hObject, ~, ~)
% hObject    handle to imgRotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in gaussFilter.
function gaussFilter_Callback(hObject, ~, handles)
    % 高斯滤波
    hsize=[8 8]; 
    sigma=1.7;
    h = fspecial('gaussian', hsize, sigma);
    handles.img=imfilter(handles.img, h, 'replicate');
    axes(handles.g12); cla; imshow(handles.img);
    guidata(hObject,handles);
    mysize=size(handles.img);
    if numel(mysize)>2
      gUpdate22(handles)
    else
      gUpdate23(handles)
    end 

% hObject    handle to gaussFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in averFiltering.
function averFiltering_Callback(hObject, ~, handles)
% 均值滤波
    h=fspecial('average');
    handles.img=imfilter(handles.img, h, 'replicate');
    axes(handles.g12);
    cla;
    imshow(handles.img)
    guidata(hObject,handles);
    mysize=size(handles.img);
    if numel(mysize)>2
       gUpdate22(handles)
    else
      gUpdate23(handles)
    end 

% hObject    handle to averFiltering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in midFiltering.
function midFiltering_Callback(hObject, ~, handles)
    % 中值滤波
    r = medfilt2(handles.img(:,:,1));
    g = medfilt2(handles.img(:,:,2));
    b = medfilt2(handles.img(:,:,3)); 
    handles.img=cat(3, r, g, b);
    axes(handles.g12); cla; imshow(handles.img);
    guidata(hObject,handles);
    mysize=size(handles.img);
    if numel(mysize)>2
      gUpdate22(handles)
    else
      gUpdate23(handles)
    end 

% hObject    handle to midFiltering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Sobel.
function Sobel_Callback(hObject, ~, handles)
    % Sobel边缘检测
    mysize = size(handles.img);
    if numel(mysize)>2
       handles.img=rgb2gray(handles.img);
    end
    handles.img=edge(handles.img,'sobel');
    axes(handles.g12);
    cla;
    imshow(handles.img);
    guidata(hObject,handles);
    gUpdate23(handles);

% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Roberts.
function Roberts_Callback(hObject, ~, handles)
    % Roberts边缘检测
    mysize = size(handles.img);
    if numel(mysize)>2
         handles.img=rgb2gray(handles.img);
    end
    handles.img=edge(handles.img, 'roberts');
    axes(handles.g12);
    cla;
    imshow(handles.img);
    guidata(hObject,handles);
    gUpdate23(handles);

% hObject    handle to Roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Prewitt.
function Prewitt_Callback(hObject, ~, handles)
    % Prewitt边缘检测
    mysize = size(handles.img);
    if numel(mysize)>2
      handles.img=rgb2gray(handles.img);
    end
    handles.img = edge(handles.img,'prewitt');
    axes(handles.g12);
    cla;
    imshow(handles.img);
    guidata(hObject,handles);
    gUpdate23(handles);

% hObject    handle to Prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in LOG.
function LOG_Callback(hObject, ~, handles)
    % LOG边缘检测
    mysize = size(handles.img);
    if numel(mysize)>2
       handles.img=rgb2gray(handles.img);
    end
    handles.img=edge(handles.img,'log');
    axes(handles.g12);
    cla;
    imshow(handles.img);
    guidata(hObject, handles);
    gUpdate23(handles)

% hObject    handle to LOG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Canny.
function Canny_Callback(hObject, ~, handles)

mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'canny');
axes(handles.g12);
cla;
imshow(handles.img);
guidata(hObject,handles);
mysize = size(handles.img);
if numel(mysize)>2
gUpdate22(handles)
else
gUpdate23(handles)
end 

% hObject    handle to Canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in imgAdd.
function imgAdd_Callback(hObject, ~, handles)
    % 图像叠加
    [file, path] = uigetfile({'*.jpg';'*.bmp';'*.jpeg';'*.png'}, 'Open');
    if file==0
        warndlg('No change...');
    end
    alpha = 0.5;
    image = imread([path file]);
    handles.img = imadd(alpha.*handles.img, alpha.*imresize(image, 'OutputSize', [size(handles.img, 1), size(handles.img, 2)]));
    axes(handles.g12);
    cla;
    imshow(handles.img);
    guidata(hObject, handles);
    mysize = size(handles.img);
    if numel(mysize)>2
        gUpdate22(handles)
    else
        gUpdate23(handles)
    end 

% hObject    handle to imgAdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in contrastLighten.
function contrastLighten_Callback(hObject, ~, handles)
    % 对比度亮增强
    if length(size(handles.img))>2
         handles.img = imadjust(handles.img, [0 0.9], []);
         axes(handles.g12); 
         cla; 
        imshow(handles.img)
        guidata(hObject, handles);
        mysize = size(handles.img);
        if numel(mysize)>2
          gUpdate22(handles)
        else
           gUpdate23(handles)
        end 
    else
        warndlg('The image is grey...');
    end

% hObject    handle to contrastLighten (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Histeq.
function Histeq_Callback(hObject, ~, handles)
    % 直方图均衡化
    if length(size(handles.img))>2
        handles.img = histeq(handles.img);
        axes(handles.g12); 
        cla; 
        imshow(handles.img)
        guidata(hObject, handles);
        mysize = size(handles.img);
        if numel(mysize)>2
            gUpdate22(handles)
        else
            gUpdate23(handles)
        end 
    else 
        warndlg('The image is grey...');
    end

% hObject    handle to Histeq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in imgGrey.
function imgGrey_Callback(hObject, ~, handles)
% 灰度
    if length(size(handles.img))>2
       handles.img = rgb2gray(handles.img);
       axes(handles.g12);
       cla;
       imshow(handles.img);
       guidata(hObject,handles);
       gUpdate23(handles);
    else
       warndlg("It's already a grey image...") ;
    end

% hObject    handle to imgGrey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Upside2Down.
function Upside2Down_Callback(hObject, ~, handles)
    % 垂直镜像
    handles.img = flipud(handles.img);
    axes(handles.g12);
    cla;
    imshow(handles.img);
    guidata(hObject, handles);
    mysize=size(handles.img);
    if numel(mysize)>2
        gUpdate22(handles)
    else
        gUpdate23(handles)
    end 

% hObject    handle to Upside2Down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Flip_Side2Side.
function Flip_Side2Side_Callback(hObject, ~, handles)
    % 水平镜像
    handles.img = fliplr(handles.img);
    axes(handles.g12);
    cla;
    imshow(handles.img);
    guidata(hObject, handles);
    mysize=size(handles.img);
    if numel(mysize)>2
     gUpdate22(handles)
    else
       gUpdate23(handles)
    end 

% hObject    handle to Flip_Side2Side (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in contrastDarken.
function contrastDarken_Callback(hObject, ~, handles)
    % 对比度暗增强
    if length(size(handles.img))>2
        handles.img = imadjust(handles.img, [0.1 1], []);
        axes(handles.g12); 
        cla; 
        imshow(handles.img)
        guidata(hObject, handles);
        mysize = size(handles.img);
        if numel(mysize)>2
            gUpdate22(handles)
        else
            gUpdate23(handles)
        end 
    else
        warndlg('The image is grey...');
    end

% hObject    handle to contrastDarken (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in imgSeg.
function imgSeg_Callback(hObject, ~, handles)
    % 阈值分割
%    if length(size(handles.img))>2
        T = (get(hObject, "Value"));
        handles.img = rgb2gray(handles.i) > T;
        axes(handles.g12); 
        cla; 
        imshow(handles.img)
        guidata(hObject, handles);
        gUpdate23(handles)
%    else 
%        warndlg('The image is gfrey...');
%    end

% hObject    handle to imgSeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes during object creation, after setting all properties.
function imgSeg_CreateFcn(~, ~, ~)
% hObject    handle to imgSeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on slider movement.
function imgResize_Callback(hObject, ~, handles)
    % 图像缩放
    z = (get(hObject, "Value"));
    handles.img = imresize(handles.i, z ,'nearest');
    [h, w, ~] = size(handles.i);
    [h2, w2, ~] = size(handles.img);
    handles.img  = imcrop(handles.img, [(w2 - w) / 2 (h2 - h) / 2 w h]);
    axes(handles.g12); 
    cla; 
    imshow(handles.img)
    guidata(hObject, handles);
    mysize = size(handles.img);
    if numel(mysize)>2
       gUpdate22(handles)
    else
       gUpdate23(handles)
    end 

% hObject    handle to imgResize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function imgResize_CreateFcn(hObject, ~, ~)
% hObject    handle to imgResize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in imgFuse.
function imgFuse_Callback(hObject, ~, handles)
    % 图像融合
    [file, path] = uigetfile({'*.jpg';'*.bmp';'*.jpeg';'*.png'}, 'Open');
    if file==0
        warndlg('No change...');
    end
    image = imread([path file]);
    handles.img = imfuse(handles.img, image, 'blend');
    axes(handles.g12);
    cla;
    imshow(handles.img);
    guidata(hObject, handles);
    mysize = size(handles.img);
    if numel(mysize)>2
        gUpdate22(handles)
    else
        gUpdate23(handles)
    end 

% hObject    handle to imgFuse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
