clear;
c = 10; // クラス数

// クラス内分散・クラス間分散比の計算
function[result] = wcbc(va, vb)
  ...
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

// 定性的評価
[J2 ind] = gsort(J);
for i = 1:3
    f2 = ceil(ind(i)/d);
    f1 = ind(i) - (f2 - 1)*d;
    printf("Best %d: f1 = %d, f2 = %d\n", i, f1, f2);
    subplot(3,1,i);
    for j=1:10:n do
        plot2d(              （ア）                                    )
    end
    legend(['0';'1';'2';'3';'4';'5';'6';'7';'8';'9'],-1);
end
