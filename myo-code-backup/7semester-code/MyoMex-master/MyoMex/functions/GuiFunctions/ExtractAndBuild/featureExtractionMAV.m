function [MAVoutput] = featureExtractionMAV(emgData);

for i=1:8
    Column{i} = transpose(emgData(:,[i])); 
end

c1 = buffer(Column{1},40,20);
for j = 1:length(c1(1,:))
    temp = mean(abs(c1(:,j)));
    meabs1(j) = temp;
end 

c2 = buffer(Column{2},40,20);
for k = 1:length(c2(1,:))
    temp1 = mean(abs(c2(:,k)));
    meabs2(k) = temp1;
end 

c3 = buffer(Column{3},40,20);
for l = 1:length(c3(1,:))
    temp2 = mean(abs(c3(:,l)));
    meabs3(l) = temp2;
end 

c4 = buffer(Column{4},40,20);
for m = 1:length(c4(1,:))
    temp3 = mean(abs(c4(:,m)));
    meabs4(m) = temp3;
end 

c5 = buffer(Column{5},40,20);
for n = 1:length(c5(1,:))
    temp4 = mean(abs(c5(:,n)));
    meabs5(n) = temp4;
end 

c6 = buffer(Column{6},40,20);
for o = 1:length(c6(1,:))
    temp5 = mean(abs(c6(:,o)));
    meabs6(o) = temp5;
end 

c7 = buffer(Column{7},40,20);
for p = 1:length(c7(1,:))
    temp6 = mean(abs(c7(:,p)));
    meabs7(p) = temp6;
end 

c8 = buffer(Column{8},40,20);
for q = 1:length(c8(1,:))
    temp7 = mean(abs(c8(:,q)));
    meabs8(q) = temp7;
end 

allChan = [meabs1' meabs2' meabs3' meabs4' meabs5' meabs6' meabs7' meabs8'];


MAVoutput = allChan;
