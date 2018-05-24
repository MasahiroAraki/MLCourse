clear
DATADIR = 'number\';
n = 100; // データ数
c = 10; // クラス数
d = 8; // 特徴ベクトルの次元数
y = matrix(repmat([0:9],[10,1]),[100,1]); // 正解ベクトル

// ファイルを読み込み、特徴量を計算
function result = feature(filename)
    im = im2double(imread(DATADIR+filename));
    [h w] = size(im);
    //反転
    im = 1 - im;
    //正規化
    im = im ./ sum(im);
    //平均
    mx = sum(im,'r') * (1:w)';
    my = sum(im,'c')' * (1:h)';
    //分散
    vx = sum(im,'r') * (((1:w) - mx) .^2)';
    vy = sum(im,'c')' * (((1:h) - my) .^2)';
    //歪度
    sx = sum(im,'r') * (((1:w) - mx) .^3)' / sqrt(vx)^3;
    sy = sum(im,'c')' * (((1:h) - my) .^3)' / sqrt(vy)^3;
    //尖度
    fx = sum(im,'r') * (((1:w) - mx) .^4)' / vx^2;
    fy = sum(im,'c')' * (((1:h) - my) .^4)' / vy^2;
    result = [mx, my, vx, vy, sx, sy, fx, fy];
endfunction

// クラス内分散・クラス間分散比の計算
function[result] = wcbc(va, vb)
   ...
endfunction

// Mainプログラム
// 読み込み・特徴抽出
X=[];
for i=0:9 do
    for j=0:9 do
        X = [X; feature('number'+string(i)+'_'+string(j)+'.pgm')];
    end
end

//標準化
m = mean(X,'r');
s = stdev(X, 'r');
normX = (X - repmat(m,[n,1])) ./ repmat(s,[n,1]);
csvWrite([normX, y], 'number8.csv');

// 定量的評価
J = zeros(d,d);
for i = 1:d-1
    for j = i+1:d
        J(i, j) = wcbc(normX(:,i), normX(:,j));
    end
end
