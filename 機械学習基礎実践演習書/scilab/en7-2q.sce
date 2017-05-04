clear;
X = [1.0 0.5 -0.2 -0.4 -1.3 -2.0]'; // 学習データ
y = [1 1 0 1 0 0]'; // 教師信号
[n d] = size(X);
X = [ones(n,1), X];  // x_0 軸を追加
eps = 1e-8;  // 終了判定の閾値
differ = %inf; // 二乗誤差の変化量
olderr = %inf; // 前回の二乗誤差
w = [0.2 0.3]'; // 初期重み
rho = 0.2;  // 学習係数

while differ > eps
  w =       （ア）      ;
  sqrerr = 0.5 * sum((X * w - y).^2);
  differ =   (イ)    ;
  olderr = sqrerr;
  mprintf("w0=%6.3f, w1=%6.3f, err=%11.8f\n",w(1), w(2), sqrerr)
end

mprintf("Results: w0 = %6.3f, w1 = %6.3f\n",w(1), w(2))
