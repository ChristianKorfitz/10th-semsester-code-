%%Input is the full EMG matrix for all the recordings of the movement and
%%then you need the corresponding MVC for the movement in the EMG. Right
%%now it's modified for 90 samples of each movement

function [output] = optimalMovement()

movement(1:90,1) = 0.3*ones(90,1);
movement(91:180,1) = 0.5*ones(90,1);
movement(181:270,1) = 0.8*ones(90,1);

%Creates zeros for the rest of the movements performed
movement(271:1080,1) = 0*ones(810,1);

output = movement;