%ѡȡ���ʵ��������
flag = 0;  %��ʶ�Ƿ��һ�θ�ֵ
for s = 1:9
    path = sprintf('F:\\����\\EMG���ݿ�\\NinaDB1\\S%d_A1_E1',s);
    [tempX,tempY] = OriginalDataPlotFun(path);
    if flag == 0
        XTrain = tempX;
        YTrain = tempY;
        flag = 1;
    end
    XTrain = cat(4,XTrain,tempX);
    YTrain = cat(2,YTrain,tempY);

end
