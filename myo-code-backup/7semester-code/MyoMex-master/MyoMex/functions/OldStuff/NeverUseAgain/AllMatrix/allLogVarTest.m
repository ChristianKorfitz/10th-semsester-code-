k1 = featureExtractionLogVar(allE_Extension(1:600,:));
k2 = featureExtractionLogVar(allE_Extension(601:1200,:));
k3 = featureExtractionLogVar(allE_Extension(1201:1800,:));

allLogVar_Extension = [k1;k2;k3];

k1 = featureExtractionLogVar(allE_Flexion(1:600,:));
k2 = featureExtractionLogVar(allE_Flexion(601:1200,:));
k3 = featureExtractionLogVar(allE_Flexion(1201:1800,:));

allLogVar_Flexion = [k1;k2;k3];

k1 = featureExtractionLogVar(allE_Radial(1:600,:));
k2 = featureExtractionLogVar(allE_Radial(601:1200,:));
k3 = featureExtractionLogVar(allE_Radial(1201:1800,:));

allLogVar_Radial = [k1;k2;k3];

k1 = featureExtractionLogVar(allE_Ulnar(1:600,:));
k2 = featureExtractionLogVar(allE_Ulnar(601:1200,:));
k3 = featureExtractionLogVar(allE_Ulnar(1201:1800,:));

allLogVar_Ulnar = [k1;k2;k3];

save('allLogVar_Extension.mat','allLogVar_Extension')
save('allLogVar_Flexion.mat','allLogVar_Flexion')
save('allLogVar_Radial.mat','allLogVar_Radial')
save('allLogVar_Ulnar.mat','allLogVar_Ulnar')