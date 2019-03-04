

function [] = getAnswers()

doPlot = 0;
doCompare = 0;

[CR1,OS1,PE1,SD1,TP1,CR2,OS2,PE2,SD2,TP2,trainResult1,trainResult2] = plotGroup(doPlot);

doPlot = 1;

[CR1Dif,OS1Dif,PE1Dif,SD1Dif,TP1Dif,CR2Dif,OS2Dif,PE2Dif,SD2Dif,TP2Dif] = improvementBetweenSessions2(CR1,OS1,PE1,SD1,TP1,CR2,OS2,PE2,SD2,TP2,doPlot);

[distance1, distance2, distToCent1, distToCent2] = findDistance;
    
if doCompare == 1
%     [pTestCR,pTCRO] = compareStartToEnd(CR1,1);
%     [pContCR,pCCRO] = compareStartToEnd(CR2,1);
%     [pTestOS,pTOSO] = compareStartToEnd(OS1,1);
%     [pContOS,pCOSO] = compareStartToEnd(OS2,1);
%     [pTestPE,pTPEO] = compareStartToEnd(PE1,1);
%     [pContPE,pCPEO] = compareStartToEnd(PE2,1);
%     [pTestSD,pTSDO] = compareStartToEnd(SD1,1);
%     [pContSD,pCSDO] = compareStartToEnd(SD2,1);
%     [pTestTP,pTTPO] = compareStartToEnd(TP1,1);
%     [pContTP,pCTPO] = compareStartToEnd(TP2,1);
%     
%     pPairCR = comparePairwise(CR1,CR2);
%     pPairOS = comparePairwise(OS1,OS2);
%     pPairPE = comparePairwise(PE1,PE2);
%     pPairSD = comparePairwise(SD1,SD2);
%     pPairTP = comparePairwise(TP1,TP2);
%     
    TR1 = setupTrainResult(trainResult1,1);
    TR2 = setupTrainResult(trainResult2,1);
    
    [pTestTrain,pTTO] = compareStartToEnd(TR1,1);
    [pContTrain,pCTO] = compareStartToEnd(TR2,1);
    
    pPairTrain = comparePairwise(TR1,TR2);
    
    TR1 = setupTrainResult(trainResult1,3);
    TR2 = setupTrainResult(trainResult2,3);
    
    [pTestTrainInt,pTTI] = compareStartToEnd(TR1,4);
    [pContTrainInt,pCTI] = compareStartToEnd(TR2,4);
    
    TR1 = setupTrainResult(trainResult1,0);
    TR2 = setupTrainResult(trainResult2,0);
    
    pPairTrainInt = comparePairwise(TR1,TR2);
    
    TR1 = setupTrainResult(trainResult1,2);
    TR2 = setupTrainResult(trainResult2,2);
    
    [pTestTrainPos,pTTP] = compareStartToEnd(TR1,6);
    [pContTrainPos,pCTP] = compareStartToEnd(TR2,6);
    
    TR1 = setupTrainResult(trainResult1,4);
    TR2 = setupTrainResult(trainResult2,4);
    
    pPairTrainPos = comparePairwise(TR1,TR2);
%     
%     [pTestDist,pTD] = compareStartToEnd(distance1,1);
%     [pContDist,pCD] = compareStartToEnd(distance2,1);
%     
%     pPairDistance = comparePairwise(distance1,distance2);
%     
%     [pTestDistWithin,pTDW] = compareStartToEnd(distToCent1,1);
%     [pContDistWithin,pCDW] = compareStartToEnd(distToCent2,1);
%     
%     pPairDistWithin = comparePairwise(distToCent1,distToCent2);
%     
end