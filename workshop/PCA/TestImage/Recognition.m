function OutputName = Recognition(m, A, Eigenfaces)
% Recognizing step....
%
% Description: This function compares two faces by projecting the images into facespace and 
% measuring the Euclidean distance between them.
%
% Argument:      m                      - (M*Nx1) Mean of the training
%                                         database, which is output of 'EigenfaceCore' function.
%
%                Eigenfaces             - (M*Nx(P-1)) Eigen vectors of the
%                                         covariance matrix of the training
%                                         database, which is output of 'EigenfaceCore' function.
%
%                A                      - (M*NxP) Matrix of centered image
%                                         vectors, which is output of 'EigenfaceCore' function.
% 
% Returns:       OutputName             - Name of the recognized image in the training database.            

%%%%%%%%%%%%%%%%%%%%%%%% Projecting centered image vectors into facespace
% All centered images are projected into facespace by multiplying in
% Eigenface basis's. Projected vector of each face will be its corresponding
% feature vector.

ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); % Projection of centered images into facespace
    ProjectedImages = [ProjectedImages temp]; 
end

%%%%%%%%%%%%%%%%%%%%%%%% Extracting the PCA features from test image
InputImage = imread('InputImage.jpg');
temp = InputImage(:,:,1);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; % Centered test image
ProjectedTestImage = Eigenfaces'*Difference; % Test image feature vector

%%%%%%%%%%%%%%%%%%%%%%%% Calculating Euclidean distances 
% Euclidean distances between the projected test image and the projection
% of all centered training images are calculated. Test image is
% supposed to have minimum distance with its corresponding image in the
% training database.

Euc_dist = [];
for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;%Finds the Euclidean Norm of the difference vector
    Euc_dist = [Euc_dist temp];
end

[Euc_dist_min , Recognized_index] = min(Euc_dist); %Finds the minimum Euclidean distance and stores the index
OutputName = (Recognized_index);


end

