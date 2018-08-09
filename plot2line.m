X = emg;
x = 1:1:1808331;
y2 = repetition;
y2(y2>0) = 1;
y2 = double(y2);
y2 = y2*(10^-5);
plot(x,X)
hold on
plot(x,y2)
hold off