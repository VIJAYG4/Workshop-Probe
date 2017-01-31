function []=Test()
%Testing MNIST Database
% Load validation set.
    load Train.mat
    
    inputValues = loadMNISTImages('t10k-images.idx3-ubyte');
    labels = loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    activationFunction=@logisticSigmoid;
    % Choose decision rule.
    fprintf('Validation:\n');
    
    [correctlyClassified, classificationErrors] = validate(activationFunction, hiddenWeights, outputWeights, inputValues, labels);
    
    fprintf('Classification errors: %d\n', classificationErrors);
    fprintf('Correctly classified: %d\n', correctlyClassified);
            
return;
end