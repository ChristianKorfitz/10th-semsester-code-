%This is for the moving dot thing:

function targetTraining(handles1, handles4, handles5, handles6, handles7, m1)

load('ExtensionRegression.mat');
load('FlexionRegression.mat');
load('RadialRegression.mat');
load('UlnarRegression.mat');
load('FistRegression.mat');
load('StretchRegression.mat');
load('MdlLinear.mat');
imageExte = imread('url.png');
imageFlex = imread('url2.png');
imageRadi = imread('url3.png');
imageUlna = imread('url4.png');

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
        outputValue = [0,0,10];
        time = 0;
        tresVal = 0.15;

        regressValue = [];
        classVal = [0 0 0 0 0 0 0; 0 0 0 0 0 0 0];
        
        %Begin the test at x = 0 & y = 0.
        prevValue = [0,0];
        lol = plot(plothandle,prevValue(1),prevValue(2),'b', 'Marker', 'o', ...
             'MarkerFaceColor','r');
        lol2 = plot(plothandle,prevValue(1),prevValue(2),'k','Marker', 'o', ...
            'MarkerFaceColor','k');
        
        %Makes sure we'll record for the stated 'recordingTime'
        while time <= 120
            
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
                    
                    getRV = getSingleRegression(featMAV,...
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
                    getRV = getSingleRegression(featMAV,...
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
            end
        end
    end
    
    delete(lol);
    delete(lol2);
end
