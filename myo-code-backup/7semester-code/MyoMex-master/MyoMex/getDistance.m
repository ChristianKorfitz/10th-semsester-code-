function [distance] = getDistance(centers)

distance1 = mean(pdist([centers(1:8,:)'],'euclidean'));
distance2 = mean(pdist([centers(9:16,:)'],'euclidean'));
distance3 = mean(pdist([centers(17:24,:)'],'euclidean'));

distance = [distance1,distance2,distance3];