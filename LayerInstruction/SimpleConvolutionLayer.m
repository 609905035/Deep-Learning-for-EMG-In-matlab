
%%��������ת��Ϊͼ��Ȼ��ʶ��
%Next�Ķ�example�����X=ͼ��4D����Y,��������
layers = [ ...
    imageInputLayer([23 23 1]) %23*23ͼ���С����ͨ��
    convolution2dLayer(3,10,'Padding','same') %10�������������3��3��С���Զ���������
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    fullyConnectedLayer(12)
    softmaxLayer
    classificationLayer]
%������֤��
idx = randperm(size(XTrain,4),20);
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

YTrain = categorical(YTrain);
net = trainNetwork(XTrain,YTrain,layers,opts) %Y������categories����