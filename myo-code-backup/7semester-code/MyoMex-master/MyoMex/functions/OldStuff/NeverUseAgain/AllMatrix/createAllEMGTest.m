start = 801;
ending = 1400;

allE_Extension = [DE_TestA50(start:ending,:); FE_TestA50(start:ending,:); SE_TestA50(start:ending,:)];
save('allE_Extension.mat','allE_Extension');

allE_Flexion = [DF_TestA50(start:ending,:); FF_TestA50(start:ending,:); SF_TestA50(start:ending,:)];
save('allE_Flexion.mat','allE_Flexion');

allE_Ulnar = [DU_TestA50(start:ending,:); FU_TestA50(start:ending,:); SU_TestA50(start:ending,:)];

save('allE_Ulnar','allE_Ulnar')

allE_Radial = [DR_TestA50(start:ending,:); FR_TestA50(start:ending,:); SR_TestA50(start:ending,:)];

save('allE_Radial','allE_Radial')