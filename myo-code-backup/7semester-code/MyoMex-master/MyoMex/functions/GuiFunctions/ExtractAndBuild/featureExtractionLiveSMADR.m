function [SMADRoutput] = featureExtractionLiveSMADR(MADRoutput, MMAVoutput)

SMADR = MADRoutput./MMAVoutput;

SMADRoutput = SMADR;