function [XTrain,YTrain] = SequenceEMGSignalFun(path,exercise)
%SEQUENCEEMGSIGNAL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if nargin < 2
    exercise = 1; %����Ĭ��ֵ
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
%�˶���������2D����
flag = 0; %dataset��һ�θ�ֵ��־
temp = [];
count = 0; %����������
for a = 1:10 %10���ظ�
    for b = 1:move  %move������������
        count = count + 1;
        index = repetition ;
        index(index ~= a) = 0; %���޹�������
        index(stimulus ~= b) = 0; %���޹�������
        for c=1:10  %channel
            emgImage = emg(index ~=  0,c); %��emg��ѡ���������
            if length(emgImage) > 515
                emgImage = emgImage(1:515); %ȥ�������ֵ
            end
            emgImage = emgImage'; %��Ϊ���������������0����
            emgImage = [emgImage,zeros(1,515 - length(emgImage))]; %������LSTM�����нϴ�Ӱ��
            temp(c,:) = emgImage;%����2D���У��д���ͨ��
        end
        if flag == 0
            dataset = temp;
            categories = b ;
            flag = 1;
            continue;
        end    
        dataset = cat(3,dataset,temp); %��temp����ά���γ�23��23��10��120��ֵ֮ǰ��Ҫɾ��ԭ�б���
        categories = [categories b]; %����b��categories��,ʹ��cat(2, ...)������޷�����ֵ������
    end
end
XTrain = dataset;
YTrain = categorical(categories);
end

