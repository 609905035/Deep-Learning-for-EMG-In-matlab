%%肌电数据转换为图像，然后识别
%Next把九个subject数据都使用上，增加数据量
layers = [ ...
    imageInputLayer([515 1 10]) %515*1图像大小，十通道
    
    convolution2dLayer([30 1],32,'Stride',[1 1],'Padding','same') %10个卷积过滤器，100×1大小，横步长10 纵步长0
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer([10 1],'Stride',[2 1])
    
    convolution2dLayer([30 1],32,'Stride',[1 1],'Padding','same')
    batchNormalizationLayer
    reluLayer   
    
    maxPooling2dLayer([30 1],'Stride',[2 1])
    
    convolution2dLayer([50 1],32,'Stride',[1 1],'Padding','same')
    batchNormalizationLayer
    reluLayer   
    
    fullyConnectedLayer(23)
    softmaxLayer
    classificationLayer]
%设置验证集
idx = randperm(size(XTrain,4),500);
XValidation = XTrain(:,:,:,idx);
XTrain(:,:,:,idx) = [];
YValidation = YTrain(idx);
YTrain(idx) = [];

opts = trainingOptions('sgdm', ...
    'MaxEpochs',30, ...
    'Shuffle','every-epoch', ...
    'Plots','training-progress', ...
    'Verbose',false, ...
    'ValidationData',{XValidation,YValidation},...
    'ValidationPatience',Inf);

net = trainNetwork(XTrain,YTrain,layers,opts) %Y必须是categories类型