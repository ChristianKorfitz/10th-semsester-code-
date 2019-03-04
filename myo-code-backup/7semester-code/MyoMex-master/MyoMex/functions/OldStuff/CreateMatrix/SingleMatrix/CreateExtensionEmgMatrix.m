start = 801;
ending = 1400;

E_extension30 = [DE_EmgData30(start:ending,:); FE_EmgData30(start:ending,:); SE_EmgData30(start:ending,:)];
E_extension50 = [DE_EmgData50(start:ending,:); FE_EmgData50(start:ending,:); SE_EmgData50(start:ending,:)];
E_extension80 = [DE_EmgData80(start:ending,:); FE_EmgData80(start:ending,:); SE_EmgData80(start:ending,:)];

allE_Extension = [E_extension30; E_extension50; E_extension80];
save('allE_Extension','allE_Extension')