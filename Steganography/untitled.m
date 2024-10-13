
% handle the execution and callback functions of the GUI 
function varargout = untitled(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Steganography_OpeningFcn, ...
                   'gui_OutputFcn',  @Steganography_OutputFcn, ...
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

%setting up the initial state of the GUI and providing an output
function Steganography_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

img=imread('steg.png');
axes(handles.axes3);
imshow(img);
function varargout = Steganography_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


%Selecting Image
function pushbutton1_Callback(hObject, eventdata, handles)
[filename1 pathname1]=uigetfile({'*.png;*.jpg'},'File Selector')   %selecting some img types.
global fullpathname1
fullpathname1 = strcat(pathname1,filename1)   % combine the name and location of the image.
set(handles.text3,'String',fullpathname1)     % display name and path of the image to the textbox
img=imread(fullpathname1); 
axes(handles.axes1); %axes  for the img
imshow(img); 


%Selecting a Text File ( that contain the secret message)
function pushbutton3_Callback(hObject, eventdata, handles)
[filename2 pathname2]=uigetfile({'*.txt'},'File Selector') %a file with .txt extension
global fullpathname2
fullpathname2 = strcat(pathname2,filename2) % combine the name and location of the file
set(handles.text4,'String',fullpathname2) %display it
text = fileread(fullpathname2) 
set(handles.text5,'String',text) %post into the textbox

%File Encryption
function pushbutton4_Callback(hObject, eventdata, handles)
global fullpathname1
global fullpathname2
FID = fileread(fullpathname2);    
Str=uint16(FID);    %converted to uint16:numerical values of the text

x=imread(fullpathname1);   
x=uint16(x);                %converted to uint16: wider range pixel values : between 0 and 65535
[x_row,x_col]=size(x); %rows and columns of the img

c=numel(Str);   %count cara of the file
a=1;
 %Encryption func
for i=1:x_row
    for j=1:x_col
        if(a<=c) %loops every carac of the text     
            if(x(i,j)+Str(a)>255) %If the sum of the pixel values ??of the image and the text file values ??was greater than 255, we added the values ??and subtracted 256.
                temp=x(i,j)+Str(a)-256;
            else
                temp=x(i,j)+Str(a); %collecting the pixel values ??of the image and the values ??of the text file.
            end
            z(i,j)=uint8(temp); %The temp matrix is ??converted to uint8 and the encrypted parts are thrown into the image matrix.
        else
            z(i,j)=uint8(x(i,j)); %The original image matrix is ??converted to uint8 and the remaining values ??of the original image are thrown into the image matrix.
        end
        a=a+1;
    end
end
imwrite(z,'encryptedg.png');     %saving the encrypted image(stegomediumgrayscale)

 % Encryption func
for i = 1:min(x_row, size(x, 1))
    for j = 1:min(x_col, size(x, 2))
        for channel = 1:3 % Process each color channel separately
            if a <= c
                if x(i, j, channel) + Str(a) > 255
                    temp = x(i, j, channel) + Str(a) - 256;
                else
                    temp = x(i, j, channel) + Str(a);
                end
                m(i, j, channel) = uint8(temp);
            else
                m(i, j, channel) = uint8(x(i, j, channel));
            end
            a = a + 1;
        end
    end
end

imwrite(m, 'encrypted.png'); % Saving the encrypted image
img = imread('encrypted.png');
axes(handles.axes2);
imshow(img);


%Decrypting the Encrypted Image
function pushbutton5_Callback(hObject, eventdata, handles)
x=imread('encryptedg.png');  
global fullpathname1
y=imread(fullpathname1);   

x=uint16(x);    %convert the encrypted image 
y=uint16(y);    %convert the original image 

[x_row, x_col]=size(x); %the number of rows and columns of the encrypted image.

b=0;k=1;

%Decryption func
for i=1:x_row
    for j=1:x_col
        %The encrypted file is decrypted by comparing the encrypted image with the original image.
        if(x(i,j)>=y(i,j)) %If the pixel values ??of the encrypted image are larger than the pixel values ??of the original image
            a=x(i,j)-y(i,j); %The difference between the pixel values ??of the original image and the encrypted image is taken.
        else
            a=256+x(i,j)-y(i,j); %The difference between the pixel values ??of the original image and the encrypted image is taken and 256 is added.
        end
        
        if(a~=0)
            z(k)=uint8(a); %We created the decoded text file matrix.
            k=k+1;
        else
            b=1;
            break;
        end
    end
    if(b==1)
        break;
    end
end

fid=fopen('decrypted.txt','w'); %create and open  decrypted file
for i=1:k-1
    fprintf(fid,'%c',z(i)); %the result
end

text = fileread('decrypted.txt') 
set(handles.text6,'String',text) 
