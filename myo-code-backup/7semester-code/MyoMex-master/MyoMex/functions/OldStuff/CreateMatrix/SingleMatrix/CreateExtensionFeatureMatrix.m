
%%Extension:

F = 1;
L = 600;

%Extension 30%:
extension30(F:L,1:8) = FDE_EmgData30;
F = F+600;
L = L+600;
extension30(F:L,1:8) = FFE_EmgData30;
F = F+600;
L = L+600;
extension30(F:L,1:8) = FSE_EmgData30;
F = F+600;
L = L+600;

F = 1;
L = 600;

%Extension 50%:
extension50(F:L,1:8) = FDE_EmgData50;
F = F+600;
L = L+600;
extension50(F:L,1:8) = FFE_EmgData50;
F = F+600;
L = L+600;
extension50(F:L,1:8) = FSE_EmgData50;
F = F+600;
L = L+600;

F = 1;
L = 600;

%Extension 80%:
extension80(F:L,1:8) = FDE_EmgData80;
F = F+600;
L = L+600;
extension80(F:L,1:8) = FFE_EmgData80;
F = F+600;
L = L+600;
extension80(F:L,1:8) = FSE_EmgData80;
F = F+600;
L = L+600;

allExtension(1:1800,1:8) = extension30;
allExtension(1801:3600,1:8) = extension50;
allExtension(3601:5400,1:8) = extension80;