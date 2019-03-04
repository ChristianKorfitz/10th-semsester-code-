


function [SSCoutput] = featureExtractionSSC(emgData);



for i=1:8
     Column{i} = transpose(emgData(:,[i])); 
end

c1 = buffer(Column{1},40,20);
[R C] = size(c1);

for o = 1:C
    W_SSC = 0;
for k = 2:R-1
    
    temp2 = (c1(k,o)-c1(k-1,o))*(c1(k,o)-c1(k+1,o));
    if temp2 > 0
        W_SSC = W_SSC+1;
    end              
end 
final_SSC1(o)=W_SSC;

end

c2 = buffer(Column{2},40,20);
for o = 1:C
    W_SSC = 0;
for k = 2:R-1
    
    temp2 = (c2(k,o)-c2(k-1,o))*(c2(k,o)-c2(k+1,o));
    if temp2 > 0
        W_SSC = W_SSC+1;
    end              
end 
final_SSC2(o)=W_SSC;

end

c3 = buffer(Column{3},40,20);
for o = 1:C
    W_SSC = 0;
for k = 2:R-1
    
    temp2 = (c3(k,o)-c3(k-1,o))*(c3(k,o)-c3(k+1,o));
    if temp2 > 0
        W_SSC = W_SSC+1;
    end              
end 
final_SSC3(o)=W_SSC;

end

c4 = buffer(Column{5},40,20);
for o = 1:C
    W_SSC = 0;
for k = 2:R-1
    
    temp2 = (c4(k,o)-c4(k-1,o))*(c4(k,o)-c4(k+1,o));
    if temp2 > 0
        W_SSC = W_SSC+1;
    end              
end 
final_SSC4(o)=W_SSC;

end

c5 = buffer(Column{5},40,20);
for o = 1:C
    W_SSC = 0;
for k = 2:R-1
    
    temp2 = (c5(k,o)-c5(k-1,o))*(c5(k,o)-c5(k+1,o));
    if temp2 > 0
        W_SSC = W_SSC+1;
    end              
end 
final_SSC5(o)=W_SSC;

end

c6= buffer(Column{6},40,20);
for o = 1:C
    W_SSC = 0;
for k = 2:R-1
    
    temp2 = (c6(k,o)-c6(k-1,o))*(c6(k,o)-c6(k+1,o));
    if temp2 > 0
        W_SSC = W_SSC+1;
    end              
end 
final_SSC6(o)=W_SSC;

end

c7 = buffer(Column{5},40,20);
for o = 1:C
    W_SSC = 0;
for k = 2:R-1
    
    temp2 = (c7(k,o)-c7(k-1,o))*(c7(k,o)-c7(k+1,o));
    if temp2 > 0
        W_SSC = W_SSC+1;
    end              
end 
final_SSC7(o)=W_SSC;

end

c8 = buffer(Column{8},40,20);
for o = 1:C
    W_SSC = 0;
for k = 2:R-1
    
    temp2 = (c8(k,o)-c8(k-1,o))*(c8(k,o)-c8(k+1,o));
    if temp2 > 0
        W_SSC = W_SSC+1;
    end              
end 
final_SSC8(o)=W_SSC;

end


allChan = [final_SSC1' final_SSC2' final_SSC3' final_SSC4' final_SSC5' final_SSC6' final_SSC7' final_SSC8'];

SSCoutput = allChan;

