
%%Extension:

F = 1;
L = 600;

%Extension 30%:
radial30(F:L,1:8) = FDR_EmgData30;
F = F+600;
L = L+600;
radial30(F:L,1:8) = FFR_EmgData30;
F = F+600;
L = L+600;
radial30(F:L,1:8) = FSR_EmgData30;
F = F+600;
L = L+600;

F = 1;
L = 600;

%Extension 50%:
radial50(F:L,1:8) = FDR_EmgData50;
F = F+600;
L = L+600;
radial50(F:L,1:8) = FFR_EmgData50;
F = F+600;
L = L+600;
radial50(F:L,1:8) = FSR_EmgData50;
F = F+600;
L = L+600;

F = 1;
L = 600;

%Extension 80%:
radial80(F:L,1:8) = FDR_EmgData80;
F = F+600;
L = L+600;
radial80(F:L,1:8) = FFR_EmgData80;
F = F+600;
L = L+600;
radial80(F:L,1:8) = FSR_EmgData80;
F = F+600;
L = L+600;

allRadial(1:1800,1:8) = radial30;
allRadial(1801:3600,1:8) = radial50;
allRadial(3601:5400,1:8) = radial80;