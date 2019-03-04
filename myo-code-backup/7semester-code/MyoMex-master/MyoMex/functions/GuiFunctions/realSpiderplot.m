function realSpiderplot(plotHandle,EmgChannels)

xEmg(1) = EmgChannels(1)*0;
xEmg(2) = EmgChannels(2)*1;
xEmg(3) = EmgChannels(3)*1;
xEmg(4) = EmgChannels(4)*1;
xEmg(5) = EmgChannels(5)*0;
xEmg(6) = EmgChannels(6)*-1;
xEmg(7) = EmgChannels(7)*-1;
xEmg(8) = EmgChannels(8)*-1;
xEmg(9) = EmgChannels(1)*0;

yEmg(1) = EmgChannels(1)*1;
yEmg(2) = EmgChannels(2)*1;
yEmg(3) = EmgChannels(3)*0;
yEmg(4) = EmgChannels(4)*-1;
yEmg(5) = EmgChannels(5)*-1;
yEmg(6) = EmgChannels(6)*-1;
yEmg(7) = EmgChannels(7)*0;
yEmg(8) = EmgChannels(8)*1;
yEmg(9) = EmgChannels(1)*1;

axes(plotHandle);
plot(plotHandle,xEmg,yEmg);
hold off;
xlim([-1 1]);
ylim([-1 1]);