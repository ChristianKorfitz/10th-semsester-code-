function [output] = completionRate(gotIt,targetset)

L = length(createTargetset(targetset));

output = sum(gotIt)/L;