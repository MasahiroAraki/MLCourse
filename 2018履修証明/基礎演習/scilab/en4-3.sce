clear;
X = [1 4; 2 3; 4 3; 5 4; 2 1; 3 2; 3 3; 4 1]; // 学習データ
y = [1 1 1 1 2 2 2 2]'; // 正解クラス
k = 3;
x = [2.1 3]'; // 入力
[n, d] = size(X);

// 入力と学習データとの距離を計算
dist = sqrt(sum((X-repmat(x', [n,1])) .^2, 'c'));

// 上位k個のクラスを取得
[A, B] = gsort(dist, 'g', 'i');
near = y(B(1:k));

// 重み付き多数決
v = zeros(1,2)
for i=1:k
     v(near(i)) = v(near(i)) + 1/A(i);
end
[val, ind] = max(v);
printf("Result: class %d", ind);
