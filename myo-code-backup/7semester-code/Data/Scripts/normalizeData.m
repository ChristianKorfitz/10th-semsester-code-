function [output] = normalizeData(emgData)

% This normalized the absolute value of the shit you throw into the fucking
% function. Jesus christ it's so god damn simple!!

%figure out if we should use normc to normalize irt colums OR
% use normr to normalize irt rows
% normr gives very samll values after normalization and smoothing
% probably we should use normc to normalize channels to each other rather
% than normalize in relation a channels itself

output = normc(abs(emgData));
