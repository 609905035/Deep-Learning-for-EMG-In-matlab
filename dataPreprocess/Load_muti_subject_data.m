%ѡȡ���ʵ��������
flag = 0;  %��ʶ�Ƿ��һ�θ�ֵ
exercise = 3; %�����鶯��
for subject = 1:9  %ʵ�����
    path = sprintf('F:\\����\\EMG���ݿ�\\NinaDB1\\S%d_A1_E%d',subject,exercise);
    [tempX,tempY] = OriginalDataPlotFun(path,exercise);
    if flag == 0
        XTrain = tempX;
        YTrain = tempY;
        flag = 1;
        continue;
    end
    XTrain = cat(4,XTrain,tempX);
    YTrain = [YTrain tempY];

end
