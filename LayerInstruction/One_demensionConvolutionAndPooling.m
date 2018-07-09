%%��������ת��Ϊͼ��Ȼ��ʶ��
%Next�ѾŸ�subject���ݶ�ʹ���ϣ�����������
layers = [ ...
    imageInputLayer([515 1 10]) %515*1ͼ���С��ʮͨ��
    
    convolution2dLayer([30 1],32,'Stride',[1 1],'Padding','same') %10�������������100��1��С���Ჽ��10 �ݲ���0
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
%������֤��
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

net = trainNetwork(XTrain,YTrain,layers,opts) %Y������categories����