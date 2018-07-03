function [outputArg1,outputArg2] = tableToSample(inputArg1)
%把输入数据转化成两个矩阵，第一个样本，第二个目标
%   此处显示详细说明
SampleOfClass = 100;%每一类样本数
NumberOfClass = 4;%(类别数量）
source = readtable(inputArg1);
[row,column] = size(source);
source1 = table2array(source);
input = source1(:,1:end-1);%删除最后一列
% target = source1(:,end);%选取最后一列
target1 = zeros(row,NumberOfClass);
for Number=1:NumberOfClass
    for Sample = 1:SampleOfClass
        target1(Sample + (Number-1)*SampleOfClass,Number) = 1;
    end
end
outputArg1 = input;
outputArg2 = target1;



