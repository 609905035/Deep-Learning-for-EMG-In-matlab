function [outputArg1,outputArg2] = tableToSample(inputArg1)
%����������ת�����������󣬵�һ���������ڶ���Ŀ��
%   �˴���ʾ��ϸ˵��
SampleOfClass = 100;%ÿһ��������
NumberOfClass = 4;%(���������
source = readtable(inputArg1);
[row,column] = size(source);
source1 = table2array(source);
input = source1(:,1:end-1);%ɾ�����һ��
% target = source1(:,end);%ѡȡ���һ��
target1 = zeros(row,NumberOfClass);
for Number=1:NumberOfClass
    for Sample = 1:SampleOfClass
        target1(Sample + (Number-1)*SampleOfClass,Number) = 1;
    end
end
outputArg1 = input;
outputArg2 = target1;



