
%%Radial:

K = 600;
F = 1;
L = 600;

%Radial 30%:
E_radial30(F:L,1:8) = DR_EmgData30(801:1400,:);
F = F+L;
L = L+L;
E_radial30(F:L,1:8) = FR_EmgData30(801:1400,:);
F = F+K;
L = L+K;
E_radial30(F:L,1:8) = SR_EmgData30(801:1400,:);
F = F+K;
L = L+K;

F = 1;
L = K;

%Radial 50%:
E_radial50(F:L,1:8) = DR_EmgData50(801:1400,:);
F = F+K;
L = L+K;
E_radial50(F:L,1:8) = FR_EmgData50(801:1400,:);
F = F+K;
L = L+K;
E_radial50(F:L,1:8) = SR_EmgData50(801:1400,:);
F = F+K;
L = L+K;

F = 1;
L = K;

%Radial 80%:
E_radial80(F:L,1:8) = DR_EmgData80(801:1400,:);
F = F+K;
L = L+K;
E_radial80(F:L,1:8) = FR_EmgData80(801:1400,:);
F = F+K;
L = L+K;
E_radial80(F:L,1:8) = SR_EmgData80(801:1400,:);
F = F+K;
L = L+K;

allE_Radial(1:1800,1:8) = E_radial30;
allE_Radial(1801:3600,1:8) = E_radial50;
allE_Radial(3601:5400,1:8) = E_radial80;