
%%��������ת��Ϊͼ��Ȼ��ʶ��
%Next�ѾŸ�subject���ݶ�ʹ���ϣ�����������
layers = [ ...
    imageInputLayer([23 23 10]) %23*23ͼ���С����ͨ��
    
    convolution2dLayer(3,10,'Padding','same') %10�������������3��3��С���Զ���������
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
%������֤��
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

net = trainNetwork(XTrain,YTrain,layers,opts) %Y������categories����