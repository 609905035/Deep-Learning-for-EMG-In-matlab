function [XTrain,YTrain] = OriginalDataPlotFun(path,exercise)
%从NinaDB1读取第某一类动作数据，path为数据集绝对路径
%exercise指定动作类型,默认为1
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
for a = 1:10 %10个通道
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
            emgImage = emgImage';
            emgImage = [emgImage,zeros(1,515 - length(emgImage))];
            emgImage = vec2mat(emgImage,23); % 转换矩阵。
            temp(:,:,c) = emgImage;%扩展到三维
        end
        if flag == 0
            dataset = temp;
            categories = b ;
            flag = 1;
            continue;
        end
        dataset = cat(4,dataset,temp); %给temp第四维，形成23×23×10×120赋值之前需要删除原有变量
        categories = [categories b]; %附加b到categories后,使用cat(2, ...)会出现无法附加值的问题
    end
end
XTrain = dataset;
YTrain = categorical(categories);


end

