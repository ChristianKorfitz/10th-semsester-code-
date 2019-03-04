function [output] = findMVCvector(inputData)

%Filters the eight channels
for i=1:8
    maxColumn{i} = max(transpose(inputData(:,[i])));
    maxColumn{i} = transpose(maxColumn{i});
end

%Creates the output matrix
buffer = [maxColumn{1} maxColumn{2} maxColumn{3} maxColumn{4} ...
    maxColumn{5} maxColumn{6} maxColumn{7} maxColumn{8}];

output = buffer;