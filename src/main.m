% Random data generation for binary case
a = randSetGen(2,1000);
b = randSetGen(2,1000);
% Labels for each sample
A = ones(1,size(a,1));
B = 2*ones(1,size(a,1));
% Formatting 
labels =[A B];
data=[a; b];
% Training Forest
maxGiniImpurity = 0.1;
numOfTree = 10;
baggingSampleSize = 200;
numRandFeatures = 3;
L = trainForest(data, labels, maxGiniImpurity, numOfTree, ...
    baggingSampleSize, numRandFeatures);
disp('Forest is trained.')

% Testing single sample
x = b(5,:);
K = testData(L,x);
leafLabelDistri(K);
