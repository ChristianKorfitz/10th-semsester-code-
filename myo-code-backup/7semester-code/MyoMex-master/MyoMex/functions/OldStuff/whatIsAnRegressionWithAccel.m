function [output] = whatIsAnRegressionWithAccel(rightFeatData, wrongFeatData1, wrongFeatData2, wrongFeatData3, restData, rightAccData, wrongAccData1, wrongAccData2, wrongAccData3, restAcc, movement)
%Take ALL the data as inputs and such and fuck it and it works #yolo
%Movement is the percent value between 0 and 1 for the movement?

L = length(rightFeatData(:,1));
LR = length(restData(:,1));

inputData(1:L,1:8) = rightFeatData;

inputData(L+1:2*L,1:8) = wrongFeatData1;
inputData(2*L+1:3*L,1:8) = wrongFeatData2;
inputData(3*L+1:4*L,1:8) = wrongFeatData3;
inputData(4*L+1:(4*L+LR),1:8) = restData;

accData(1:L,1:3) = rightAccData;

accData(L+1:2*L,1:3) = wrongAccData1;
accData(2*L+1:3*L,1:3) = wrongAccData2;
accData(3*L+1:4*L,1:3) = wrongAccData3;
accData(4*L+1:(4*L+LR),1:3) = restAcc(1:LR,1:3);

movement = [movement; ones(LR,1)*0];

%Makes it into something table-ish:
channel_1 = inputData(:,1);
channel_2 = inputData(:,2);
channel_3 = inputData(:,3);
channel_4 = inputData(:,4);
channel_5 = inputData(:,5);
channel_6 = inputData(:,6);
channel_7 = inputData(:,7);
channel_8 = inputData(:,8);

accel_x = accData(:,1);
accel_y = accData(:,2);
accel_z = accData(:,3);

%Creation of dataset for regression-stuff:
cereal = dataset(movement, channel_1, channel_2, channel_3, channel_4, ... 
    channel_5, channel_6, channel_7, channel_8, accel_x, accel_y, accel_z);

Variables = {'movement','emg_1','emg_2','emg_3','emg_4','emg_5','emg_6','emg_7', ...
    'emg_8','acc_x','acc_y','acc_z'};

cereal.Properties.VarDescription = Variables(1,:);

%This gets us our table thing for the data:
regressionInput = dataset2table(cereal);

modelspec = 'movement ~ channel_1 + channel_2 + channel_3 + channel_4  + channel_5 + channel_6 + channel_7 + channel_8 + accel_x + accel_y + accel_z';
mdl = fitlm(regressionInput, modelspec)

plotResiduals(mdl)

output = mdl;