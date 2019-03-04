function [output] = loadAndFormat();

load('EmgExtension40.mat');
load('EmgExtension50.mat');
load('EmgExtension70.mat');

load('EmgFlexion40.mat');
load('EmgFlexion50.mat');
load('EmgFlexion70.mat');

load('EmgRadial40.mat');
load('EmgRadial50.mat');
load('EmgRadial70.mat');

load('EmgUlnar40.mat');
load('EmgUlnar50.mat');
load('EmgUlnar70.mat');

load('EmgFist40.mat');
load('EmgFist50.mat');
load('EmgFist70.mat');

load('EmgStretch40.mat');
load('EmgStretch50.mat');
load('EmgStretch70.mat');

Extension = [EmgExtension40(801:2200,:);EmgExtension50(801:2200,:);EmgExtension70(801:2200,:)];
Flexion = [EmgFlexion40(801:2200,:);EmgFlexion50(801:2200,:);EmgFlexion70(801:2200,:)];
Radial = [EmgRadial40(801:2200,:);EmgRadial50(801:2200,:);EmgRadial70(801:2200,:)];
Ulnar = [EmgUlnar40(801:2200,:);EmgUlnar50(801:2200,:);EmgUlnar70(801:2200,:)];
Fist = [EmgFist40(801:2200,:);EmgFist50(801:2200,:);EmgFist70(801:2200,:)];
Stretch = [EmgStretch40(801:2200,:);EmgStretch50(801:2200,:);EmgStretch70(801:2200,:)];

output = [Extension; Flexion; Radial; Ulnar; Fist; Stretch];