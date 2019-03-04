
%%Flexion:

K = 600;
F = 1;
L = 600;

%Flexion 30%:
E_flexion30(F:L,1:8) = DF_EmgData30(801:1400,:);
F = F+L;
L = L+L;
E_flexion30(F:L,1:8) = FF_EmgData30(801:1400,:);
F = F+K;
L = L+K;
E_flexion30(F:L,1:8) = SF_EmgData30(801:1400,:);
F = F+K;
L = L+K;

F = 1;
L = K;

%Flexion 50%:
E_flexion50(F:L,1:8) = DF_EmgData50(801:1400,:);
F = F+K;
L = L+K;
E_flexion50(F:L,1:8) = FF_EmgData50(801:1400,:);
F = F+K;
L = L+K;
E_flexion50(F:L,1:8) = SF_EmgData50(801:1400,:);
F = F+K;
L = L+K;

F = 1;
L = K;

%Flexion 80%:
E_flexion80(F:L,1:8) = DF_EmgData80(801:1400,:);
F = F+K;
L = L+K;
E_flexion80(F:L,1:8) = FF_EmgData80(801:1400,:);
F = F+K;
L = L+K;
E_flexion80(F:L,1:8) = SF_EmgData80(801:1400,:);
F = F+K;
L = L+K;

allE_Flexion(1:1800,1:8) = E_flexion30;
allE_Flexion(1801:3600,1:8) = E_flexion50;
allE_Flexion(3601:5400,1:8) = E_flexion80;