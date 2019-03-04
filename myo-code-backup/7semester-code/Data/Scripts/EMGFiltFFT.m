
%% Takes a ?x8 matrix input, performs FFT and butterworth
%  plots both to compare before and after filtering. 

%% You'll need to use removeAndSplit on the data before filtering!!

function [output]= EMGFiltFFT(emgData)

%% Doing some fft-ish things:

N = length(emgData([1],:));
Fs = 200;
freq = (0:N-1)/N*Fs;

for i=1:8
    fftEmg{i} = abs(fft(emgData([i],:)));
end

%% Plot all them fft's:

figure;
hold on;
for i=1:8
    subplot(2,4,i);
    plot(freq,fftEmg{i});
    xlim([0 100]);
end
hold off;


%% Doing some butt-filter:

[b,a] = butter(2,0.05,'high');

for i=1:8
    filterEmg{i} = filtfilt(b,a,emgData([i],:));
end

output = [filterEmg{1}; filterEmg{2}; filterEmg{3}; filterEmg{4}; filterEmg{5}; ...
    filterEmg{6}; filterEmg{7}; filterEmg{8}];

%% Plotter butt-filteret:
figure;
hold on;
for i=1:8
    subplot(2,4,i);
    plot(freq,abs(fft(filterEmg{i})));
    xlim([0 100]);
end
hold off;

%% Plotter de forskellige kanaler:

figure;
axes('Position' , [0.05 -0.92 1 1], 'Visible' , 'off')
text(0.45,0.95,'Tid (s)')
h = text(0.03,1.3, 'Raw EMG - all channels')
set(h, 'rotation', 90)
hold on;
for i=1:8
    subplot(2,4,i);
    plot(emgData([i],:));
end
hold off;


%% Next step is to compare different data, which will be done in another
%  script due to the input variables in this script.


