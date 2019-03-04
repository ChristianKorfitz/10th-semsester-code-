function [results, p] = compareResults(feature1, feature2, testNumber)

feature1 = feature1(testNumber,1:5)';
feature2 = feature2(testNumber,1:5)';

[p,~,stats] = friedman([feature1, feature2]);

results = multcompare(stats,'CType','bonferroni');