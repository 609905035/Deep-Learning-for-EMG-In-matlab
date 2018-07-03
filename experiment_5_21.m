for num = 1:8
    input2 = MAVFun(input1((1 + num*100):(100+100*num),1);
    input3 = [input3,input2];
end
input3
