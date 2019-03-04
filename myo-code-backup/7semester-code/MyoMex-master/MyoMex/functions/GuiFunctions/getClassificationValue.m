% This function retreives the classification values based on the input
% classifier and the feature data.

function [output] = getClassificationValue(featureData,MdlLinear)

[class scores] = predict(MdlLinear, featureData);

%This is due to the alphabetical sorting of the scores, which means that
%ulnar comes after rest in the output scores. Silly stuff, MATLAB...
ypredExte = mean(scores(:,1));
ypredFist = mean(scores(:,2));
ypredFlex = mean(scores(:,3));
ypredRadi = mean(scores(:,4));
ypredRest = mean(scores(:,5));
ypredStre = mean(scores(:,6));
ypredUlna = mean(scores(:,7));

output = [ypredExte, ypredFlex, ypredRadi, ypredUlna, ypredFist, ypredStre, ypredRest];