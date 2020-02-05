function [ headNodeList ] = trainForest( data, labels, maxImp, ...
    numOfTree, trainingdataSize, numRandFeatures)
% This function trains a random forest returns head/root node list of each tree

% Prepairing training data for each tree
[dataList, labelList] = Bagging(data, labels, trainingdataSize, numOfTree);

% Empty head nodes of each tree
headNodeList = headNodes(numOfTree);

% Training each tree
for i=1:numOfTree
    constructNode(headNodeList{i}, dataList{i}, labelList{i}, maxImp, ...
        numRandFeatures);
end
end