function [ Output_MAV ] = MAVFun( Input_matrix )
    %
    %  计算平均绝对值
    %
    [row,col] = size(Input_matrix);
    MAV = zeros(row,1); %mean absolute value
    meanV = mean(Input_matrix, 2);

    for i =1:8
        for j = 1:100
            MAV(i) = abs(Input_matrix(i, j) - meanV(i))  + MAV(i);
        end
    end
    Output_MAV = MAV;
end

