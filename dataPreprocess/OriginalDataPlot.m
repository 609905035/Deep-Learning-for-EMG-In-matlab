load('F:\����\EMG���ݿ�\NinaDB1\S1_A1_E1');
%��һλʵ����12����ָ�˶���������ͼ��
temp = [];
count = 0; %����������
for a = 1:10
    for b = 1:12
        count = count + 1;
        index = repetition ;
        index(index ~= a) = 0; %���޹�������
        index(stimulus ~= b) = 0; %���޹�������
        emgImage = emg(index ~=  0); %��emg��ѡ���������
        emgImage = vec2mat(emgImage,23);
        temp = emgImage(:,:,1);%��չ����ά
        dataset(:,:,:,(count)) = temp;
        categories(count) = b ;
    end
end
