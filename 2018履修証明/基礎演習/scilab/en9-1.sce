clear;
c = 10; // クラス数

// クラス内分散・クラス間分散比の計算
function[result] = wcbc(va, vb)
    wc = 0;
    bc = 0;
    for i=1:10:100
        Xi = [va(i:i+9), vb(i:i+9)];
        mi = mean(Xi, 'r');
        wc = wc + sum((Xi - repmat(mi,[10,1])).^2);
        bc = bc + 10 * sum(mi .^2);
    end
    result = bc / wc;
endfunction

M = csvRead('numbers.csv');
X = M(:,1:8);
y = M(:,9);
[n d] = size(X);

// 定量的評価
J = zeros(d,d);
for i = 1:d-1
    for j = i+1:d
        J(i, j) = wcbc(X(:,i), X(:,j));
    end
end

// 結果の表示
[high ind] = max(J)
printf("The best feature set is %d and %d. (J = %f)\n", ind, high)
