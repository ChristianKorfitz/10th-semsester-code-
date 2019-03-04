function [threshold] = createThreshold(emgData, percent)

for i=1:8
    threshold(i) = rms(emgData(:,[i]))*(percent/100);
end