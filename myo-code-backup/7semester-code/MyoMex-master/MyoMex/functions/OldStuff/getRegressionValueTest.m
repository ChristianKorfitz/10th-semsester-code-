function [output] = getRegressionValueTest(featureData,mahExtensionRegrizzle,mahFlexionRegrizzle,mahRadialRegrizzle,mahUlnarRegrizzle)

flex1 = featureData(:,1);
flex2 = featureData(:,2);
flex3 = featureData(:,3);
flex4 = featureData(:,4);
flex5 = featureData(:,5);
flex6 = featureData(:,6);
flex7 = featureData(:,7);
flex8 = featureData(:,8);

ypredExte = feval(mahExtensionRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8);
ypredFlex = feval(mahFlexionRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8);
ypredRadi = feval(mahRadialRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8);
ypredUlna = feval(mahUlnarRegrizzle,flex1,flex2,flex3,flex4,flex5,flex6,flex7,flex8);

figure;
plot(smooth(ypredExte))
hold on;
plot(smooth(ypredFlex))
plot(smooth(ypredRadi))
plot(smooth(ypredUlna))
legend('Extension','Flexion','Radial','Ulnar');

output = [ypredFlex, ypredExte, ypredRadi, ypredUlna];