function plotMovingDot(emgData,lineNumber)

% defines the length of the plot + the line we want to plot
N = length(emgData([lineNumber],:));
X = emgData([lineNumber],:);

figure;
% This is the graph that stays in the plot - the thing to follow when
% training the different movements
plot([0 500 1000 3000 3800], [0.01 0.01 0.8 0.8 0.1], 'c');
hold on;

% This plots the data as a dot flying around everywhere - it's completely
% chaotic at the moment, which is awesome... but impractical

for i=1:N
    lol = plot(i, X(i), 'or', 'MarkerSize', 5, 'MarkerFaceColor', 'g')
    axis([0 N 0 1]);
    pause(0.001)
    delete(lol)
end