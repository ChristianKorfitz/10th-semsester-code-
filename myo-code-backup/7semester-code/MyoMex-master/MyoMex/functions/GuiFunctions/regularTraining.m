% This function retrieves the weighted regression values and plots them in
% the compass plot. This is a training plot which means we don't have any
% targets appearing at all.

function regularTraining(handles,handles2,handles3, m1)
    
    load('ding.mat');
    load('baseline.mat');
    load('MdlLinear.mat');
    load('ExtensionRegression.mat');
    load('FlexionRegression.mat');
    load('RadialRegression.mat');
    load('UlnarRegression.mat');
    load('FistRegression.mat');
    load('StretchRegression.mat');
    
    images(1) = {imread('url.png')};
    images(2) = {imread('url2.png')};
    images(3) = {imread('url3.png')};
    images(4) = {imread('url4.png')};
    images(5) = {imread('url5.png')};
    images(6) = {imread('url6.png')};
    images(7) = {imread('url7.png')};
    images(8) = {imread('3.png')};
    images(9) = {imread('2.png')};
    images(10) = {imread('1.png')};
    images(11) = {imread('url8.png')};
    
    pause(0.1);

    plothandle = handles;
    imagehandle = handles2;
    barhandle = handles3;

    if ~isempty(plothandle)
        cla(plothandle);        
        axes(plothandle)
        axis on;
        axis auto;
        whyTho = [1 1 1 1 1 1 1];
        someBars = bar(plothandle, whyTho, 'b');
        ylabel('Confidence Score in %');
        xlabel('');
        ylim([0 100]);
        str = {' ',' ',' ',' ',' ',' ',' '};
        set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
        hold on;
        
        cla(barhandle);
        axes(barhandle);
        axis on;
        axis auto;
        someOtherBars = barh(barhandle, [100], 'b');
        ylabel('');
        xlabel('');
        xlim([0 100]);
        ylim([0 2]);
        hold on;
        
        axes(imagehandle);
        curImg = cell2mat(images(1));
        image(curImg);
        axis off;
        axis image;
        
        %Setup for later use. Do NOT change it unless you want to fix it
        %after you screw it up.
        
        classVal = [0 0 0 0 0 0 0 ; 0 0 0 0 0 0 0];
        buffer1 = 0;
        buffer2 = 0;
        tresVal = 0.15
        RV = [0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0];
        time = 0;
        windowSize = 40;
        maxTime = 720;
        moveTime = 40;
        pauseTime = 10;
        thisTime = -10;
        stopNow = 0;
        startTime = 0;
        gotIt = 0;
        i = 1;
        j = 1;
        numLvl = rot90([0.14 0.34 0.54 0.74; 0.26 0.46 0.66 0.86],2);
        strLvl = numLvl*100;
        lim4green = [numLvl(1,1),numLvl(2,1)];
        axes(barhandle);
        minLine = line([74 74],[-1 4]);
        maxLine = line([86 86],[-1 4]);        
        set(minLine,'XData',[strLvl(1,j) strLvl(1,j)],...
                                'YData',[-1 3]);
        set(maxLine,'XData',[strLvl(2,j) strLvl(2,j)],...
            'YData',[-1 3]);
        randomOrder = randperm(6);
        stayStable = zeros(6,4);
        stableTime = zeros(6,4);
        gotBlue = 0;
        
        axes(imagehandle);
        curImg = cell2mat(images(randomOrder(i)));
        image(curImg);
        axis off;
        axis image;
        
        %Makes sure we'll record for the stated 'recordingTime'
        while stopNow ~= 1
            
            %This has been stolen from MyoMex to retrieve data:
            timeEMG = m1.timeEMG_log;
            if ~isempty(timeEMG)
                iiEMG = find(timeEMG>=(timeEMG(end)-2));
                tEMG = timeEMG(iiEMG);
                EmgMatrix(iiEMG,:) = m1.emg_log(iiEMG,:);
                lastSample = max(iiEMG);
                timeIMU = m1.timeIMU_log;
                iiIMU = find(timeIMU>=(timeIMU(end)-2));
                %First window:
                if lastSample >= windowSize && buffer1 >= windowSize
                    
                    %Gets the time we've recorded EMG in this function
                    time = m1.timeEMG;
                    
                    if time-thisTime >= moveTime
                        %Avoids problems with matrixes and stuff. Stay in
                        %the matrix!
                        if i == 6
                            randomOrder = randperm(6);
                            i = 1;
                            j = j+1;
                            if j == 5
                                stopNow = 1;
                                j = 4;
                            end
                        else
                            i = i+1;
                        end
                        
                        if stopNow == 0
                            %Here comes the pause:
                            axes(imagehandle);
                            curImg = cell2mat(images(7));
                            image(curImg);
                            axis off;
                            axis image;
                            set(someBars,'XData',[1 2 3 4 5 6 7],'Ydata',[0 0 0 0 0 0 0]);
                            pause(pauseTime-3);
                            axes(imagehandle);
                            curImg = cell2mat(images(8));
                            image(curImg);
                            axis off;
                            axis image;
                            pause(1);
                            curImg = cell2mat(images(9));
                            image(curImg);
                            axis off;
                            axis image;
                            pause(1);
                            curImg = cell2mat(images(10));
                            image(curImg);
                            axis off;
                            axis image;
                            pause(1);
                        else
                            axes(plothandle);
                            curImg = cell2mat(images(11));
                            imshow(curImg);
                            axis off;
                            axis image;
                            pause(5);
                        end
                        
                        %Then we update the images and stuff!                        
                        axes(imagehandle);
                        curImg = cell2mat(images(randomOrder(i)));
                        image(curImg);
                        axis off;
                        axis image;
                        set(minLine,'XData',[strLvl(1,j) strLvl(1,j)],...
                                'YData',[-1 3]);
                        set(maxLine,'XData',[strLvl(2,j) strLvl(2,j)],...
                            'YData',[-1 3]);
                        lim4green = [numLvl(1,j),numLvl(2,j)];
                        thisTime = time;
                        stayStable(randomOrder(i),j) = 0;
                        stableTime(randomOrder(i),j) = 0;
                    end
                    
                    %Finds and filters the window we've selected
                    toBeFiltered = EmgMatrix(lastSample-(windowSize-1):...
                        lastSample,1:8);
                    filterEmg = butterFilter(toBeFiltered);
                    
                    %This is also ok featz cause we so streetz:
                    featMAV = featureExtractionLiveMAV(filterEmg);
                    featWL = featureExtractionLiveWL(filterEmg);
                    featMMAV = featureExtractionLiveMMAV(featMAV);
                    featSMAV = featureExtractionLiveSMAV(featMAV,featMMAV);
                    featMADN = featureExtractionLiveMADN(filterEmg);
                    featMADR = featureExtractionLiveMADR(filterEmg);
                    featSMADR = featureExtractionLiveSMADR(featMADR,featMMAV);
                    featCC = featureExtractionLiveCC(filterEmg);
                    
                    feat = [featWL, featSMAV, featMADN, featMADR, featSMADR, featCC];
                    
                        %%Gets the classifier values with a single model:
                        classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    
                    
                    len = size(classVal,1);
                    classToPlot = decideClass(mean(classVal(len-2:len,:)));
                    
                    getRV = getRegVal(featMAV,...
                        ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression, ...
                        FistRegression,StretchRegression,classToPlot);
                    
                    RV = [RV;getRV(1:7)]; 
                    
                    if getRV(8) <= tresVal
                        classVal(end,:) = [0 0 0 0 0 0 1];
                    end
                    
                    RVTP = mean(RV(len-2:len,:));
                    
                    set(someOtherBars,'YData',100*sum(RVTP),'XData', [1]);
                    
                    axes(plothandle);
                    set(someBars,'XData',[1 2 3 4 5 6 7],'Ydata',100*classToPlot);
                    set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
                    drawnow;
                    
                    if lim4green(2) <= sum(RVTP) && sum(RVTP) <= lim4green(1) && classToPlot(randomOrder(i)) >= 0.8 && time-startTime <= 1
                    set(someOtherBars,'facecolor','g');
                    if gotIt == 0
                        startTime = time;
                        gotIt = 1;
                    end
                elseif lim4green(2) <= sum(RVTP) && sum(RVTP) <= lim4green(1) && classToPlot(randomOrder(i)) >= 0.8 && time-startTime >= 1
                    set(someOtherBars,'facecolor','b');
                    if gotBlue == 0
                        sound(ding,40000);
                    end
                    gotBlue = 1;
                else
                    set(someOtherBars,'facecolor','r');
                    if gotBlue == 1
                        stayStable(randomOrder(i),j) = stayStable(randomOrder(i),j)+1;
                        stableTime(randomOrder(i),j) = stableTime(randomOrder(i),j)+(startTime-time);
                        gotBlue = 0;
                    end
                    gotIt = 0;
                    startTime = time;
                end

                    buffer1 = 0;
                else 
                    buffer1 = buffer1 + 1;
                end
                
                %%Second window:
                if lastSample >= windowSize+20 && buffer2 >= windowSize
                    
                    %Gets the time we've recorded EMG in this function
                    time = m1.timeEMG;
                    
                    %Finds and filters the window we've selected
                    toBeFiltered = EmgMatrix(lastSample-(windowSize-1):...
                        lastSample,1:8);
                    toBeFiltered = toBeFiltered - baseline;
                    filterEmg = butterFilter(toBeFiltered);
                                        
                    %This is also ok featz cause we so streetz:
                    featMAV = featureExtractionLiveMAV(filterEmg);
                    featWL = featureExtractionLiveWL(filterEmg);
                    featMMAV = featureExtractionLiveMMAV(featMAV);
                    featSMAV = featureExtractionLiveSMAV(featMAV,featMMAV);
                    featMADN = featureExtractionLiveMADN(filterEmg);
                    featMADR = featureExtractionLiveMADR(filterEmg);
                    featSMADR = featureExtractionLiveSMADR(featMADR,featMMAV);
                    featCC = featureExtractionLiveCC(filterEmg);
                    
                    feat = [featWL, featSMAV, featMADN, featMADR, featSMADR, featCC];
                    
                        %%Gets the classifier values:
                        classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    
                    
                    len = size(classVal,1);
                    classToPlot = decideClass(mean(classVal(len-2:len,:)));
                    
                    getRV = getRegVal(featMAV,...
                        ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression, ...
                        FistRegression,StretchRegression,classToPlot);
                    
                    RV = [RV;getRV(1:7)]; 
                    
                    if getRV(8) <= tresVal
                        classVal(end,:) = [0 0 0 0 0 0 1];
                    end
                    
                    RVTP = mean(RV(len-2:len,:));
                    
                    set(someOtherBars,'YData',100*sum(RVTP),'XData', [1]);
                    
                    axes(plothandle);
                    set(someBars,'XData',[1 2 3 4 5 6 7],'Ydata',100*classToPlot);
                    set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
                    drawnow;

                if lim4green(2) <= sum(RVTP) && sum(RVTP) <= lim4green(1) && classToPlot(randomOrder(i)) >= 0.8 && time-startTime <= 1
                    set(someOtherBars,'facecolor','g');
                    if gotIt == 0
                        startTime = time;
                        gotIt = 1;
                    end
                elseif lim4green(2) <= sum(RVTP) && sum(RVTP) <= lim4green(1) && classToPlot(randomOrder(i)) >= 0.8 && time-startTime >= 1
                    set(someOtherBars,'facecolor','b');
                    if gotBlue == 0
                        sound(ding,40000);
                    end
                    gotBlue = 1;
                else
                    set(someOtherBars,'facecolor','r');
                    if gotBlue == 1
                        stayStable(randomOrder(i),j) = stayStable(randomOrder(i),j)+1;
                        stableTime(randomOrder(i),j) = stableTime(randomOrder(i),j)+(startTime-time);
                        gotBlue = 0;
                    end
                    gotIt = 0;
                    startTime = time;
                end
                    
                    buffer2 = 0;
                else
                    buffer2 = buffer2 + 1;
                end
            end
        end
    end
    save('stayStable.mat','stayStable');
    save('stableTime.mat','stableTime');
end
                