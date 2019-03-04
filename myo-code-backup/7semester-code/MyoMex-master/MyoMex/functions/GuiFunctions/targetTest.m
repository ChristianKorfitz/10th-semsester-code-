%This is for the moving dot thing:

function targetTest(handles1, handles4, handles5, handles6, handles7, m1, targetSet)


load('ExtensionRegression.mat');
load('FlexionRegression.mat');
load('RadialRegression.mat');
load('UlnarRegression.mat');
load('FistRegression.mat');
load('StretchRegression.mat');
load('MdlLinear.mat');
load('ding.mat');
imageExte = imread('url.png');
imageFlex = imread('url2.png');
imageRadi = imread('url3.png');
imageUlna = imread('url4.png');
imageThum = imread('url8.png');

%Setup of the plot:
plothandle = handles1;
imhandle1 = handles4;
imhandle2 = handles5;
imhandle3 = handles6;
imhandle4 = handles7;

    if ~isempty(plothandle);
        axes(plothandle);
        cla(plothandle);
        axis on;
        x = 0.5*[-20,20,20,-20,-20];
        y = 0.5*[20,20,-20,-20,20];
        extra = plot(x,y);
        xlim(0.5*[-20 20]);
        ylim(0.5*[-20 20]);
        xlabel('');
        ylabel('');
        grid on;
        grid minor;
        hold on;
        
        %%Adds all the images to the GUI:
        
        axes(imhandle1)
        image(imageFlex);
        axis off;
        axis image;
        
        axes(imhandle2)
        image(imageUlna);
        axis off;
        axis image;
        
        axes(imhandle3)
        image(imageExte);
        axis off;
        axis image;
        
        axes(imhandle4)
        image(imageRadi);
        axis off;
        axis image;
        
        %Setup for later use. Do NOT change it unless you want to fix it
        %after you screw it up.        
        buffer1 = 0;
        buffer2 = 0;
        Max = 9.9;
        Min = -9.9;
        MaxRad = 150;
        MinRad = 5;
        windowSize = 40;
        allPoint = 1;
        onPoint = 1;
        radius = 1;
        outputValue = [0,0,30];
        outputValue2 = [0,0,30];
        gotPoint = 0;
        gotTime = 0;
        timeAtPoint = 1;
        youGoGirl = 0;
        firstTime = 1;
        maxTime = 15; 
        startValue = [];
        stopValue = [];
        overshots = [];
        timeDif = [];
        gotIt = [];
        gain = [1 1 2 1];

        regressValue = [];
        classVal = [0 0 0 0 0 0 0; 0 0 0 0 0 0 0];
        
        %Begin the test at x = 0 & y = 0.
        prevValue = [0,0];
        lol = plot(plothandle,prevValue(1),prevValue(2),'b', 'Marker', 'o', ...
             'MarkerFaceColor','r');
        lol2 = plot(plothandle,prevValue(1),prevValue(2),'k','Marker', 'o', ...
            'MarkerFaceColor','k');
         
        %Decides what targetset to use:
        if targetSet == 1
            randomOrder = (1:16);
        elseif targetSet == 2
            randomOrder = [16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1];
        elseif targetSet == 3
            randomOrder = [8,7,6,5,4,3,2,1,9,10,11,12,13,14,15,16];
        elseif targetSet == 4
            randomOrder = [9,10,11,12,13,14,15,16,1,2,3,4,5,6,7,8];
        end
        
        
        plotData = 3.5*[1 0.5 0 -0.5 -1 -0.5 0 0.5 2 1 0 -1 -2 -1 0 1; ...
            0 0.5 1 0.5 0 -0.5 -1 -0.5 0 1 2 1 0 -1 -2 -1];
