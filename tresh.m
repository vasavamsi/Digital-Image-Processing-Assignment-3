function [y] = tresh(Img)
[row col] = size(Img);
fin_img = zeros(row,col);
for i = 1 : row
    for j = 1 :col
        if Img(i,j) >= 127
            fin_img(i,j) = 255;
        else
            continue
        end
    end
end
y = uint8(fin_img);   