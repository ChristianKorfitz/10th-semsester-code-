%compass plot
% takes input x and y (which is undetermined what excately they are yet)
% but will plot as normally follows in coordinate system. Thus for our
% project, a maximum ulnar deviation should produce coordinate (1,0)

function compassPlot(xValue, yValue)

steps = 10; %will probably be left out
plotSteps = 8; %ait steps for ait plots. neva change. eva.

randomOrder = randperm(8,8)    %find random order for targetplots

    for  i = 1:plotSteps

        radius = 0.1;   %dis is radus
        %tX = 0.5;
        %tY = 0.5;
        %dis are plots for target
        plotData = [0.5 , 0.7 , 0.5 , 0 , -0.5 , -0.7 , -0.5 , 0; 0.5 , 0 , -0.5 , -0.7 , -0.5 , 0 , 0.5 , 0.7];

        datplotData = plotData(:,randomOrder(1,i));     % choose random plot. no repeat!


        h=[];
        for j=1:steps
            delete(h)
            x = 1/3*randn(1,1);      %this creates random plot data for now
            y = 1/3*randn(1,1);      % input data should be normalised between

            compass(x,y)      %creates a compass

            max_lim = 1;        %sets limit for the compass using "fake" vector arrows
            x_fake=[0 max_lim 0 -max_lim];      % which are set as the max limit of
            y_fake=[max_lim 0 -max_lim 0];      % the compass
            h_fake=compass(x_fake,y_fake);
            hold on;

            h=compass(x,y);      %creates the compassplot as an object
            set(h_fake,'Visible','off');        %hides the "fake" vector arrows
            hold on;

            %         tX = 0.5;
            %         tY = 0.5;
            %         radius = 0.2;

            %  WORKS NOT TO DO CIRCLE AND CONFIRM TARGET
            %th = linspace(0,2*pi,50);
            %[x1,y1] = pol2cart(th,radius);
            %[th1,radius1] = cart2pol(x1+tX, y1+tY);
            %polar(th1,radius1)

            %targetAreaX = [tX-radius; tX-radius; tX+radius; tX+radius; tX-radius];
            %targetAreaY = [tX-radius; tX+radius; tX+radius; tX-radius; tX-radius];
            targetAreaX = [datplotData(1,1)-radius; datplotData(1,1)-radius; datplotData(1,1)+radius; datplotData(1,1)+radius; datplotData(1,1)-radius];
            targetAreaY = [datplotData(2,1)-radius; datplotData(2,1)+radius; datplotData(2,1)+radius; datplotData(2,1)-radius; datplotData(2,1)-radius];

            point = inpolygon(x,y,targetAreaX,targetAreaY);

            h_target = plot(targetAreaX,targetAreaY,'r');

            if point == 1
                fprintf('did it\n');
            else
                fprintf('did not it\n');
            end



            hold off;

            drawnow;            %draws the vector in an compass w/ max limit (-1,1)
            pause(0.01);        %change. maybe.
        end
    end
    hold off;
end


