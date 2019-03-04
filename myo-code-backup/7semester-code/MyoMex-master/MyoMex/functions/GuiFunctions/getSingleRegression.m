function [output] = getSingleRegression(MAV,ExtReg,FleReg,RadReg,UlnReg,FisReg,StrReg,classValue)

scale = 1;

flex = MAV(:,1:8);

[~, class] = find(ismember(classValue, max(classValue(:))));

pred(1) = mean(feval(ExtReg,flex));
pred(2) = mean(feval(FleReg,flex));
pred(3) = mean(feval(RadReg,flex));
pred(4) = mean(feval(UlnReg,flex));
pred(5) = mean(feval(FisReg,flex));
pred(6) = mean(feval(StrReg,flex));

threshold = max(pred);

if class == 1
    predValue = [pred(1)^scale,0,0];
elseif class == 2
    predValue = [-(pred(2)^scale),0,0];
elseif class == 3
    predValue = [0,pred(3)^scale,0];
elseif class == 4
    predValue = [0,-(pred(4)^scale),0];
elseif class == 5
    predValue = [0,0,-(pred(5)^scale)];
elseif class == 6
    predValue = [0,0,pred(6)^scale];
else
    predValue = [0,0,0];
end

if max(predValue) >= 1
    predValue = rescale(predValue);
end 

output = [predValue, threshold];