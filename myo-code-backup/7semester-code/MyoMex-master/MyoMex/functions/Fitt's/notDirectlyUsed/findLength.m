function [output] = findLength(outputValue)

%Takes the absolute value for the traveled length to make sense:
absVal = outputValue;
L = length(absVal(:,1));
temp = [];

for i=1:L-1
    temp(i,:) = abs(absVal(i,:)-absVal(i+1,:));
end

%Finds the total value traveled in X, Y and Z direction:
temp = sum(sum(abs(temp)));
output = temp;