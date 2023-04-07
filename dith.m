function [y] = dith(Img, T)
N = length(T);
[row col] = size(Img);
fin_mat = zeros(row,col);
for i = 1 : N : row
    for j = 1 : N : col
        for k = 1 : N
            for l = 1 : N
                if (i+k) <= row && (j+l) <= col
                    if Img(i+k, j+l) >= T(k,l)
                        fin_mat(i+k,j+l) = 255;
                    end
                end
            end
        end
    end
end
y = uint8(fin_mat);
end
                        
            