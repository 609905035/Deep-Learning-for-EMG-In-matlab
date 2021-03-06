%选取多个实验者数据
%获取后一位减去前一位的数据集合
flag = 0;  %标识是否第一次赋值
exercise = 3; %第三组动作
for subject = 1:27  %实验个体
    path = sprintf('F:\\下载\\EMG数据库\\NinaDB1\\S%d_A1_E%d',subject,exercise);
    [tempX,tempY] = SequenceCovolutionSubstractFun(path,exercise);
    if flag == 0
        XTrain = tempX;
        YTrain = tempY;
        flag = 1;
        continue;
    end
    XTrain = cat(4,XTrain,tempX);
    YTrain = [YTrain tempY];
end
    XTrain = permute(XTrain,[2 1 3 4]);