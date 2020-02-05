function [ ] = constructNode( node, set, labels, maxImp, numRandFeatures)
% Training nodes on a decision tree recursively untill max impurity 
% satisfied

% Best split among randomly choosen features
separationPoint = getSeparation(set, labels, numRandFeatures);
% Current node Impurity
separationPoint(1) = getImpurity(labels);
% Setting current node info
setData(node, separationPoint);
% Prepairing 2 sub nodes.
subNode1 = treeNode();
subNode2 = treeNode();
% Connecting 2 subnodes to current node
setHigher(subNode1, node);
setLower(subNode2, node);
% Prepairing the subsets
subSets = getSubSets(set, labels, separationPoint(3), separationPoint(2));
imp1 = getImpurity(subSets{2});
imp2 = getImpurity(subSets{4});

% Stop condition of the recursion and training subsets of current node.
if (imp1 < maxImp)
    setData(subNode1, subSets{2});
else
    constructNode(subNode1, subSets{1}, subSets{2}, maxImp, ...
        numRandFeatures);
end

if (imp2 < maxImp)
    setData(subNode2, subSets{4});
else
    constructNode(subNode2, subSets{3}, subSets{4}, maxImp, ...
        numRandFeatures);
end
end