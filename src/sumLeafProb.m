function [ output ] = sumLeafProb( L )
clusters = L{1}(2,:);
probability = L{1}(1,:);
for i = 2:length(L)
    clust = L{i}(2,:);
    prob = L{i}(1,:);
    for j = 1:length(clust);
        result = find(clusters == clust(j));
        if isempty(result)
            [~, m] = size(clusters);
            clusters(:,m+1) = clust(j);
            probability(:,m+1) = prob(j);
        else
            probability(result) = probability(result)+prob(j);
        end
    end
end
output = [probability ; clusters];
end
