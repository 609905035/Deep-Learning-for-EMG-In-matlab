%
%  计算平均绝对值
%
[row,col] = size(cyl_ch1);
MAV = zeros(row,1); %mean absolute value
meanV = mean(cyl_ch1 ,2);

for i =1:30
    for j = 1:3000
        MAV(i) = abs(cyl_ch1(i, j) - meanV(i))  + MAV(i);
    end
end