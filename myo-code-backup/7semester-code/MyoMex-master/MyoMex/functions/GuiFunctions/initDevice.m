%% Used to initialize the connection with the device 

function [obj,mm] = initDevice()

countMyos = 1;
mm = MyoMex(countMyos);
obj = mm.myoData(1);
pause(0.1);
obj.timeIMU;
obj.quat;
obj.rot;
obj.gyro;
obj.gyro_fixed;
obj.accel;
obj.accel_fixed;
obj.pose;
obj.pose_rest;
obj.timeEMG;
obj.emg;
assignin('base','m1init', 1);
end

