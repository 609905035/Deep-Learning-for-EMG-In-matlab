load('F:\下载\EMG数据库\NinaDB1\S1_A1_E3');
%第一位实验者12组手指运动数据制作图像
temp = [];
count = 0; %对样本计数
for a = 1:10
    for b = 1:23
        count = count + 1;
        index = repetition ;
        index(index ~= a) = 0; %将无关项置零
        index(stimulus ~= b) = 0; %将无关项置零
        for c=1:10
            emgImage = emg(index ~=  0,c); %在emg中选出相关数据
            emgImage = vec2mat(emgImage,23);
            temp(:,:,c) = emgImage;%扩展到三维
        end
        dataset(:,:,:,count) = temp;%给temp第四维，形成23×23×10×120赋值之前需要删除原有变量
        categories(count) = b ;
    end
end
XTrain = dataset;
YTrain = categories;
YTrain = categorical(YTrain);
