function [SSCoutput] = featureExtractionLiveSSC(emgData);

for o = 1:length(emgData(1,:))
    W_SSC = 0;
for k = 2:length(emgData(:,1))-1
    
    temp2 = (emgData(k,o)-emgData(k-1,o))*(emgData(k,o)-emgData(k+1,o));
    if temp2 > 0
        W_SSC = W_SSC+1;
    end              
end 
final_SSC(o)=W_SSC;

end

allChan = final_SSC;

SSCoutput = allChan;

