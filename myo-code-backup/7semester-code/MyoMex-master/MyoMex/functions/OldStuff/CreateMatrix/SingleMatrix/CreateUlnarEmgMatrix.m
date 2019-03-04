
%%Ulnar:
K = 600;
F = 1;
L = 600;

%Ulnar 30%:
E_ulnar30(F:L,1:8) = DU_EmgData30(801:1400,:);
F = F+L;
L = L+L;
E_ulnar30(F:L,1:8) = FU_EmgData30(801:1400,:);
F = F+K;
L = L+K;
E_ulnar30(F:L,1:8) = SU_EmgData30(801:1400,:);
F = F+K;
L = L+K;

F = 1;
L = K;

%Ulnar 50%:
E_ulnar50(F:L,1:8) = DU_EmgData50(801:1400,:);
F = F+K;
L = L+K;
E_ulnar50(F:L,1:8) = FU_EmgData50(801:1400,:);
F = F+K;
L = L+K;
E_ulnar50(F:L,1:8) = SU_EmgData50(801:1400,:);
F = F+K;
L = L+K;

F = 1;
L = 600;

%Ulnar 80%:
E_ulnar80(F:L,1:8) = DU_EmgData80(801:1400,:);
F = F+K;
L = L+K;
E_ulnar80(F:L,1:8) = FU_EmgData80(801:1400,:);
F = F+K;
L = L+K;
E_ulnar80(F:L,1:8) = SU_EmgData80(801:1400,:);
F = F+K;
L = L+K;

allE_Ulnar(1:1800,1:8) = E_ulnar30;
allE_Ulnar(1801:3600,1:8) = E_ulnar50;
allE_Ulnar(3601:5400,1:8) = E_ulnar80;