function [CR,ID,OS,PE,SD,TP,dingThing] = genTestMatrix(name,group)

if group == 1
    thePath1 = strcat('Data/Group 1/',name,'/Test 1');
    thePath2 = strcat('Data/Group 1/',name,'/Test 2');
    thePath3 = strcat('Data/Group 1/',name,'/Test 3');
    thePath4 = strcat('Data/Group 1/',name,'/Test 4');
else 
    thePath1 = strcat('Data/Group 2/',name,'/Test 1');
    thePath2 = strcat('Data/Group 2/',name,'/Test 2');
    thePath3 = strcat('Data/Group 2/',name,'/Test 3');
    thePath4 = strcat('Data/Group 2/',name,'/Test 4');
end

addpath(thePath1);
[CR1,ID1,OS1,PE1,SD1,TP1] = fittsLawResults(1);
load('stayStable.mat');
dingThing = stayStable';
rmpath(thePath1);

addpath(thePath2);
[CR2,ID2,OS2,PE2,SD2,TP2] = fittsLawResults(2);
rmpath(thePath2);

addpath(thePath3);
[CR3,ID3,OS3,PE3,SD3,TP3] = fittsLawResults(3);
load('stayStable.mat');
dingThing = [dingThing;stayStable'];
rmpath(thePath3);

addpath(thePath4);
[CR4,ID4,OS4,PE4,SD4,TP4] = fittsLawResults(4);
load('stayStable.mat');
dingThing = [dingThing;stayStable'];
rmpath(thePath4);

CR = [CR1;CR2;CR3;CR4];
ID = [ID1;ID2;ID3;ID4];
OS = [OS1;OS2;OS3;OS4];
PE = [PE1;PE2;PE3;PE4];
SD = [SD1;SD2;SD3;SD4];
TP = [TP1;TP2;TP3;TP4];
