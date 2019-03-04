function [CR1,OS1,PE1,SD1,TP1,CR2,OS2,PE2,SD2,TP2,trainResult1,trainResult2] = plotGroup(doPlot)

%% Test Group:
CR1 = [];
OS1 = [];
PE1 = [];
SD1 = [];
TP1 = [];
group = 1;
trainResult1 = [];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Agnete',group);
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Aske',group);
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Christian U',group);
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Mads',group); %Måske exclude [1 1 0 1]
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Martin AG',group);
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Nick',group); %Måske exclude [0 2 mange]
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Niels',group); %Måske exclude [2 3 3 0]
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Oliver TD',group);
trainResult1 = [trainResult1;dingThing];
CR1 = [CR1, CR];
OS1 = [OS1, OS];
PE1 = [PE1, PE];
SD1 = [SD1, SD];
TP1 = [TP1, TP];

L = length(CR1);
i = 1;

OS1 = [OS1(:,[1 2 3 5 8])];

%% Control Group:
CR2 = [];
OS2 = [];
PE2 = [];
SD2 = [];
TP2 = [];
group = 2;
trainResult2 = [];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Ardalan',group);
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Christian KM',group);
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Ignas',group); %Måske exclude [1 1 0 4]
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Jakob',group);
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Mads K',group); %Måske exclude [0 3 mange lidt mindre]
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Martin S',group); %Måske exclude [3 0 4 1]
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Svidt',group);
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

[CR,~,OS,PE,SD,TP,dingThing] = genTestMatrix('Toby W',group);
trainResult2 = [trainResult2;dingThing];
CR2 = [CR2, CR];
OS2 = [OS2, OS];
PE2 = [PE2, PE];
SD2 = [SD2, SD];
TP2 = [TP2, TP];

L = length(CR2);
i = 1;

OS2 = [OS2(:,[1 2 4 7 8])]

if doPlot == 1

    MIN = 1;
    MAX = 4;
    
    err1 = 100*std(CR1');
    err2 = 100*std(CR2');
    %Plotting stuff
    figure;
    errorbar([1.05 2.05 3.05 4.05],100*mean(CR1,2),err1,'-o','color','r');
    hold on;
    errorbar([0.95 1.95 2.95 3.95],100*mean(CR2,2),err2,'-o','color','b');
    legend('Test Group','Control Group');
    ylabel('Completion Rate in %','fontsize',15);
    xlabel('Test Number','fontsize',15);
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Completion Rate','fontsize',18)

    err1 = std(OS1');
    err2 = std(OS2');
    figure;
    errorbar([1.05 2.05 3.05 4.05],mean(OS1,2),err1,'-o','color','r');
    hold on;
    errorbar([0.95 1.95 2.95 3.95],mean(OS2,2),err2,'-o','color','b');
    legend('Test Group','Control Group');
    ylabel('Overshoots','fontsize',15);
    xlabel('Test Number','fontsize',15);
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Overshoot','fontsize',18)

    err1 = 100*std(PE1');
    err2 = 100*std(PE2');
    figure;
    errorbar([1.05 2.05 3.05 4.05],100*mean(PE1,2),err1,'-o','color','r');
    hold on;
    errorbar([0.95 1.95 2.95 3.95],100*mean(PE2,2),err2,'-o','color','b');
    legend('Test Group','Control Group');
    ylabel('Path Efficiency in %','fontsize',15);
    xlabel('Test Number','fontsize',15);
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Path Efficiency','fontsize',18)

    err1 = std(SD1');
    err2 = std(SD2');
    figure;
    errorbar([1.05 2.05 3.05 4.05],mean(SD1,2),err1,'-o','color','r');
    hold on;
    errorbar([0.95 1.95 2.95 3.95],mean(SD2,2),err2,'-o','color','b');
    legend('Test Group','Control Group');
    ylabel('Stopping Distance','fontsize',15);
    xlabel('Test Number','fontsize',15);
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Stopping Distance','fontsize',18)

    err1 = std(TP1');
    err2 = std(TP2');
    figure;
    errorbar([1.05 2.05 3.05 4.05],mean(TP1,2),err1,'-o','color','r');
    hold on;
    errorbar([0.95 1.95 2.95 3.95],mean(TP2,2),err2,'-o','color','b');
    legend('Test Group','Control Group');
    ylabel('Throughput','fontsize',15);
    xlabel('Test Number','fontsize',15);
    xlim([MIN-0.25 MAX+0.25]); set(gca,'XTick',[MIN : 1 : MAX]);
    title('Throughput','fontsize',18);
end
