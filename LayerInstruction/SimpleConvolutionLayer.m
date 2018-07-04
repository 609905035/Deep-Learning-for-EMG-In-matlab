
%%肌电数据转换为图像，然后识别
%Next把九个subject数据都使用上，增加数据量
layers = [ ...
    imageInputLayer([23 23 10]) %23*23图像大小，单通道
    
    convolution2dLayer(3,10,'Padding','same') %10个卷积过滤器，3×3大小，自动计算填充层
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer   
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer   
    
    fullyConnectedLayer(12)
    softmaxLayer
    classificationLayer]
%设置验证集
idx = randperm(size(XTrain,4),100);
XValidation = XTrain(:,:,:,idx);
XTrain(:,:,:,idx) = [];
YValidation = YTrain(idx);
YTrain(idx) = [];

opts = trainingOptions('sgdm', ...
    'MaxEpochs',15, ...
    'Shuffle','every-epoch', ...
    'Plots','training-progress', ...
    'Verbose',false, ...
    'ValidationData',{XValidation,YValidation},...
    'ValidationPatience',Inf);

net = trainNetwork(XTrain,YTrain,layers,opts) %Y必须是categories类型