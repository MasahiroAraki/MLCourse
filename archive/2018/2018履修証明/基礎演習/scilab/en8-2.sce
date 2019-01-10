clear;
c = 10; // クラス数
function z=normal(x,y)
    z = 1/((2*%pi)*det(S)^(0.5))...
        *exp(-0.5*([x,y]-m)*inv(S)*([x,y]-m)');
endfunction

function result=recog(x)
    score = [];
    for i = 1:c
        m = mv(:,i)';
        S = cm(:,:,i);
        score = [score, normal(x(1), x(2))];
    end
    [high arg] = max(score);
    result = arg - 1;
endfunction

M = csvRead('numbers.csv');
X = M(:,3:4);
y = M(:,9);
[n d] = size(X);

// 識別関数を求める
mv = zeros(d,c);
cm = zeros(d,d,c);
x1 = [-3:0.1:3]; x2 = [-3:0.1:3];
for i=1:10
    data = X((i-1)*10+1:i*10, :);
    mv(:,i) = mean(data,'r')';
    cm(:,:,i) = cov(data);
    m = mv(:,i)'; S = cm(:,:,i);
    fplot3d(x1,x2,normal,flag=[i+2,2,4]);
end

// 識別
y2=[];
for i=1:100 do
    y2 = [y2; recog(X(i,:))];
end
printf("result = %5.1f%%\n", 100*(n-nnz(y-y2))/n);
