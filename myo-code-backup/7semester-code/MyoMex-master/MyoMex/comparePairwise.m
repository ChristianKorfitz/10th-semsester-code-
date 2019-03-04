function [p] = comparePairwise(feature1,feature2)

p = [];

for i=1:size(feature1,1)
    p = [p;ranksum(feature1(i,:)',feature2(i,:)')];
end