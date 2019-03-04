%% Remove nAn and splits stuff to make it work

function [output] = removeAndSplit(emgData)

for i=1:8
    column = emgData(:,[i]);
    column(isnan(column)) = [];
    columnMatrix{i} = transpose(column);
end

output = [columnMatrix{1}; columnMatrix{2}; columnMatrix{3}; columnMatrix{4}; columnMatrix{5}; ...
    columnMatrix{6}; columnMatrix{7}; columnMatrix{8}];

end