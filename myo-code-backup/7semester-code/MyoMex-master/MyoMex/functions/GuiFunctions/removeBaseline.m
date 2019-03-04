function output = removeBaseline(inputData, baseline)

%Tried to remove the baseline by dividing the sample by 5 if it's below the
%recorded baseline for each channel.

for i=1:8
    if abs(baseline(i)) >= abs(inputData(i))
        outputData(i) = inputData(i)/5;
    else
        outputData(i) = inputData(i);
    end
end

[output] = outputData;
        