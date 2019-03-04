clc
%calculate the mean across the channels
meanExtension = mean(allLogVar_Extension');
meanFlexion = mean(allLogVar_Flexion');
meanRadial = mean(allLogVar_Radial');
meanUlnar = mean(allLogVar_Ulnar');

%EXTENSION. Extracting the wanted segments of the feature-vectors for the reponding limb positions. 
nedEx = [meanExtension(1:30)';meanExtension(91:120)';meanExtension(181:210)'];
opEx = [meanExtension(31:60)';meanExtension(121:150)';meanExtension(211:240)'];
sideEx = [meanExtension(61:90)';meanExtension(151:180)';meanExtension(241:270)'];

%EXTENSION. Extracting the wanted segments of the movement-vectors for the reponding limb positions.
nedExMov = [allMove_Extension(1:30);allMove_Extension(91:120);allMove_Extension(181:210)];
opExMov = [allMove_Extension(31:60);allMove_Extension(121:150);allMove_Extension(211:240)];
sideExMov = [allMove_Extension(61:90);allMove_Extension(151:180);allMove_Extension(241:270)];

nedExR2 = fitlm(nedEx,nedExMov)
opExR2 = fitlm(opExMov,opEx)
sideExR2 = fitlm(sideExMov,sideEx)

%FLEXION. Extracting the wanted segments of the feature-vectors for the reponding limb positions.
nedFlex = [meanFlexion(1:30)';meanFlexion(91:120)';meanFlexion(181:210)'];
opFlex = [meanFlexion(31:60)';meanFlexion(121:150)';meanFlexion(211:240)'];
sideFlex = [meanFlexion(61:90)';meanFlexion(151:180)';meanFlexion(241:270)'];

%FLEXION. Extracting the wanted segments of the movement-vectors for the reponding limb positions.
nedFlexMov = [allMove_Flexion(1:30);allMove_Flexion(91:120);allMove_Flexion(181:210)];
opFlexMov = [allMove_Flexion(31:60);allMove_Flexion(121:150);allMove_Flexion(211:240)];
sideFlexMov = [allMove_Flexion(61:90);allMove_Flexion(151:180);allMove_Flexion(241:270)];

fitlm(nedFlexMov,nedFlex)
fitlm(opFlexMov,opFlex)
fitlm(sideFlexMov,sideFlex)

%RADIAL DEV. Extracting the wanted segments of the feature-vectors for the reponding limb positions.
nedRad = [meanRadial(1:30)';meanRadial(91:120)';meanRadial(181:210)'];
opRad = [meanRadial(31:60)';meanRadial(121:150)';meanRadial(211:240)'];
sideRad = [meanRadial(61:90)';meanRadial(151:180)';meanRadial(241:270)'];

%RADIAL DEV. Extracting the wanted segments of the movement-vectors for the reponding limb positions.
nedRadMov = [allMove_Radial(1:30);allMove_Radial(91:120);allMove_Radial(181:210)];
opRadMov = [allMove_Radial(31:60);allMove_Radial(121:150);allMove_Radial(211:240)];
sideRadMov = [allMove_Radial(61:90);allMove_Radial(151:180);allMove_Radial(241:270)];

fitlm(nedRadMov,nedRad)
fitlm(opRadMov,opRad)
fitlm(sideRadMov,sideRad)

%ULNAR DEV. Extracting the wanted segments of the feature-vectors for the reponding limb positions.
nedUl = [meanUlnar(1:30)';meanUlnar(91:120)';meanUlnar(181:210)'];
opUl = [meanUlnar(31:60)';meanUlnar(121:150)';meanUlnar(211:240)'];
sideUl = [meanUlnar(61:90)';meanUlnar(151:180)';meanUlnar(241:270)'];

%ULNAR DEV. Extracting the wanted segments of the movement-vectors for the reponding limb positions.
nedUlMov = [allMove_Ulnar(1:30);allMove_Ulnar(91:120);allMove_Ulnar(181:210)];
opUlMov = [allMove_Ulnar(31:60);allMove_Ulnar(121:150);allMove_Ulnar(211:240)];
sideUlMov = [allMove_Ulnar(61:90);allMove_Ulnar(151:180);allMove_Ulnar(241:270)];

fitlm(nedUlMov,nedUl)
fitlm(opUlMov,opUl)
fitlm(sideUlMov,sideUl)

%EXTENSION. Plotting
figure(1)
scatter(nedEx,nedExMov,10,'filled','g')
hold on
scatter(opEx,opExMov,10,'filled','r')
scatter(sideEx,sideExMov,10,'filled','c')
ylabel('Normalized EMG intensity')
xlabel('Feature intensity')
legend('Down','Up','Side','Location','southeast')
legend('boxoff')
title('Extension')

%FLEXION. Plotting
figure(2)
scatter(nedFlex,nedFlexMov,10,'filled','g')
hold on
scatter(opFlex,opFlexMov,10,'filled','r')
scatter(sideFlex,sideFlexMov,10,'filled','c')
ylabel('Normalized EMG intensity')
xlabel('Feature intensity')
legend('Down','Up','Side','Location','southeast')
legend('boxoff')
title('Flexion')

%RADIAL DEV. Plotting
figure(3)
scatter(nedRad,nedRadMov,10,'filled','g')
hold on
scatter(opRad,opRadMov,10,'filled','r')
scatter(sideRad,sideRadMov,10,'filled','c')
ylabel('Normalized EMG intensity')
xlabel('Feature intensity')
legend('Down','Up','Side','Location','southeast')
legend('boxoff')
title('Radial deviation')

%ULNAR DEV. Plotting
figure(4)
scatter(nedUl,nedUlMov,10,'filled','g')
hold on
scatter(opUl,opUlMov,10,'filled','r')
scatter(sideUl,sideUlMov,10,'filled','c')
ylabel('Normalized EMG intensity')
xlabel('Feature intensity')
legend('Down','Up','Side','Location','southeast')
legend('boxoff')
title('Ulnar deviation')