clear;
X = [1.0; 0.5; -0.2; -1.3]; // 学習データ
y = [1 1 2 2]'; // 正解クラス
w = [0.2, 0.3]'; // 初期重み
roh = 0.5; // 学習係数
flag = %T;  // 重みに変更があれば TRUE(%T)
[n, d] = size(X);
X = [ones(n,1), X]; // x_0 軸を追加

while flag
  flag = %F;
  for i = 1:n
    x = X(i,:)'
    g = w' * x;
    disp(w');
    if y(i) == (ア)    &  (イ)
      w = w + roh *  (ウ)   ;
      flag = %T;
    elseif y(i) ==  (エ)   &  (オ)
      w = w - roh *   (ウ)    ;
      flag = %T;
    end
  end
end
printf("Results: w0=%6.3f, w1=%6.3f\n",w(1), w(2));
