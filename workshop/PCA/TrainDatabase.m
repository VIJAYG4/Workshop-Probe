function T = TrainDatabase(TrainDatabasePath)
% Align a set of face images (the training set T1, T2, ... , TM )
%
% Description: This function reshapes all 2D images of the training database
% into 1D column vectors. Then, it puts these 1D column vectors in a row to 
% construct 2D matrix 'T'.
%  
% 
% Argument:     TrainDatabasePath      - Path of the training database
%
% Returns:      T                      - A 2D matrix, containing all 1D image vectors.
%                                        Suppose all P images in the training database 
%                                        have the same size of MxN. So the length of 1D 
%                                        column vectors is MN and 'T' will be a MNxP 2D matrix.
%
%%%%%%%%%%%%%%%%%%%%%%%% File management

 no_folder=size(dir([TrainDatabasePath,'/*']),1)-size(dir([TrainDatabasePath,'/*m']),1)-2;%It calculates the number of folders, i.e., the number of students to be trained
%%%%%%%%%%%%%%%%%%%%%%%% Construction of 2D matrix from 1D image vectors
T = [];
disp('Loading Faces');
for i = 1 : 10 % Number of folders should be changes accordingly for students
    stk = int2str(i);
    disp(stk);
    stk = strcat('/s',stk,'/*jpg');
    folder_content = dir ([TrainDatabasePath,stk]); %It takes the directory in which the student is present.
    nface = size (folder_content,1); %This is to be used when you are to use for a well defined database
    disp(nface);
for j = 1 :  4 % Number of faces 
    % I have chosen the name of each image in databases as a corresponding
    % number. However, it is not mandatory!
    str = int2str(j);
    str = strcat('/',str,'.jpg');
    str = strcat('/s',int2str(i),str);
    str = strcat(TrainDatabasePath,str); %It creates the path to the image file.
    img = imread(str);%Reads the image from the path
    img = rgb2gray(img); %Converts the colour image to dreyscale
    
    [irow icol] = size(img); %Converts the image into a matrix of size 281x381
   
    temp = reshape(img',irow*icol,1);   % Reshaping 2D images into 1D image vectors
    T = [T temp]; % 'T' grows after each turn                    
end

end

end
