%%Input is MAV - We'll explain that somewhere! You also need all the MVC's
%%to be loaded in order to run this garbage script :)

k1 = featureExtractionMove(allMav_Extension(1:30,:),DE_MVC);
k2 = featureExtractionMove(allMav_Extension(31:60,:),FE_MVC);
k3 = featureExtractionMove(allMav_Extension(61:90,:),SE_MVC);
k4 = featureExtractionMove(allMav_Extension(91:120,:),DE_MVC);
k5 = featureExtractionMove(allMav_Extension(121:150,:),FE_MVC);
k6 = featureExtractionMove(allMav_Extension(151:180,:),SE_MVC);
k7 = featureExtractionMove(allMav_Extension(181:210,:),DE_MVC);
k8 = featureExtractionMove(allMav_Extension(211:240,:),FE_MVC);
k9 = featureExtractionMove(allMav_Extension(241:270,:),SE_MVC);

allMove_Extension = [k1;k2;k3;k4;k5;k6;k7;k8;k9];
allMove_Extension = [allMove_Extension; ones(810,1)*0];

k1 = featureExtractionMove(allMav_Flexion(1:30,:),DF_MVC);
k2 = featureExtractionMove(allMav_Flexion(31:60,:),FF_MVC);
k3 = featureExtractionMove(allMav_Flexion(61:90,:),SF_MVC);
k4 = featureExtractionMove(allMav_Flexion(91:120,:),DF_MVC);
k5 = featureExtractionMove(allMav_Flexion(121:150,:),FF_MVC);
k6 = featureExtractionMove(allMav_Flexion(151:180,:),SF_MVC);
k7 = featureExtractionMove(allMav_Flexion(181:210,:),DF_MVC);
k8 = featureExtractionMove(allMav_Flexion(211:240,:),FF_MVC);
k9 = featureExtractionMove(allMav_Flexion(241:270,:),SF_MVC);

allMove_Flexion = [k1;k2;k3;k4;k5;k6;k7;k8;k9];
allMove_Flexion = [allMove_Flexion; ones(810,1)*0];

k1 = featureExtractionMove(allMav_Radial(1:30,:),DR_MVC);
k2 = featureExtractionMove(allMav_Radial(31:60,:),FR_MVC);
k3 = featureExtractionMove(allMav_Radial(61:90,:),SR_MVC);
k4 = featureExtractionMove(allMav_Radial(91:120,:),DR_MVC);
k5 = featureExtractionMove(allMav_Radial(121:150,:),FR_MVC);
k6 = featureExtractionMove(allMav_Radial(151:180,:),SR_MVC);
k7 = featureExtractionMove(allMav_Radial(181:210,:),DR_MVC);
k8 = featureExtractionMove(allMav_Radial(211:240,:),FR_MVC);
k9 = featureExtractionMove(allMav_Radial(241:270,:),SR_MVC);

allMove_Radial = [k1;k2;k3;k4;k5;k6;k7;k8;k9];
allMove_Radial = [allMove_Radial; ones(810,1)*0];

k1 = featureExtractionMove(allMav_Ulnar(1:30,:),DU_MVC);
k2 = featureExtractionMove(allMav_Ulnar(31:60,:),FU_MVC);
k3 = featureExtractionMove(allMav_Ulnar(61:90,:),SU_MVC);
k4 = featureExtractionMove(allMav_Ulnar(91:120,:),DU_MVC);
k5 = featureExtractionMove(allMav_Ulnar(121:150,:),FU_MVC);
k6 = featureExtractionMove(allMav_Ulnar(151:180,:),SU_MVC);
k7 = featureExtractionMove(allMav_Ulnar(181:210,:),DU_MVC);
k8 = featureExtractionMove(allMav_Ulnar(211:240,:),FU_MVC);
k9 = featureExtractionMove(allMav_Ulnar(241:270,:),SU_MVC);

allMove_Ulnar = [k1;k2;k3;k4;k5;k6;k7;k8;k9];
allMove_Ulnar = [allMove_Ulnar; ones(810,1)*0];

save('allMove_Extension.mat','allMove_Extension')
save('allMove_Flexion.mat','allMove_Flexion')
save('allMove_Radial.mat','allMove_Radial')
save('allMove_Ulnar.mat','allMove_Ulnar')