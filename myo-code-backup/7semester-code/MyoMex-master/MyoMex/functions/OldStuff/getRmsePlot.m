function getRmsePlot(RMSEMav,RMSELogVar)

std_Mav = std(RMSEMav);
std_Log = std(RMSELogVar);

stdOverall_Mav = std(RMSEMav(:))
stdOverall_Log = std(RMSELogVar(:))

mean_Mav = mean(RMSEMav);
mean_Log = mean(RMSELogVar);

meanOverall_Mav = mean(RMSEMav(:))
meanOverall_Log = mean(RMSELogVar(:))

std_matrix = [std_Mav, stdOverall_Mav, std_Log, stdOverall_Log]

mean_matrix = [mean_Mav, meanOverall_Mav, mean_Log, meanOverall_Log]


figure;
subplot(1,2,1);
hold on;
bar(1:5,mean_matrix(:,1:5));
errorbar(1:5,mean_matrix(:,1:5),std_matrix(:,1:5),'.');
somenames = {'','Extension','Flexion','Radial','Ulnar','Overall',''};
set(gca,'xticklabel',somenames);
ylabel('Error')
title('RMSE for MAV regressor')
ylim([0 0.3])
hold off;

subplot(1,2,2);
hold on;
bar(6:10,mean_matrix(:,6:10));
errorbar(6:10,mean_matrix(:,6:10),std_matrix(:,6:10),'.');
somenames2 = {'','Extension','Flexion','Radial','Ulnar','Overall',''}
set(gca,'xticklabel',somenames2);
title('RMSE for LogVar regressor')
ylim([0 0.3])
ylabel('Error')