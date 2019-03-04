function AccelAnalysis(accelData)

%Splits into different columns and removes nAn

for i=1:3
    accel = accelData(:,[i]);
    accel(isnan(accel)) = [];
    accelMat{i} = transpose(accel);
end

%% Plotting the x, y and z axis of the gyroscope

figure;
hold on;
for i=1:3
    plot(accelMat{i});
end
hold off;

%% Finding the RMS of accelerations

for i=1:3
    RMS(i) = rms(accelMat{i});
end

RMS