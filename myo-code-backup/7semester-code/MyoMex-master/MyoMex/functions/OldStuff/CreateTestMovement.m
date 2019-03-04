%%Input is the full EMG matrix for all the recordings of the movement and
%%then you need the corresponding MVC for the movement in the EMG.

function [output] = CreateTestMovement(emgData, D_MVC, F_MVC, S_MVC);

%Finds the MVC of the entire band
D_maximum = mean(D_MVC);
F_maximum = mean(F_MVC);
S_maximum = mean(S_MVC);

emgData = abs(emgData); %We need the absolute value in order to avoid zeros for the output?

%Finds the mean of every row in the emg data
emgData = mean(emgData,2);

%Rescales between 0 and 1 based on the MVC
movement(1:600,1) = rescale(emgData(1:600,1),'InputMin',0,'InputMax',D_maximum);
movement(601:1200,1) = rescale(emgData(601:1200,1),'InputMin',0,'InputMax',F_maximum);
movement(1201:1800,1) = rescale(emgData(1201:1800,1),'InputMin',0,'InputMax',S_maximum);

%Creates zeros for the rest of the movements performed
movement(1801:7200,1) = 0*ones(5400,1);

output = movement;