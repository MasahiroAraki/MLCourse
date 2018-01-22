clear; clf();
function z=normal(x,y)
    z = 1/((2*%pi) * det(S)^(0.5))...
        * exp(-0.5 * ([x;y]-m)' * inv(S) * ([x;y]-m));
endfunction

X1 = [3 4; 3 8; 2 6; 4 6];    // クラス1のデータ
X2 = [3 0; 1 -2; 5 -2; 3 -4]; // クラス2のデータ

...
