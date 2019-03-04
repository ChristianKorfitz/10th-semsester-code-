function [output] = overshot(overshoots,gotIt)%targetset)

L = sum(gotIt);%length(createTargetset(targetset));

if L == 0
    output = 0;
else
    output = sum(overshoots)/L;
end