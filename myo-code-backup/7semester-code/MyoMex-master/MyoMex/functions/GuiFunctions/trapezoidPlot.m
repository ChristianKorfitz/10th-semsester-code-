% this plots the trapezoid in the axes1 in the training GUI when button
% "Plot Button" is pressed

function trapezoidPlot(sliderValue, handles, handles2, m1, movementType)

    if sliderValue == 1
        moveIntense = 0.4;
        y = [0.01, 0.01, moveIntense, moveIntense, 0.01 0.01];
    elseif sliderValue == 2 
        moveIntense = 0.5;
        y = [0.01, 0.01, moveIntense, moveIntense, 0.01 0.01];
    elseif sliderValue == 3
        moveIntense = 0.7;
        y = [0.01, 0.01, moveIntense, moveIntense, 0.01 0.01];
    end
    
    if movementType == 7
        moveIntense = 0;
        y = [0, 0, moveIntense, moveIntense, 0, 0];
    end

    if movementType == 1
        movement = 'Extension';
    elseif movementType == 2
        movement = 'Flexion';
    elseif movementType == 3
        movement = 'Radial';
    elseif movementType == 4
        movement = 'Ulnar';
    elseif movementType == 5
        movement = 'Fist';
    else 
        movement = 'Stretch';
    end

    MVC = cell2mat(struct2cell(load(convertCharsToStrings(strcat('MVC',movement,'.mat')))));
    load('baseline.mat');
    
    maximum = mean(MVC);
    disp('MVC and baseline found');
    isError = 0;

%Will only do the following if there's no error
if isError ~= 1
    pause(0.1);
    
    %Creates the trapezoid based on the slidervalue from the input.
        x = [0 2000 5000 10000 13000 15000];
    
    handleplot = handles2;
    plothandle = handles;
    
    if ~isempty(plothandle)
        cla();
        axes(plothandle);
        set(gca,'Color',[1 1 1]);
        ax = gca;
        ax.Visible = 'on';
        trapezoid = plot(x,y);
        xlim([0 15000]);
        ylim([0 1]);
        hold on;
        xlabel('Time in ms');
        ylabel('EMG intensity');
        
        %Setup for later use. Do NOT change it unless you want to fix it
        %after you screw it up.
        recordingTime = 15;
        buffer1 = 0;
        buffer2 = 0;
        time = 0;
        lol = plot(plothandle, 0, 0, 'or', 'MarkerSize', ...
                       10, 'MarkerFaceColor', 'g');
        windowSize = 40;
        
        %Makes sure we'll record for the stated 'recordingTime'
        while time <= recordingTime
            
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
                    
                    %Finds and filters the window we've selected
                    toBeFiltered = EmgMatrix(lastSample-(windowSize-1):...
                        lastSample,1:8);
                    toBeFiltered = toBeFiltered - baseline;
                    filterEmg = butterFilter(toBeFiltered);
                    
                    %This is also ok for a window and such stuff.
                    meanAbs = mean(abs(filterEmg));
                    
                    %Rescales the input between 0 and our MVC and finds the
                    %max value in the output vector to plot:
                    ClMeanAbs = mean(removeBaseline(meanAbs, baseline));
                    meanEmg = rescale(ClMeanAbs,'InputMin',0,'InputMax',maximum);
                    
                    set(lol,'XData',time*1000,'YData',meanEmg);
                    drawnow;
                    realSpiderplot(handleplot,meanAbs);
                    
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
                    
                    %This is also ok for a window and such stuff.
                    meanAbs = mean(abs(filterEmg));
                    
                    %Rescales the input between 0 and our MVC and finds the
                    %max value in the output vector to plot:
                    ClMeanAbs = mean(removeBaseline(meanAbs, baseline));
                    meanEmg = rescale(ClMeanAbs,'InputMin',0,'InputMax',maximum);
                    
                    set(lol,'XData',time*1000,'YData',meanEmg);
                    drawnow;
                    realSpiderplot(handleplot,meanAbs);
                    
                    buffer2 = 0;
                else
                    buffer2 = buffer2 + 1;
                end
            end
        end
    end

delete(trapezoid);
%%Saving with a specific name instead of the same for every case:
Intensity = num2str(moveIntense*100);

if movementType == 2
    if sliderValue == 1
        EmgFlexion40 = EmgMatrix;
    elseif sliderValue == 2
        EmgFlexion50 = butterFilter(EmgMatrix);
    elseif sliderValue == 3
        EmgFlexion70 = butterFilter(EmgMatrix);
    end
    
elseif movementType == 1
    if sliderValue == 1
        EmgExtension40 = butterFilter(EmgMatrix);
    elseif sliderValue == 2
        EmgExtension50 = butterFilter(EmgMatrix);
    elseif sliderValue == 3
        EmgExtension70 = butterFilter(EmgMatrix);
    end
    
elseif movementType == 3
    if sliderValue == 1
        EmgRadial40 = butterFilter(EmgMatrix);
    elseif sliderValue == 2
        EmgRadial50 = butterFilter(EmgMatrix);
    elseif sliderValue == 3
        EmgRadial70 = butterFilter(EmgMatrix);
    end
    
elseif movementType == 4
    if sliderValue == 1
        EmgUlnar40 = butterFilter(EmgMatrix);
    elseif sliderValue == 2
        EmgUlnar50 = butterFilter(EmgMatrix);
    elseif sliderValue == 3
        EmgUlnar70 = butterFilter(EmgMatrix);
    end
elseif movementType == 5
    if sliderValue == 1
        EmgFist40 = butterFilter(EmgMatrix);
    elseif sliderValue == 2
        EmgFist50 = butterFilter(EmgMatrix);
    elseif sliderValue == 3
        EmgFist70 = butterFilter(EmgMatrix);
    end
elseif movementType == 6
    if sliderValue == 1
        EmgStretch40 = butterFilter(EmgMatrix);
    elseif sliderValue == 2
        EmgStretch50 = butterFilter(EmgMatrix);
    elseif sliderValue == 3
        EmgStretch70 = butterFilter(EmgMatrix);
    end
else 
    temp = butterFilter(EmgMatrix);
    EmgRest = [temp;temp;temp];
    movement = 'Rest';
    Intensity = [];
end

try
    save(convertCharsToStrings(strcat('Emg',movement,Intensity,'.mat')),convertCharsToStrings(strcat('Emg',movement,Intensity)));
catch
    msgbox('Undefined movement/intensity combination');
end
end
