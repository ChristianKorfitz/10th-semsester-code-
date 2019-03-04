function [output] = createRegressionModel(rightEmgData, restData, movement)

%Take ALL the data as inputs and creates the regressors.
%Movement is the percent value between 0 and 1 for the movement

L = length(rightEmgData(:,1));
LR = length(restData(:,1));

inputData(1:L,1:8) = rightEmgData;
inputData(L+1:2*L,1:8) = restData;

%Makes it into something table-ish:
channel_1 = inputData(:,1);
channel_2 = inputData(:,2);
channel_3 = inputData(:,3);
channel_4 = inputData(:,4);
channel_5 = inputData(:,5);
channel_6 = inputData(:,6);
channel_7 = inputData(:,7);
channel_8 = inputData(:,8);

%accel_x = accelData(:,1);
%accel_y = accelData(:,2);
%accel_z = accelData(:,3);

%Creation of dataset for regression-stuff:
cereal = dataset(movement, channel_1, channel_2, channel_3, channel_4, ... 
    channel_5, channel_6, channel_7, channel_8);%, accel_x, accel_y, accel_z);

Variables = {'movement','emg_1','emg_2','emg_3','emg_4','emg_5','emg_6','emg_7', ...
    'emg_8'};%,'acc_x','acc_y','acc_z'};

cereal.Properties.VarDescription = Variables(1,:);

%This gets us our table thing for the data:
regressionInput = dataset2table(cereal);

modelspec = 'movement ~ channel_1 + channel_2 + channel_3 + channel_4  + channel_5 + channel_6 + channel_7 + channel_8';% + accel_x + accel_y + accel_z';
mdl = fitlm(regressionInput, modelspec)

%plotResiduals(mdl)

output = mdl;