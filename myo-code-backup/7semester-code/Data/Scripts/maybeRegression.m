function maybeRegression(normData,featureData)

%this is just completely nonsense and such other silliness

net = feedforwardnet(20);
net = train(net, normData, featureData)

y = net(normData);
[r,m,b] = regression(featureData,y);

plotregression(featureData,y);