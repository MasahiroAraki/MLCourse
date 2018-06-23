clear;
c = 10; // クラス数

// 1-NN法による認識率計算
function result = kNN(va, vb)
    y2 = [];
    for i=1:n
        x = [va(i) vb(i)];  // i番目のデータ
        proto =[va(1:i-1) vb(1:i-1); va(i+1:n) vb(i+1:n)]; // i番目以外のデータ
        [a b] = min(sqrt(sum((proto-repmat(x, [n-1,1])).^2,'c')));
        y2 = [y2; y(b)] ;
    end
    result = 100*(n - nnz(y-y2)) / n;
endfunction

M = csvRead('numbers.csv');
X = M(:,1:8);
y = M(:,9);
[n d] = size(X);

// 定量的評価
J = zeros(d,d);
for i = 1:d-1
    for j = i+1:d
        J(i, j) = kNN(X(:,i), X(:,j));
    end
end

// 定性的評価
[J2 ind] = gsort(J);
for i = 1:3
    f2 = ceil(ind(i)/d);
    f1 = ind(i) - (f2 - 1)*d;
    mprintf("Best %d: f1 = %d, f2 = %d\n", i, f1, f2);
    subplot(3,1,i);
    for j=1:10:n do
        plot2d(X(j:j+9,f1), X(j:j+9,f2), style=-ceil(j/10), rect=[-2,-2,2,2])
    end
    legend(['0';'1';'2';'3';'4';'5';'6';'7';'8';'9'],-1);
end
