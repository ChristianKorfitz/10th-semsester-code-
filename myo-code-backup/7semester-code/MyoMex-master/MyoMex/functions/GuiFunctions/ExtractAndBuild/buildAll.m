function buildAll()

%Loads all the recorded data - format = [Extension; Flexion; Radial; Ulnar]
allData = loadAndFormat();

%Loads our MVC files
load('MVCExtension.mat');
load('MVCFlexion.mat');
load('MVCRadial.mat');
load('MVCUlnar.mat');
load('MVCFist.mat');
load('MVCStretch.mat');
load('EmgRest.mat');


%Extracts features:
allMAV = featureExtractionMAV(allData);
allWL = featureExtractionWL(allData);
allMMAV = featureExtractionMMAV(allMAV);
allSMAV = featureExtractionSMAV(allMAV,allMMAV);
allMADN = featureExtractionMADN(allData);
allMADR = featureExtractionMADR(allData);
allSMADR = featureExtractionSMADR(allMADR,allMMAV);
allSSC = featureExtractionSSC(allData);
allZC = featureExtractionZC(allData);
allCC = featureExtractionCC(allData);
restMAV = featureExtractionMAV(EmgRest(601:4800,:));
restWL = featureExtractionWL(EmgRest(601:4800,:));
restMMAV = featureExtractionMMAV(restMAV);
restSMAV = featureExtractionSMAV(restMAV,restMMAV);
restMADN = featureExtractionMADN(EmgRest(601:4800,:));
restMADR = featureExtractionMADR(EmgRest(601:4800,:));
restSMADR = featureExtractionSMADR(restMADR,restMMAV);
restSSC = featureExtractionSSC(EmgRest(601:4800,:));
restZC = featureExtractionZC(EmgRest(601:4800,:));
restCC = featureExtractionCC(EmgRest(601:4800,:));
L = length(allMAV)/6;

%Creates the class label names for the classifier
moveLabel = [repelem({'Extension';'Flexion';'Radial';'Ulnar';'Fist';'Stretch';'Rest'}, L, 1)];

%Finds the intensities of the movements (the intensity shown in trapezoid)
ExtensionIntensity = featureExtractionMove(allMAV(1:L,:),MVCExtension);
FlexionIntensity = featureExtractionMove(allMAV(L+1:2*L,:),MVCFlexion);
RadialIntensity = featureExtractionMove(allMAV(2*L+1:3*L,:),MVCRadial);
UlnarIntensity = featureExtractionMove(allMAV(3*L+1:4*L,:),MVCUlnar);
FistIntensity = featureExtractionMove(allMAV(4*L+1:5*L,:),MVCRadial);
StretchIntensity = featureExtractionMove(allMAV(5*L+1:6*L,:),MVCUlnar);

%classInput = [allMav,allWL;restMav,restWL];
classInput = [allWL,allSMAV,allMADN,allMADR,allSMADR, allCC; ...
    restWL,restSMAV,restMADN,restMADR,restSMADR,restCC];

%Creates the classifier
MdlLinear = fitcdiscr(classInput,moveLabel,'DiscrimType','pseudolinear', ... 
    'ScoreTransform','none','HyperparameterOptimizationOptions','bayesopt')

%Creates the regression models
ExtensionRegression = createRegressionModel(allMAV(1:L,:), restMAV, ExtensionIntensity);

FlexionRegression = createRegressionModel(allMAV(L+1:2*L,:), restMAV, FlexionIntensity);

RadialRegression = createRegressionModel(allMAV(2*L+1:3*L,:), restMAV, RadialIntensity);

UlnarRegression = createRegressionModel(allMAV(3*L+1:4*L,:), restMAV, UlnarIntensity);

FistRegression = createRegressionModel(allMAV(4*L+1:5*L,:), restMAV, FistIntensity);

StretchRegression = createRegressionModel(allMAV(5*L+1:6*L,:), restMAV, StretchIntensity);

%Saves all the new things:
save('ExtensionRegression.mat','ExtensionRegression');
save('FlexionRegression.mat','FlexionRegression');
save('RadialRegression.mat','RadialRegression');
save('UlnarRegression.mat','UlnarRegression');
save('FistRegression.mat','FistRegression');
save('StretchRegression.mat','StretchRegression');
save('MdlLinear.mat','MdlLinear');
save('allData.mat','allData');
save('classInput.mat','classInput');
% save('allMAV.mat','allMAV');
% save('allWL.mat','allWL');
% save('restMAV.mat','restMAV');
% save('restWL.mat','restWL');