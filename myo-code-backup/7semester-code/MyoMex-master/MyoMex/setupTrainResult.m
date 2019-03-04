function [output] = setupTrainResult(trainResult,lol)

if lol == 1
    %Overall targets reached in the three tests:
    output = [sum(sum(trainResult(1:4,:))),sum(sum(trainResult(5:8,:))),...
        sum(sum(trainResult(9:12,:)));sum(sum(trainResult(13:16,:))),...
        sum(sum(trainResult(17:20,:))),sum(sum(trainResult(21:24,:)));...
        sum(sum(trainResult(25:28,:))),sum(sum(trainResult(29:32,:))),...
        sum(sum(trainResult(33:36,:)));sum(sum(trainResult(37:40,:))),...
        sum(sum(trainResult(41:44,:))),sum(sum(trainResult(45:48,:)));...
        sum(sum(trainResult(49:52,:))),sum(sum(trainResult(53:56,:))),...
        sum(sum(trainResult(57:60,:)));sum(sum(trainResult(61:64,:))),...
        sum(sum(trainResult(65:68,:))),sum(sum(trainResult(69:72,:)));...
        sum(sum(trainResult(73:76,:))),sum(sum(trainResult(77:80,:))),...
        sum(sum(trainResult(81:84,:)));sum(sum(trainResult(85:88,:))),...
        sum(sum(trainResult(89:92,:))),sum(sum(trainResult(93:96,:)))]';
elseif lol == 0
    %Overall targets reached for the different intensities:
    output = [sum(sum(trainResult([1 13 25 37 49 61 73 85],:))),sum(sum(trainResult([5 17 29 41 53 65 77 89],:))),...
        sum(sum(trainResult([9 21 33 45 57 69 81 93],:)));sum(sum(trainResult([2 14 26 38 50 62 74 86],:))),...
        sum(sum(trainResult([6 18 30 42 54 66 78 90],:))),sum(sum(trainResult([10 22 34 46 58 70 82 94],:)));...
        sum(sum(trainResult([3 15 27 39 51 63 75 87],:))),sum(sum(trainResult([7 19 31 43 55 67 79 91],:))),...
        sum(sum(trainResult([11 23 35 47 59 71 83 95],:)));sum(sum(trainResult([4 16 28 40 52 64 76 88],:))),...
        sum(sum(trainResult([8 20 32 44 56 68 80 92],:))),sum(sum(trainResult([12 24 36 48 60 72 84 96])))];
elseif lol == 2
    %Overall targets reached for the different positions:
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(1:4,i))];
    end
    output = temp;
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(5:8,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(9:12,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(13:16,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(17:20,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(21:24,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(25:28,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(29:32,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(33:36,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(37:40,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(41:44,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(45:48,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(49:52,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(53:56,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(57:60,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(61:64,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(65:68,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(69:72,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(73:76,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(77:80,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(81:84,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(85:88,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(89:92,i))];
    end
    output = [output,temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(93:96,i))];
    end
    output = [output,temp];
    output = [output(1:48);output(49:96);output(97:144)];
    temp = [];
elseif lol == 3
    temp1 = [sum(trainResult([1 13 25 37 49 61 73 85],:),2),sum(trainResult([5 17 29 41 53 65 77 89],:),2),...
        sum(trainResult([9 21 33 45 57 69 81 93],:),2)];
    temp2 = [sum(trainResult([2 14 26 38 50 62 74 86],:),2),sum(trainResult([6 18 30 42 54 66 78 90],:),2),...
        sum(trainResult([10 22 34 46 58 70 82 94],:),2)];
    temp3 = [sum(trainResult([3 15 27 39 51 63 75 87],:),2),sum(trainResult([7 19 31 43 55 67 79 91],:),2),...
        sum(trainResult([11 23 35 47 59 71 83 95],:),2)];
    temp4 = [sum(trainResult([4 16 28 40 52 64 76 88],:),2),sum(trainResult([8 20 32 44 56 68 80 92],:),2),...
        sum(trainResult([12 24 36 48 60 72 84 96],:),2)];
    output = [temp1;temp2;temp3;temp4]';
elseif lol == 4
    %Overall targets reached for the different positions:
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(1:12,i))];
    end
    output = temp;
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(13:24,i))];
    end
    output = [output;temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(25:36,i))];
    end
    output = [output;temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(37:48,i))];
    end
    output = [output;temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(49:60,i))];
    end
    output = [output;temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(61:72,i))];
    end
    output = [output;temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(73:84,i))];
    end
    output = [output;temp];
    temp = [];
    for i=1:6
        temp = [temp,sum(trainResult(85:96,i))];
    end
    output = [output;temp]';
end