clear;

// 画像データの読み込み
im = im2double(imread('test1.pgm'));
// 2次元配列 im のサイズ取得
[h w] = size(im);
// 結果格納用の配列 resultim1,2 を用意
resultim1 = zeros(im);
resultim2 = [];
// Sobelフィルタの定義
dx=[-1,0,1; -2,0,2; -1,0,1];
dy=[1,2,1; 0,0,0; -1,-2,-1];

// Sobelフィルタ適用
for y = 2:h-1
    for x = 2:w-1
        resultim1(y, x) = sqrt(sum(im(y-1:y+1, x-1:x+1) .* dx)^2+..
          sum(im(y-1:y+1, x-1:x+1) .* dy)^2);
    end
end

// maxプーリング
for y = 1:2:h-1
    for x = 1:2:w-1
        resultim2(ceil(y/2), ceil(x/2)) = max(resultim1(y:y+1, x:x+1));
    end
end

// 結果の表示
imshow(resultim2);
