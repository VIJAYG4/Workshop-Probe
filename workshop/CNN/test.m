load cnn.mat
[er, bad] = cnntest(cnn, test_x, test_y);

%plot mean squared error

figure;

plot(cnn.rL,'*');
title('error vs number of epoch');

assert(er<0.12, 'Too big error');
