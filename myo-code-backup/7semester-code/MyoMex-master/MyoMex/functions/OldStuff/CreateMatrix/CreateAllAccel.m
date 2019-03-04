
%%Extension:

ADE_AccelData30 = repelem(DE_AccelData30,20,1);
AFE_AccelData30 = repelem(FE_AccelData30,20,1);
ASE_AccelData30 = repelem(SE_AccelData30,20,1);

ADE_AccelData50 = repelem(DE_AccelData50,20,1);
AFE_AccelData50 = repelem(FE_AccelData50,20,1);
ASE_AccelData50 = repelem(SE_AccelData50,20,1);

ADE_AccelData80 = repelem(DE_AccelData80,20,1);
AFE_AccelData80 = repelem(FE_AccelData80,20,1);
ASE_AccelData80 = repelem(SE_AccelData80,20,1);

%Extension 30%:
A_extension30 = [accelStuff(ADE_AccelData30(801:1400,:)); accelStuff(AFE_AccelData30(801:1400,:)); accelStuff(ASE_AccelData30(801:1400,:))]

%Extension 50%:
A_extension50 = [accelStuff(ADE_AccelData50(801:1400,:)); accelStuff(AFE_AccelData50(801:1400,:)); accelStuff(ASE_AccelData50(801:1400,:))];

%Extension 80%:
A_extension80 = [accelStuff(ADE_AccelData80(801:1400,:)); accelStuff(AFE_AccelData80(801:1400,:)); accelStuff(ASE_AccelData80(801:1400,:))];

allA_Extension = [A_extension30; A_extension50; A_extension80];


%%Flexion:

ADF_AccelData30 = repelem(DF_AccelData30,20,1);
AFF_AccelData30 = repelem(FF_AccelData30,20,1);
ASF_AccelData30 = repelem(SF_AccelData30,20,1);

ADF_AccelData50 = repelem(DF_AccelData50,20,1);
AFF_AccelData50 = repelem(FF_AccelData50,20,1);
ASF_AccelData50 = repelem(SF_AccelData50,20,1);

ADF_AccelData80 = repelem(DF_AccelData80,20,1);
AFF_AccelData80 = repelem(FF_AccelData80,20,1);
ASF_AccelData80 = repelem(SF_AccelData80,20,1);

%Flexion 30%:
A_flexion30 = [accelStuff(ADF_AccelData30(801:1400,:)); accelStuff(AFF_AccelData30(801:1400,:)); accelStuff(ASF_AccelData30(801:1400,:))]

%Flexion 50%:
A_flexion50 = [accelStuff(ADF_AccelData50(801:1400,:)); accelStuff(AFF_AccelData50(801:1400,:)); accelStuff(ASF_AccelData50(801:1400,:))];

%Flexion 80%:
A_flexion80 = [accelStuff(ADF_AccelData80(801:1400,:)); accelStuff(AFF_AccelData80(801:1400,:)); accelStuff(ASF_AccelData80(801:1400,:))];

allA_Flexion = [A_flexion30; A_flexion50; A_flexion80];


%%Radial:

ADR_AccelData30 = repelem(DR_AccelData30,20,1);
AFR_AccelData30 = repelem(FR_AccelData30,20,1);
ASR_AccelData30 = repelem(SR_AccelData30,20,1);

ADR_AccelData50 = repelem(DR_AccelData50,20,1);
AFR_AccelData50 = repelem(FR_AccelData50,20,1);
ASR_AccelData50 = repelem(SR_AccelData50,20,1);

ADR_AccelData80 = repelem(DR_AccelData80,20,1);
AFR_AccelData80 = repelem(FR_AccelData80,20,1);
ASR_AccelData80 = repelem(SR_AccelData80,20,1);

%Radial 30%:
A_radial30 = [accelStuff(ADR_AccelData30(801:1400,:)); accelStuff(AFR_AccelData30(801:1400,:)); accelStuff(ASR_AccelData30(801:1400,:))]

%Radial 50%:
A_radial50 = [accelStuff(ADR_AccelData50(801:1400,:)); accelStuff(AFR_AccelData50(801:1400,:)); accelStuff(ASR_AccelData50(801:1400,:))];

%Radial 80%:
A_radial80 = [accelStuff(ADR_AccelData80(801:1400,:)); accelStuff(AFR_AccelData80(801:1400,:)); accelStuff(ASR_AccelData80(801:1400,:))];

allA_Radial = [A_radial30; A_radial50; A_radial80];


%%Ulnar:

ADU_AccelData30 = repelem(DU_AccelData30,20,1);
AFU_AccelData30 = repelem(FU_AccelData30,20,1);
ASU_AccelData30 = repelem(SU_AccelData30,20,1);

ADU_AccelData50 = repelem(DU_AccelData50,20,1);
AFU_AccelData50 = repelem(FU_AccelData50,20,1);
ASU_AccelData50 = repelem(SU_AccelData50,20,1);

ADU_AccelData80 = repelem(DU_AccelData80,20,1);
AFU_AccelData80 = repelem(FU_AccelData80,20,1);
ASU_AccelData80 = repelem(SU_AccelData80,20,1);

%Ulnar 30%:
A_ulnar30 = [accelStuff(ADU_AccelData30(801:1400,:)); accelStuff(AFU_AccelData30(801:1400,:)); accelStuff(ASU_AccelData30(801:1400,:))]

%Ulnar 50%:
A_ulnar50 = [accelStuff(ADU_AccelData50(801:1400,:)); accelStuff(AFU_AccelData50(801:1400,:)); accelStuff(ASU_AccelData50(801:1400,:))];

%Ulnar 80%:
A_ulnar80 = [accelStuff(ADU_AccelData80(801:1400,:)); accelStuff(AFU_AccelData80(801:1400,:)); accelStuff(ASU_AccelData80(801:1400,:))];

allA_Ulnar = [A_ulnar30; A_ulnar50; A_ulnar80];

allAccel = [allA_Extension; allA_Flexion; allA_Radial; allA_Ulnar];

save('allA_Extension.mat','allA_Extension');
save('allA_Flexion.mat','allA_Flexion');
save('allA_Radial.mat','allA_Radial');
save('allA_Ulnar.mat','allA_Ulnar');
save('allAccel.mat','allAccel');