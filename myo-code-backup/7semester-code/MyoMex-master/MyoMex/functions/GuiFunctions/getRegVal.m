function [output] = getRegVal(MAV, ExtReg, FleReg, RadReg, UlnReg, FisReg, StrReg,classValue)

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
    predValue = [pred(1),0,0,0,0,0,0];
elseif class == 2
    predValue = [0,pred(2),0,0,0,0,0];
elseif class == 3
    predValue = [0,0,pred(3),0,0,0,0];
elseif class == 4
    predValue = [0,0,0,pred(4),0,0,0];
elseif class == 5
    predValue = [0,0,0,0,pred(5),0,0];
elseif class == 6
    predValue = [0,0,0,0,0,pred(6),0];
else
    predValue = [0,0,0,0,0,0,0];
end

if max(predValue) >= 1
    predValue = rescale(predValue);
end

output = [predValue,threshold];
