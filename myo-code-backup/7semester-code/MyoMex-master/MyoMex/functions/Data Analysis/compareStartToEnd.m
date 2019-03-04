function [pp,p] = compareStartToEnd(feature,lol)

[pp,~,stats] = friedman(feature',lol);

results = multcompare(stats,'CType','hsd');

p = results(:,end);