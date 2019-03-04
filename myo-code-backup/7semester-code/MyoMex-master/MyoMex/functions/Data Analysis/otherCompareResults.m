function otherCompareResults(feature1, feature2,rotatez,numOfCells)

feature = [];

if rotatez == 1
    for i=1:size(feature1,1)
        feature = [feature, feature1(i,:)'];
    end

    for i=1:size(feature2,1)
        feature = [feature, feature2(i,:)'];
    end
else
    feature = [feature1,feature2];
end

[p,~,stats] = friedman([feature],numOfCells)

results = multcompare(stats,'CType','hsd');

%KRUSKAUVALLIS
%IF GOOD = 2ANOVA
%OTHERWISE FRIEDMAN - GROUP1 VS GROUP2 
%PLOT STD AS WELL
%HSD
%Niel hookson test - paired test