%         plotData = ...
%             [3,0,2,-1,-4,2,-5,1,6,-2,0,4,-4,-6,1,7 ...
%             ;1,4,-3,4,0,-4,-6,2,5,-3,0,-4,2,7,1,4];
        %NewSizes:
        SizeOfDot = [0.8 1.2 1 1.3 1.2 1 0.8 1.2 1 1.2 0.8 1.3 1.2 1 0.8 1.2];
        startSize = [90 90 90 90 30 30 30 30 90 90 90 90 30 30 30 30];
        %OldData:
        %SizeOfDot = [1 0.5 0.4 0.9 1.2 1.4 0.7 1.3 1 1.6 0.9 0.4 0.8 1.3 1.1 1.5];

        %Makes sure we'll record for the stated 'recordingTime'
        while allPoint ~= 17
            
            %This has been stolen from MyoMex to retrieve data:
            timeEMG = m1.timeEMG_log;
            if ~isempty(timeEMG)
                iiEMG = find(timeEMG>=(timeEMG(end)-2));
                tEMG = timeEMG(iiEMG);
                EmgMatrix(iiEMG,:) = m1.emg_log(iiEMG,:);
                lastSample = max(iiEMG);
                timeIMU = m1.timeIMU_log;
                iiIMU = find(timeIMU>=(timeIMU(end)-2));
                time = m1.timeEMG;
                
                %This is when we're on point and need to plot a new square
                if onPoint == 1
                    datplotData = plotData(:,randomOrder(1,allPoint));     % choose random plot.
                    %h=[];
                    r = SizeOfDot(randomOrder(1,allPoint));
                    radius = 1/3;
                    
                    
                    dotLimit = [(r*60)-10, (r*60)+10];

                    targetAreaX = [datplotData(1,1)-radius; ... 
                        datplotData(1,1)-radius; datplotData(1,1)+radius;...
                        datplotData(1,1)+radius; datplotData(1,1)-radius];
                    
                    targetAreaY = [datplotData(2,1)-radius; ...
                        datplotData(2,1)+radius; datplotData(2,1)+radius;...
                        datplotData(2,1)-radius; datplotData(2,1)-radius];
                    
                    %Plots the circle:
                    x = datplotData(1);
                    y = datplotData(2);
                    d = r*2;
                    px = x-r;
                    py = y-r;
                    rx = x-r/3;
                    ry = y-r/3;
                    h_target = rectangle(plothandle,'Position',[px py d d],'Curvature',[1,1]);
                    h_target2 = rectangle(plothandle,'Position',[rx ry d/3 d/3],'Curvature',[1 1]);
                    
                    lengthTravel(allPoint) = findLength(outputValue);                    
                    startPoint(allPoint,:) = outputValue(end,:); %Where is the curser placed now and what is the size of it
                    timeStart(allPoint) = time; %Time when the new target shows up
                    overshots(allPoint) = -1; %Has to be -1 to ensure 0 overshots if target is reached in first try
                    onPoint = 0;
                    tresVal = 0.15;
                    outputValue2 = [outputValue2; outputValue];
                    outputValue = [0 0 startSize(allPoint)];
                end
                
                %First window:
                if lastSample >= windowSize && buffer1 >= windowSize
                    
                    %Gets the time we've recorded EMG in this function
                    time = m1.timeEMG;
                    
                    %Finds and filters the window we've selected
                    toBeFiltered = EmgMatrix(lastSample-(windowSize-1):...
                        lastSample,1:8);
                    filterEmg = butterFilter(toBeFiltered);
                    
                    %Extraction of the features:
                    featMAV = featureExtractionLiveMAV(filterEmg);
                    featWL = featureExtractionLiveWL(filterEmg);
                    featMMAV = featureExtractionLiveMMAV(featMAV);
                    featSMAV = featureExtractionLiveSMAV(featMAV,featMMAV);
                    featMADN = featureExtractionLiveMADN(filterEmg);
                    featMADR = featureExtractionLiveMADR(filterEmg);
                    featSMADR = featureExtractionLiveSMADR(featMADR,featMMAV);
                    featCC = featureExtractionLiveCC(filterEmg);
                    
                    feat = [featWL, featSMAV, featMADN, featMADR, featSMADR, featCC];
                    
                    classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    
                    len = size(classVal,1);
                    classToPlot = mean(classVal(len-2:len,:));
                    
                    getRV = gain.*getSingleRegression(featMAV,...
                        ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression, ...
                        FistRegression,StretchRegression,classToPlot);
                    
                    regressValue = [regressValue;getRV(1:3)]; 
                                        
                    if getRV(4) <= tresVal
                        classVal(end,:) = [0 0 0 0 0 0 1];
                    end
                    
                    outputValue = [outputValue;outputValue(end,:)+regressValue(end,:)];
                    
                    XData = outputValue(end,1);
                    YData = outputValue(end,2);
                    ZData = outputValue(end,3);
                    XData(XData>Max) = Max;
                    XData(XData<Min) = Min;
                    YData(YData>Max) = Max;
                    YData(YData<Min) = Min;
                    ZData(ZData>MaxRad) = MaxRad;
                    ZData(ZData<MinRad) = MinRad;
                    outputValue(end,:) = [XData,YData,ZData];
                    
                    axes(plothandle);
                    set(lol,'XData',XData,'YData',YData);
                    set(lol2,'XData',XData,'YData',YData);
                    set(lol,'MarkerSize',ZData);      
                    drawnow;
                    
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
                    filterEmg = butterFilter(toBeFiltered);
                    
                    %Retrieves the features needed for the classifier:
                    featMAV = featureExtractionLiveMAV(filterEmg);
                    featWL = featureExtractionLiveWL(filterEmg);
                    featMMAV = featureExtractionLiveMMAV(featMAV);
                    featSMAV = featureExtractionLiveSMAV(featMAV,featMMAV);
                    featMADN = featureExtractionLiveMADN(filterEmg);
                    featMADR = featureExtractionLiveMADR(filterEmg);
                    featSMADR = featureExtractionLiveSMADR(featMADR,featMMAV);
                    featCC = featureExtractionLiveCC(filterEmg);
                    
                    %Sets up our feature-matrix for the classifier:
                    feat = [featWL, featSMAV, featMADN, featMADR, featSMADR, featCC];
                    
                    %Retrieves the new classification values:
                    classVal = [classVal;getClassificationValue(feat,MdlLinear)];
                    len = size(classVal,1);
                    classToPlot = mean(classVal(len-2:len,:));
                    
                    %Gets the regression values for the dot-velocity:
                    getRV = gain.*getSingleRegression(featMAV,...
                        ExtensionRegression,FlexionRegression,RadialRegression,UlnarRegression, ...
                        FistRegression,StretchRegression,classToPlot);
                    
                    regressValue = [regressValue;getRV(1:3)]; 
                                        
                    if getRV(4) <= tresVal
                        classVal(end,:) = [0 0 0 0 0 0 1];
                    end
                    
                    outputValue = [outputValue;outputValue(end,:)+regressValue(end,:)];

                    %All these lines sets the boundaries for the dot:
                    XData = outputValue(end,1);
                    YData = outputValue(end,2);
                    ZData = outputValue(end,3);
                    XData(XData>Max) = Max;
                    XData(XData<Min) = Min;
                    YData(YData>Max) = Max;
                    YData(YData<Min) = Min;
                    ZData(ZData>MaxRad) = MaxRad;
                    ZData(ZData<MinRad) = MinRad;
                    outputValue(end,:) = [XData,YData,ZData];

                    %Plots the dot w. both size and placement:
                    axes(plothandle);
                    set(lol,'XData',XData,'YData',YData);
                    set(lol2,'XData',XData,'YData',YData);
                    set(lol,'MarkerSize',ZData);                    
                    drawnow;
                    
                    buffer2 = 0;
                else
                    buffer2 = buffer2 + 1;
                end
                
                %Cancels the target if not reached before "maxTime":
                if time-timeStart(allPoint) >= maxTime 
                    onPoint = 1;
                    firstTime = 1;
                    gotTime = 0;
                    timeEnd(allPoint) = time;
                    gotIt(allPoint) = 0;
                    if overshots(allPoint) == -1
                        overshots(allPoint) = 0;
                    else
                        overshots(allPoint) = overshots(allPoint);
                    end
                    allPoint = allPoint+1;
                    delete(h_target);
                    delete(h_target2);
                    set(lol,'MarkerFaceColor','r');
                end
                
                %Sets gotPoint to 1 if were inside the target area
                gotPoint = inpolygon(outputValue(end,1),outputValue(end,2),targetAreaX,targetAreaY);
                
                %Starts the timer if the size is correct as well:
                if gotPoint == 1 && dotLimit(1) <= outputValue(end,3) && dotLimit(2) >= outputValue(end,3) && gotTime == 0
                    if firstTime == 1
                        startTime = time;
                    end
                    gotTime = 1;
                    try
                        overshots(allPoint) = overshots(allPoint)+1;
                        startValue(allPoint) = length(outputValue2)+length(outputValue);
                    catch
                        overshots(end) = overshots(end)+1;
                        startValue(end) = length(outputValue2)+length(outputValue);
                    end
                    set(lol,'MarkerFaceColor','g');
                    firstTime = 0;
                    
                %Resets if we get out of time again
                elseif gotTime == 1 && (gotPoint == 0 || (dotLimit(1) >= outputValue(end,3) || dotLimit(2) <= outputValue(end,3)))
                    gotTime = 0;
                    set(lol,'MarkerFaceColor','r');
                    firstTime = 1;
                    
                elseif gotPoint == 0 && time-youGoGirl >= 1
                    set(lol,'MarkerFaceColor','r');
                    
                %Confirms the target is reached if we're still within the
                %area w. the correct size after "timeAtPoint":
                elseif gotPoint == 1 && dotLimit(1) <= outputValue(end,3) && dotLimit(2) >= outputValue(end,3) ...
                        && gotTime == 1 && time-startTime >= timeAtPoint
                    onPoint = 1;
                    firstTime = 1;
                    gotTime = 0;
                    timeEnd(allPoint) = time;
                    gotIt(allPoint) = 1;
                    allPoint = allPoint+1;
                    delete(h_target);
                    delete(h_target2);
                    stopValue(allPoint) = length(outputValue2)+length(outputValue);
                    set(lol,'MarkerFaceColor','b');
                    youGoGirl = time;
                    sound(ding,40000);
                end
            end
        end
    end

    %Calculates a few results:
    %gotIt = gotIt(1:2:end);
    timeDif = timeEnd-timeStart;
    lengthTravel(allPoint) = findLength(outputValue);
    outputValue2 = [outputValue2; outputValue];
    
    delete(lol);
    delete(lol2);
    delete(h_target);
    delete(h_target2);
    axes(plothandle)
    imshow(imageThum);
    axis off;
    axis image;
    
    pause(4);
    
    %Saving everything that we need to calculate the fitt's law results:
    save('overshots.mat','overshots');
    save('timeDif.mat','timeDif');
    save('startValue.mat','startValue');
    save('stopValue.mat','stopValue');
    save('gotIt.mat','gotIt');
    save('EmgMatrix.mat','EmgMatrix');
    save('outputValue.mat','outputValue');
    save('outputValue2.mat','outputValue2');
    save('lengthTravel.mat','lengthTravel');
    
end
