function test_example_CNN

%{
First the mat file FEI_CNN is loaded because this uses train_x and train_y


%}
load FEI_CNN;     
train_x = double(reshape(train_x,28,28,60))/255;%reshapes the input image 
%test_x = double(reshape(test_x,28,28,2 ))/255;
train_y = double(train_y');%transpose
%test_y = double(test_y');


 

%% ex1 Train a 6c-2s-12c-2s Convolutional neural network 
%will run 1 epoch in about 200 second and get around 11% error. 
%With 100 epochs you'll get around 1.2% error

rand('state',0)
%A structure is created for different layer
cnn.layers = {
    struct('type', 'i') %input layer
    struct('type', 'c', 'outputmaps', 6, 'kernelsize', 5) %convolution layer
    struct('type', 's', 'scale', 2) %sub sampling layer
    struct('type', 'c', 'outputmaps', 12, 'kernelsize', 5) %convolution layer
    struct('type', 's', 'scale', 2) %subsampling layer
};


opts.alpha = 1;
opts.batchsize =2;
opts.numepochs =100;

cnn = cnnsetup(cnn, train_x, train_y);
cnn = cnntrain(cnn, train_x, train_y, opts);
save cnn.mat cnn

   
        

end