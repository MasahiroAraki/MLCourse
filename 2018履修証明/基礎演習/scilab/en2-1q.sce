clear;

// 画像データの読み込み
im = im2double(imread('test1.pgm'));
// 2次元配列 im のサイズ取得
[h w] = size(im);
// 結果格納用の配列 resultim を用意
resultim = ones(im);

// メディアンフィルタ適用
for y = 2:h-1
    for x = 2:w-1
        resultim(  （ア）    ) = median(im(   （イ）   ));
    end
end

// 結果の表示とファイルへの出力
imshow([im, resultim])
imwrite([im, resultim], 'out.png');
