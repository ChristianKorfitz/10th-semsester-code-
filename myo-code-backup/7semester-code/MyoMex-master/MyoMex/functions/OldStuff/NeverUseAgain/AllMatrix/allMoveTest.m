%%Input is MAV - We'll explain that somewhere! You also need all the MVC's
%%to be loaded in order to run this garbage script :)

k1 = featureExtractionMove(allMav_Extension(1:30,:),DE_MVC);
k2 = featureExtractionMove(allMav_Extension(31:60,:),FE_MVC);
k3 = featureExtractionMove(allMav_Extension(61:90,:),SE_MVC);

allMove_Extension = [k1;k2;k3];
allMove_Extension = [allMove_Extension; ones(270,1)*0];

k1 = featureExtractionMove(allMav_Flexion(1:30,:),DF_MVC);
k2 = featureExtractionMove(allMav_Flexion(31:60,:),FF_MVC);
k3 = featureExtractionMove(allMav_Flexion(61:90,:),SF_MVC);

allMove_Flexion = [k1;k2;k3];
allMove_Flexion = [allMove_Flexion; ones(270,1)*0];

k1 = featureExtractionMove(allMav_Radial(1:30,:),DR_MVC);
k2 = featureExtractionMove(allMav_Radial(31:60,:),FR_MVC);
k3 = featureExtractionMove(allMav_Radial(61:90,:),SR_MVC);

allMove_Radial = [k1;k2;k3];
allMove_Radial = [allMove_Radial; ones(270,1)*0];

k1 = featureExtractionMove(allMav_Ulnar(1:30,:),DU_MVC);
k2 = featureExtractionMove(allMav_Ulnar(31:60,:),FU_MVC);
k3 = featureExtractionMove(allMav_Ulnar(61:90,:),SU_MVC);

allMove_Ulnar = [k1;k2;k3];
allMove_Ulnar = [allMove_Ulnar; ones(270,1)*0];

save('allMove_Extension.mat','allMove_Extension')
save('allMove_Flexion.mat','allMove_Flexion')
save('allMove_Radial.mat','allMove_Radial')
save('allMove_Ulnar.mat','allMove_Ulnar')