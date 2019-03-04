function [MMAVoutput] = featureExtractionLiveMMAV(MAVoutput);


 allChan = mean(MAVoutput);
% allChan = [meabs1' meabs2' meabs3' meabs4' meabs5' meabs6' meabs7' meabs8'];


MMAVoutput = allChan;