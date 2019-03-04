
%%Extension:

F = 1;
L = 600;

%Extension 30%:
ulnar30(F:L,1:8) = FDU_EmgData30;
F = F+600;
L = L+600;
ulnar30(F:L,1:8) = FFU_EmgData30;
F = F+600;
L = L+600;
ulnar30(F:L,1:8) = FSU_EmgData30;
F = F+600;
L = L+600;

F = 1;
L = 600;

%Extension 50%:
ulnar50(F:L,1:8) = FDU_EmgData50;
F = F+600;
L = L+600;
ulnar50(F:L,1:8) = FFU_EmgData50;
F = F+600;
L = L+600;
ulnar50(F:L,1:8) = FSU_EmgData50;
F = F+600;
L = L+600;

F = 1;
L = 600;

%Extension 80%:
ulnar80(F:L,1:8) = FDU_EmgData80;
F = F+600;
L = L+600;
ulnar80(F:L,1:8) = FFU_EmgData80;
F = F+600;
L = L+600;
ulnar80(F:L,1:8) = FSU_EmgData80;
F = F+600;
L = L+600;

allUlnar(1:1800,1:8) = ulnar30;
allUlnar(1801:3600,1:8) = ulnar50;
allUlnar(3601:5400,1:8) = ulnar80;