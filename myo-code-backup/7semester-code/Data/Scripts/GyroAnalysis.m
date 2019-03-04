function GyroAnalysis(gyroData)

%Splits into different columns and removes nAn

gyroData1 = gyroData(:,[1]);
gyroData2 = gyroData(:,[2]);
gyroData3 = gyroData(:,[3]);

gyroData1(isnan(gyroData1)) = [];
gyroData2(isnan(gyroData2)) = [];
gyroData3(isnan(gyroData3)) = [];

gyroData1 = transpose(gyroData1);
gyroData2 = transpose(gyroData2);
gyroData3 = transpose(gyroData3);

%% Plotting the x, y and z axis of the gyroscope

figure;
hold on;
plot(gyroData1,'m');
plot(gyroData2,'g');
plot(gyroData3,'b');
hold off;