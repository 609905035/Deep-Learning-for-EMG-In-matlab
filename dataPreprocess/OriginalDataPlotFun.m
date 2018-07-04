function [XTrain,YTrain] = OriginalDataPlotFun(path)
%��NinaDB1��ȡ��һ�ද�����ݣ�pathΪ���ݼ�����·��
% 
load(path,'repetition', 'stimulus', 'emg'); 
%��һλʵ����12����ָ�˶���������ͼ��
temp = [];
count = 0; %����������
for a = 1:10
    for b = 1:12
        count = count + 1;
        index = repetition ;
        index(index ~= a) = 0; %���޹�������
        index(stimulus ~= b) = 0; %���޹�������
        for c=1:10
            emgImage = emg(index ~=  0,c); %��emg��ѡ���������
            emgImage = vec2mat(emgImage,23);
            temp(:,:,c) = emgImage;%��չ����ά
        end
        dataset(:,:,:,count) = temp;%��temp����ά���γ�23��23��10��120��ֵ֮ǰ��Ҫɾ��ԭ�б���
        categories(count) = b ;
    end
end
XTrain = dataset;
YTrain = categorical(categories);


end

