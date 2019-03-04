function [SMAVoutput] = featureExtractionLiveSMAV(MAVoutput,MMAVoutput);

allChan(1) = MAVoutput(1)/MMAVoutput;
allChan(2) = MAVoutput(2)/MMAVoutput;
allChan(3) = MAVoutput(3)/MMAVoutput;
allChan(4) = MAVoutput(4)/MMAVoutput;
allChan(5) = MAVoutput(5)/MMAVoutput;
allChan(6) = MAVoutput(6)/MMAVoutput;
allChan(7) = MAVoutput(7)/MMAVoutput;
allChan(8) = MAVoutput(8)/MMAVoutput;

SMAVoutput = allChan;
