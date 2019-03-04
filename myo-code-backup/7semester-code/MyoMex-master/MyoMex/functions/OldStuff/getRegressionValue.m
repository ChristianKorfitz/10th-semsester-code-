function [output] = getRegressionValue(featureData,ExteReg,FlexReg,RadiReg,UlnReg)

flex1 = featureData(:,1);
flex2 = featureData(:,2);
flex3 = featureData(:,3);
flex4 = featureData(:,4);
flex5 = featureData(:,5);
flex6 = featureData(:,6);
flex7 = featureData(:,7);
flex8 = featureData(:,8);

ypredFlex = mean(feval(FlexReg,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8));
ypredExte = mean(feval(ExteReg,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8));
ypredRadi = mean(feval(RadiReg,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8));
ypredUlna = mean(feval(UlnReg,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8));

if ypredExte >= ypredFlex
    xValue = ypredExte;
else
    xValue = 0-ypredFlex;
end

if ypredRadi >= ypredUlna
    yValue = ypredRadi;
else
    yValue = 0-ypredUlna;
end    

output = [xValue, yValue];