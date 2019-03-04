function [CR1Dif,OS1Dif,PE1Dif,SD1Dif,TP1Dif,CR2Dif,OS2Dif,PE2Dif,SD2Dif,TP2Dif] ...
    = improvementBetweenSessions(CR1,OS1,PE1,SD1,TP1,CR2,OS2,PE2,SD2,TP2,doPlot)

CR1Dif = [CR1(1,:)-CR1(2,:);CR1(2,:)-CR1(3,:);CR1(3,:)-CR1(4,:);CR1(1,:)-CR1(4,:)];
CR2Dif = [CR2(1,:)-CR2(2,:);CR2(2,:)-CR2(3,:);CR2(3,:)-CR2(4,:);CR2(1,:)-CR2(4,:)];
OS1Dif = [OS1(1,:)-OS1(2,:);OS1(2,:)-OS1(3,:);OS1(3,:)-OS1(4,:);OS1(1,:)-OS1(4,:)];
OS2Dif = [OS2(1,:)-OS2(2,:);OS2(2,:)-OS2(3,:);OS2(3,:)-OS2(4,:);OS2(1,:)-OS2(4,:)];
PE1Dif = [PE1(1,:)-PE1(2,:);PE1(2,:)-PE1(3,:);PE1(3,:)-PE1(4,:);PE1(1,:)-PE1(4,:)];
PE2Dif = [PE2(1,:)-PE2(2,:);PE2(2,:)-PE2(3,:);PE2(3,:)-PE2(4,:);PE2(1,:)-PE2(4,:)];
SD1Dif = [SD1(1,:)-SD1(2,:);SD1(2,:)-SD1(3,:);SD1(3,:)-SD1(4,:);SD1(1,:)-SD1(4,:)];
SD2Dif = [SD2(1,:)-SD2(2,:);SD2(2,:)-SD2(3,:);SD2(3,:)-SD2(4,:);SD2(1,:)-SD2(4,:)];
TP1Dif = [TP1(1,:)-TP1(2,:);TP1(2,:)-TP1(3,:);TP1(3,:)-TP1(4,:);TP1(1,:)-TP1(4,:)];
TP2Dif = [TP2(1,:)-TP2(2,:);TP2(2,:)-TP2(3,:);TP2(3,:)-TP2(4,:);TP2(1,:)-TP2(4,:)];

if doPlot == 1

    MIN = 1;
    MAX = 4;
    
    err1 = 100*std(CR1Dif');
    err2 = 100*std(CR1Dif');
    figure;
    plot([1.05 2.05 3.05 4.05],100*mean(CR1Dif,2),'-o','LineStyle','none','color','r');
    hold on;
    plot([0.95 1.95 2.95 3.95],100*mean(CR2Dif,2),'-o','LineStyle','none','color','b');
    errorbar([1.05 2.05 3.05 4.05],100*mean(CR1Dif,2),err1,'.','color','r');
    errorbar([0.95 1.95 2.95 3.95],100*mean(CR2Dif,2),err2,'.','color','b');
    legend('Test Group','Control Group');
    ylabel('Change In Completion Rate','fontsize',15);
    xlabel('Test Number','fontsize',15);
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    xticklabels({'1-2','2-3','3-4','1-4'});
    title('Completion Rate - Change Between Tests','fontsize',18)

    err1 = std(OS1Dif');
    err2 = std(OS2Dif');
    figure;
    plot([1.05 2.05 3.05 4.05],mean(OS1Dif,2),'-o','LineStyle','none','color','r');
    hold on;
    plot([0.95 1.95 2.95 3.95],mean(OS2Dif,2),'-o','LineStyle','none','color','b');
    errorbar([1.05 2.05 3.05 4.05],mean(OS1Dif,2),err1,'.','color','r');
    errorbar([0.95 1.95 2.95 3.95],mean(OS2Dif,2),err2,'.','color','b')
    legend('Test Group','Control Group');
    ylabel('Change In Overshoots','fontsize',15);
    xlabel('Test Number','fontsize',15);
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    xticklabels({'1-2','2-3','3-4','1-4'});
    title('Overshoot - Change Between Tests','fontsize',18)

    err1 = 100*std(PE1Dif');
    err2 = 100*std(PE2Dif');
    figure;
    plot([1.05 2.05 3.05 4.05],100*mean(PE1Dif,2),'-o','LineStyle','none','color','r');
    hold on;
    plot([0.95 1.95 2.95 3.95],100*mean(PE2Dif,2),'-o','LineStyle','none','color','b');
    errorbar([1.05 2.05 3.05 4.05],100*mean(PE1Dif,2),err1,'.','color','r');
    errorbar([0.95 1.95 2.95 3.95],100*mean(PE2Dif,2),err2,'.','color','b')
    legend('Test Group','Control Group');
    ylabel('Change In Path Efficiency','fontsize',15);
    xlabel('Test Number','fontsize',15);
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    xticklabels({'1-2','2-3','3-4','1-4'});
    title('Path Efficiency - Change Between Tests','fontsize',18)

    err1 = std(SD1Dif');
    err2 = std(SD1Dif');
    figure;
    plot([1.05 2.05 3.05 4.05],mean(SD1Dif,2),'-o','LineStyle','none','color','r');
    hold on;
    plot([0.95 1.95 2.95 3.95],mean(SD2Dif,2),'-o','LineStyle','none','color','b');
    errorbar([1.05 2.05 3.05 4.05],mean(SD1Dif,2),err1,'.','color','r');
    errorbar([0.95 1.95 2.95 3.95],mean(SD2Dif,2),err2,'.','color','b')
    legend('Test Group','Control Group');
    ylabel('Change In Stopping Distance','fontsize',15);
    xlabel('Test Number','fontsize',15);
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    xticklabels({'1-2','2-3','3-4','1-4'});
    title('Stopping Distance - Change Between Tests','fontsize',18)

    err1 = std(TP1Dif');
    err2 = std(TP2Dif');
    figure;
    plot([1.05 2.05 3.05 4.05],mean(TP1Dif,2),'-o','LineStyle','none','color','r');
    hold on;
    plot([0.95 1.95 2.95 3.95],mean(TP2Dif,2),'-o','LineStyle','none','color','b');
    errorbar([1.05 2.05 3.05 4.05],mean(TP1Dif,2),err1,'.','color','r');
    errorbar([0.95 1.95 2.95 3.95],mean(TP2Dif,2),err2,'.','color','b')
    legend('Test Group','Control Group');
    ylabel('Change In Throughput','fontsize',15);
    xlabel('Test Number','fontsize',15);
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    xticklabels({'1-2','2-3','3-4','1-4'});
    title('Throughput - Change Between Tests','fontsize',18);
end