load('F:\下载\EMG数据库\NinaDB1\S1_A1_E1');
%第一位实验者12组手指运动数据制作图像
temp = [];
count = 0; %对样本计数
for a = 1:10
    for b = 1:12
        count = count + 1;
        index = repetition ;
        index(index ~= a) = 0; %将无关项置零
        index(stimulus ~= b) = 0; %将无关项置零
        emgImage = emg(index ~=  0); %在emg中选出相关数据
        emgImage = vec2mat(emgImage,23);
        temp = emgImage(:,:,1);%扩展到三维
        dataset(:,:,:,(count)) = temp;
        categories(count) = b ;
    end
end
