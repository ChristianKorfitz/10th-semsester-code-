start = 801;
ending = 1400;

E_extension30 = [DE_EmgData30(start:ending,:); FE_EmgData30(start:ending,:); SE_EmgData30(start:ending,:)];
E_extension50 = [DE_EmgData50(start:ending,:); FE_EmgData50(start:ending,:); SE_EmgData50(start:ending,:)];
E_extension80 = [DE_EmgData80(start:ending,:); FE_EmgData80(start:ending,:); SE_EmgData80(start:ending,:)];

allE_Extension = [E_extension30; E_extension50; E_extension80];
save('allE_Extension.mat','allE_Extension');

start = 801;
ending = 1400;

E_flexion30 = [DF_EmgData30(start:ending,:); FF_EmgData30(start:ending,:); SF_EmgData30(start:ending,:)];
E_flexion50 = [DF_EmgData50(start:ending,:); FF_EmgData50(start:ending,:); SF_EmgData50(start:ending,:)];
E_flexion80 = [DF_EmgData80(start:ending,:); FF_EmgData80(start:ending,:); SF_EmgData80(start:ending,:)];

allE_Flexion = [E_flexion30; E_flexion50; E_flexion80];
save('allE_Flexion.mat','allE_Flexion');

start = 801;
ending = 1400;

E_ulnar30 = [DU_EmgData30(start:ending,:); FU_EmgData30(start:ending,:); SU_EmgData30(start:ending,:)];
E_ulnar50 = [DU_EmgData50(start:ending,:); FU_EmgData50(start:ending,:); SU_EmgData50(start:ending,:)];
E_ulnar80 = [DU_EmgData80(start:ending,:); FU_EmgData80(start:ending,:); SU_EmgData80(start:ending,:)];

allE_Ulnar = [E_ulnar30; E_ulnar50; E_ulnar80];
save('allE_Ulnar','allE_Ulnar')

start = 801;
ending = 1400;

E_radial30 = [DR_EmgData30(start:ending,:); FR_EmgData30(start:ending,:); SR_EmgData30(start:ending,:)];
E_radial50 = [DR_EmgData50(start:ending,:); FR_EmgData50(start:ending,:); SR_EmgData50(start:ending,:)];
E_radial80 = [DR_EmgData80(start:ending,:); FR_EmgData80(start:ending,:); SR_EmgData80(start:ending,:)];

allE_Radial = [E_radial30; E_radial50; E_radial80];
save('allE_Radial','allE_Radial')