inputSize = 10;
numHiddenUnits = 100;
numClasses = 23;

layers = [ ...
    sequenceInputLayer(inputSize)
    bilstmLayer(numHiddenUnits,'OutputMode','last')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer]

idx = randperm(size(XTrain,1),500);
XValidation = XTrain(idx,:);
XTrain(idx,:) = [];
YValidation = YTrain(idx)';
YTrain(idx) = [];

maxEpochs = 100;
miniBatchSize = 27;

options = trainingOptions('adam', ...
    'ExecutionEnvironment','auto', ...
    'GradientThreshold',1, ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'SequenceLength','longest', ...
    ...% 'Shuffle','never',
    ...%'ValidationData',{XValidation,YValidation},...
    'Verbose',0, ...
    'Plots','training-progress');

net = trainNetwork(XTrain,YTrain',layers,options);