function [distance1, distance2, distToCent1, distToCent2] = findDistance()

group = 1;

[Centers, distToCenters] = findCenters('Agnete',group);
distance1 = getDistance(Centers);
distToCent1 = mean(distToCenters,2)';

[Centers, distToCenters] = findCenters('Aske',group);
distance1 = [distance1;getDistance(Centers)];
distToCent1 = [distToCent1;mean(distToCenters,2)'];

[Centers, distToCenters] = findCenters('Christian U',group);
distance1 = [distance1;getDistance(Centers)];
distToCent1 = [distToCent1;mean(distToCenters,2)'];

[Centers, distToCenters] = findCenters('Mads',group);
distance1 = [distance1;getDistance(Centers)];
distToCent1 = [distToCent1;mean(distToCenters,2)'];

[Centers, distToCenters] = findCenters('Martin AG',group);
distance1 = [distance1;getDistance(Centers)];
distToCent1 = [distToCent1;mean(distToCenters,2)'];

[Centers, distToCenters] = findCenters('Nick',group);
distance1 = [distance1;getDistance(Centers)];
distToCent1 = [distToCent1;mean(distToCenters,2)'];

[Centers, distToCenters] = findCenters('Niels',group);
distance1 = [distance1;getDistance(Centers)];
distToCent1 = [distToCent1;mean(distToCenters,2)'];

[Centers, distToCenters] = findCenters('Oliver TD',group);
distance1 = [distance1;getDistance(Centers)]';
distToCent1 = [distToCent1;mean(distToCenters,2)']';


%% Group 2:

group = 2;

[Centers, distToCenters] = findCenters('Ardalan',group);
distance2 = getDistance(Centers);
distToCent2 = mean(distToCenters,2)';

[Centers, distToCenters] = findCenters('Christian KM',group);
distance2 = [distance2;getDistance(Centers)];
distToCent2 = [distToCent2;mean(distToCenters,2)'];

[Centers, distToCenters] = findCenters('Ignas',group);
distance2 = [distance2;getDistance(Centers)];
distToCent2 = [distToCent2;mean(distToCenters,2)'];

[Centers, distToCenters] = findCenters('Jakob',group);
distance2 = [distance2;getDistance(Centers)];
distToCent2 = [distToCent2;mean(distToCenters,2)'];

[Centers, distToCenters] = findCenters('Mads K',group);
distance2 = [distance2;getDistance(Centers)];
distToCent2 = [distToCent2;mean(distToCenters,2)'];

[Centers, distToCenters] = findCenters('Martin S',group);
distance2 = [distance2;getDistance(Centers)];
distToCent2 = [distToCent2;mean(distToCenters,2)'];

[Centers, distToCenters] = findCenters('Svidt',group);
distance2 = [distance2;getDistance(Centers)];
distToCent2 = [distToCent2;mean(distToCenters,2)'];

[Centers, distToCenters] = findCenters('Toby W',group);
distance2 = [distance2;getDistance(Centers)]';
distToCent2 = [distToCent2;mean(distToCenters,2)']';