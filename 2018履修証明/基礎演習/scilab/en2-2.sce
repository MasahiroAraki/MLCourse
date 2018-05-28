clear;

// 画像データの読み込み
im = im2double(imread('test1.pgm'));
// 2次元配列 im のサイズ取得
[h w] = size(im);
// 結果格納用の配列 resultim を用意
resultim1 = ones(im);
resultim2 = ones(im);

// フィルタ適用
for y = 2:h-1
    for x = 2:w-1
        resultim1(y, x) = median(im(y-1:y+1, x-1:x+1));
        resultim2(y, x) = mean(im(y-1:y+1, x-1:x+1));
    end
end

// 結果の表示とファイルへの出力
imshow([im, resultim1, resultim2])
imwrite([im, resultim1, resultim2], 'out.png');
