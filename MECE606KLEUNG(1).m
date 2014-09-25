function MECE606KLEUNG
%A function that generates a GUI that uploads and displays 
%two images where a button is present to toggle a switch
%between the two images
%Made by Kaiser Leung, CCID: kleung, ID#: 1234886

%Closes all windows and clear command windows
close all;
clc;

%Creates a figure and store its structure in a handle so it can be called 
%later (indirectly). 
%From MATLAB Central
%<http://blogs.mathworks.com/pick/2007/12/28/matlab-basics-guis-without-guide/>
h.fig = figure('position',[200 150 400 600]);

%Create a button that can be used later to toggle the images also w/ handle
%From MATLAB Central
%<http://blogs.mathworks.com/pick/2007/12/28/matlab-basics-guis-without-guide/>
h.togglebutton = uicontrol('style','pushbutton','position',[150 490 100 20],'string','Toggle Image');

%Create two buttons to prompt the user to upload images
%Idea from MATLAB Central
%<http://blogs.mathworks.com/pick/2007/12/28/matlab-basics-guis-without-guide/>
h.imageload1 = uicontrol('style','pushbutton','position',[75 540 250 20],'string','Select Image 1');

h.imageload2 = uicontrol('style','pushbutton','position',[75 520 250 20],'string','Select Image 2');

%The 'Toggle Image' button currently doesn't do anything. The below is a callback to
%set the button to toggle the image that will be uploaded
%From MATLAB Central
%<http://blogs.mathworks.com/pick/2007/12/28/matlab-basics-guis-without-guide/>
set(h.togglebutton,'callback',{@toggleimage, h});

%The below sets the 'Select Image 1' button to prompt an image upload
%Idea from MATLAB Central
%<http://blogs.mathworks.com/pick/2007/12/28/matlab-basics-guis-without-guide/>
set(h.imageload1,'callback',{@uploadimage1,h});

%The below sets the 'Select Image 1' button to prompt an image upload
%Idea from MATLAB Central
%<http://blogs.mathworks.com/pick/2007/12/28/matlab-basics-guis-without-guide/>
set(h.imageload2,'callback',{@uploadimage2,h});




end


function h = toggleimage(hObject,eventdata,h)
%This function is the action that the button 'toggleimage' will perform 
%eventdata is a filler that doesn't do anything right now.
%Idea taken from MATLAB Central
%<http://blogs.mathworks.com/pick/2007/12/28/matlab-basics-guis-without-guide/>

%Create new figure window to display the images
%Idea from MATLAB Central
%<http://blogs.mathworks.com/pick/2007/12/28/matlab-basics-guis-without-guide/>
h.fig1 = figure('position',[650 100 700 700]);

%Using the indexed image and its corresponding color map
%Information of the function from MathWorks
%<http://www.mathworks.com/help/images/ref/ind2rgb.html>
I1 = evalin('base','I1');

%Using the indexed image and its corresponding color map
%Information of the function from MathWorks
%<http://www.mathworks.com/help/images/ref/ind2rgb.html>
I2 = evalin('base','I2');



imshow(I1,'InitialMagnification','fit');


end


function h = uploadimage1(hObject,eventdata,h)
%This function is the action that the button 'Select Image 1' will perform 
%eventdata is a filler that doesn't do anything right now.
%Idea taken from MATLAB Central
%<http://blogs.mathworks.com/pick/2007/12/28/matlab-basics-guis-without-guide/>

%Below reads instruction for the user to follow
disp('Select Image Button Pressed. Please select the first image.');

%Prompt user to select image while prompting user with instructions
%Idea taken from Stackoverflow Forum
%<http://stackoverflow.com/questions/9938267/how-to-select-a-file-through-a-gui-in-matlab>
[filename, user_canceled] = imgetfile;
    if user_canceled
    display('User Pressed Cancel')
    else
    display(['User Selected', filename])
    end

%Take the image loaded and place it into variables. It takes the image and
%stores the information of the image in one variable and colormap in another.
%Idea taken from Stackoverflow Forum
%<http://stackoverflow.com/questions/9938267/how-to-select-a-file-through-a-gui-in-matlab>    
%[I1,map1] = imread(filename);
I1 = imread(filename);

%Take the information of the image and place it into a variable
%Line taken from MathWorks
%<http://www.mathworks.com/help/images/ref/imageinfo.html>
INFO1 = iminfo(filename);

%From the loaded image the values of the image and the colormap must be
%placed as variables onto MATLAB workspace
%Idea taken from Stackoverflow Forum
%<http://stackoverflow.com/questions/9938267/how-to-select-a-file-through-a-gui-in-matlab>
assignin('base','I1',I1);
%assignin('base','map1',map1);

set(h.imageload1,'string',filename);

end

function h = uploadimage2(hObject,eventdata,h)
%This function is the action that the button 'Select Image 2' will perform 
%eventdata is a filler that doesn't do anything right now.
%Idea taken from MATLAB Central
%<http://blogs.mathworks.com/pick/2007/12/28/matlab-basics-guis-without-guide/>

%Below reads instruction for the user to follow
disp('Select Image Button Pressed. Please select the second image.');

%Prompt user to select image while prompting user with instructions
%Idea taken from Stackoverflow Forum
%<http://stackoverflow.com/questions/9938267/how-to-select-a-file-through-a-gui-in-matlab>
[filename, user_canceled] = imgetfile;
    if user_canceled
    display('User Pressed Cancel')
    else
    display(['User Selected', filename])
    end

%Take the image loaded and place it into variables. It takes the image and
%stores the information of the image in one variable and colormap in another.
%Idea taken from Stackoverflow Forum
%<http://stackoverflow.com/questions/9938267/how-to-select-a-file-through-a-gui-in-matlab>    
I2 = imread(filename);    

%Take the information of the image and place it into a variable
%Line taken from MathWorks
%<http://www.mathworks.com/help/images/ref/imageinfo.html>
%INFO2 = imageinfo(filename);

%From the loaded image the values of the image and the colormap must be
%placed as variables onto MATLAB workspace
%Idea taken from Stackoverflow Forum
%<http://stackoverflow.com/questions/9938267/how-to-select-a-file-through-a-gui-in-matlab>
assignin('base','I2',I2);
%assignin('base','map2',map2);

set(h.imageload2,'string',filename);

end





