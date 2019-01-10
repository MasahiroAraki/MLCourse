clear;
P = [[0,1,1,1,0,..
      1,0,0,0,1,..
      1,0,0,0,1,..
      1,0,0,0,1,..
      0,1,1,1,0]',..
     [0,0,1,0,0,..
      0,0,1,0,0,..
      0,0,1,0,0,..
      0,0,1,0,0,..
      0,0,1,0,0]',..
     [0,1,1,1,1,..
      1,0,0,1,0,..
      0,0,1,0,0,..
      0,1,0,0,0,..
      1,1,1,1,1]',..
     [0,1,1,1,0,..
      1,0,0,0,1,..
      0,0,1,1,0,..
      1,0,0,0,1,..
      0,1,1,1,0]',..
     [0,0,1,0,0,..
      0,1,0,0,0,..
      1,0,0,1,0,..
      1,1,1,1,1,..
      0,0,0,1,0]'];

x = [0,0,0,1,0,..
     0,0,0,1,0,..
     0,0,0,1,0,..
     0,0,0,1,0,..
     0,0,0,1,0]';

function feature = feature_extraction(data)
    feature = [];
    for i = 1:size(data, 'c')
        img = matrix(data(:,i), 5, 5)';
        feature = [feature, [detect_line(img), detect_line(img')]'];
    end
endfunction

function val = detect_line(m)
    val = 0;
    for i = 1:size(m,'c')
        if regexp(strcat(string (m(:,i))), '/111/') > 0
            val = val + 1;
         end
    end
endfunction

F = feature_extraction(P);
x2 = feature_extraction(x);

[mindist, ans] = min(sqrt(sum((F-repmat(x2,[1,size(F,'c')])).^2,'r')));
disp("Ans = "+string(ans-1))
