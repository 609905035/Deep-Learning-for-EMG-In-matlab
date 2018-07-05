function [XTrain,YTrain] = SequenceEMGSignalFun(path,exercise)
%SEQUENCEEMGSIGNAL 此处显示有关此函数的摘要
%   此处显示详细说明
if nargin < 2
    exercise = 1; %设置默认值
end
move = 12;
load(path,'repetition', 'stimulus', 'emg'); 

switch exercise
    case 1
        move = 12;
    case 2
        move = 17;
    case 3
        move = 23;
end
%运动数据制作2D矩阵
flag = 0; %dataset第一次赋值标志
temp = [];
count = 0; %对样本计数
for a = 1:10 %10次重复
    for b = 1:move  %move代表动作的数量
        count = count + 1;
        index = repetition ;
        index(index ~= a) = 0; %将无关项置零
        index(stimulus ~= b) = 0; %将无关项置零
        for c=1:10  %channel
            emgImage = emg(index ~=  0,c); %在emg中选出相关数据
            if length(emgImage) > 515
                emgImage = emgImage(1:515); %去掉多余的值
            end
            emgImage = emgImage'; %变为行向量，方便填充0操作
            emgImage = [emgImage,zeros(1,515 - length(emgImage))]; %置零在LSTM可能有较大影响
            temp(c,:) = emgImage;%创建2D序列，行代表通道
        end
        if flag == 0
            dataset = temp;
            categories = b ;
            flag = 1;
            continue;
        end    
        dataset = cat(3,dataset,temp); %给temp第四维，形成23×23×10×120赋值之前需要删除原有变量
        categories = [categories b]; %附加b到categories后,使用cat(2, ...)会出现无法附加值的问题
    end
end
XTrain = dataset;
YTrain = categorical(categories);
end

