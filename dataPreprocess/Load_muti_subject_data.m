%选取多个实验者数据
flag = 0;  %标识是否第一次赋值
for s = 1:9
    path = sprintf('F:\\下载\\EMG数据库\\NinaDB1\\S%d_A1_E1',s);
    [tempX,tempY] = OriginalDataPlotFun(path);
    if flag == 0
        XTrain = tempX;
        YTrain = tempY;
        flag = 1;
    end
    XTrain = cat(4,XTrain,tempX);
    YTrain = cat(2,YTrain,tempY);

end
