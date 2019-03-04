function [EmgExt,EmgFis,EmgFle,EmgRad,EmgStr,EmgUln,EmgRes] = getEmg()

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
load('EmgStretch40.mat');
load('EmgStretch50.mat');
load('EmgStretch70.mat');
load('EmgFist40.mat');
load('EmgFist50.mat');
load('EmgFist70.mat');
load('EmgRest.mat');
EmgExt = [EmgExtension40;EmgExtension50;EmgExtension70];
EmgFle = [EmgFlexion40;EmgFlexion50;EmgFlexion70];
EmgRad = [EmgRadial40;EmgRadial50;EmgRadial70];
EmgFis = [EmgFist40;EmgFist50;EmgFist70];
EmgUln = [EmgUlnar40;EmgUlnar50;EmgUlnar70];
EmgRes = [EmgRest];
EmgStr = [EmgStretch40;EmgStretch50;EmgStretch70];