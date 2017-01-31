function [m, A, Eigenfaces]=TrainSystem()% A sample script, which shows the usage of functions, included in
% PCA-based face recognition system (Eigenface method)


clear all
clc
close all

% You can customize and fix initial directory paths
TrainDatabasePath = uigetdir('C:\Users\Tiruchi\Desktop\PCA\TrainDatabase', 'Select training database path' );
T = TrainDatabase(TrainDatabasePath); %Calls the function]
disp(size(T));
[m, A, Eigenfaces] = EigenfaceCore(T);%Calls the Eigenfacecore function where eigenfaces are generated
end
