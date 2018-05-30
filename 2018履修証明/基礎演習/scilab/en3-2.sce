clear;
M = csvRead('iris.csv');
X = M(:,1:4);
[n d] = size(X);

// 標準化
m = mean(X, 'r');
s = stdev(X, 'r');
normX = (X - repmat(m, [n,1])) ./ repmat(s, [n,1]);

// 主成分分析
[l, f, c] = pca(normX);
plot2d(c(1:50,1), c(1:50,2), style=-3, rect=[-4,-4,4,4])
plot2d(c(51:100,1), c(51:100,2), style=-4)
plot2d(c(101:150,1), c(101:150,2), style=-5)
