function plotTargetTrajectory(outputValue2, startValue)

randomOrder = (1:16);

%Sets the outer boundaries:
x = 0.5*[-20,20,20,-20,-20];
y = 0.5*[20,20,-20,-20,20];
bounds = plot(x,y,'w');
hold on;

%Plots the trajectory:
outputValue1 = outputValue2(1:startValue(1)-1,:);
outputValue2 = outputValue2(startValue(1):startValue(2)-1,:);
outputValue3 = outputValue2(startValue(2):startValue(3)-1,:);
outputValue4 = outputValue2(startValue(3):startValue(4)-1,:);
outputValue5 = outputValue2(startValue(4):startValue(5)-1,:);
outputValue6 = outputValue2(startValue(5):startValue(6)-1,:);
outputValue7 = outputValue2(startValue(6):startValue(7)-1,:);
outputValue8 = outputValue2(startValue(7):startValue(8)-1,:);
outputValue9 = outputValue2(startValue(8):startValue(9)-1,:);
outputValue10 = outputValue2(startValue(9):startValue(10)-1,:);
outputValue11 = outputValue2(startValue(10):startValue(11)-1,:);
outputValue12 = outputValue2(startValue(11):startValue(12)-1,:);
outputValue13 = outputValue2(startValue(12):startValue(13)-1,:);
outputValue14 = outputValue2(startValue(13):startValue(14)-1,:);
outputValue15 = outputValue2(startValue(14):startValue(15)-1,:);
outputValue16 = outputValue2(startValue(15):startValue(16)-1,:);

plot(outputValue1(:,1),outputValue1(:,2));
hold on;
plot(outputValue2(:,1),outputValue1(:,2))
plot(outputValue3(:,1),outputValue1(:,2))
plot(outputValue4(:,1),outputValue1(:,2))
plot(outputValue5(:,1),outputValue1(:,2))
plot(outputValue6(:,1),outputValue1(:,2))
plot(outputValue7(:,1),outputValue1(:,2))
plot(outputValue8(:,1),outputValue1(:,2))
plot(outputValue9(:,1),outputValue1(:,2))
plot(outputValue10(:,1),outputValue1(:,2))
plot(outputValue11(:,1),outputValue1(:,2))
plot(outputValue12(:,1),outputValue1(:,2))
plot(outputValue13(:,1),outputValue1(:,2))
plot(outputValue14(:,1),outputValue1(:,2))
plot(outputValue15(:,1),outputValue1(:,2))
plot(outputValue16(:,1),outputValue1(:,2))



%Sets the targets for the squares:
plotData = 3.5*[1 0.5 0 -0.5 -1 -0.5 0 0.5 2 1 0 -1 -2 -1 0 1; ...
            0 0.5 1 0.5 0 -0.5 -1 -0.5 0 1 2 1 0 -1 -2 -1];
SizeOfDot = [0.8 1.2 1 1.3 1.2 1 0.8 1.2 1 1.2 0.8 1.3 1.2 1 0.8 1.2];
        startSize = [90 90 90 90 30 30 30 30 90 90 90 90 30 30 30 30];

%Plots the square targets:
for i=1:16
    datplotData = plotData(:,i);
    targetAreaX = [datplotData(1,1)-radius; ... 
    datplotData(1,1)-radius; datplotData(1,1)+radius;...
    datplotData(1,1)+radius; datplotData(1,1)-radius];
                    
    targetAreaY = [datplotData(2,1)-radius; ...
    datplotData(2,1)+radius; datplotData(2,1)+radius;...
    datplotData(2,1)-radius; datplotData(2,1)-radius];

    h_target = plot(targetAreaX,targetAreaY,'r');
end