function [output] = decideClass(classToPlot)

[~, max_idx] = max(classToPlot);

if max_idx == 1
    output = [1 0 0 0 0 0 0];
elseif max_idx == 2
    output = [0 1 0 0 0 0 0];
elseif max_idx == 3
    output = [0 0 1 0 0 0 0];
elseif max_idx == 4
    output = [0 0 0 1 0 0 0];
elseif max_idx == 5
    output = [0 0 0 0 1 0 0];
elseif max_idx == 6
    output = [0 0 0 0 0 1 0];
else
    output = [0 0 0 0 0 0 1];
end