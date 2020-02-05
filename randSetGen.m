function [ dataSet ] = randSetGen(featureSize,numOfSample)

% Random Mean
mu=randi(15,1,featureSize);
% Random Variance - Diagonal elements of Covariance Matrix
var=1.+2*rand(1,featureSize);
% Triangle elements of Covariance Matrix
randCovarTriangle = abs(1.+rand(1,(featureSize*(featureSize-1))/2));

ind = logical(tril(ones(featureSize,featureSize),-1));
LT = zeros(featureSize);
LT(ind) = randCovarTriangle;
covarMatrix = LT + LT' + diag(var);

% Check Positive Semidefinite
if any(eig(covarMatrix) < 0)
    dataSet = randSetGen(featureSize,numOfSample);
else
    dataSet = mvnrnd(mu,covarMatrix,numOfSample);
end
end