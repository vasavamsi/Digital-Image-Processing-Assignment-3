function [y] = err_diff(Img)
[row col] = size(Img);
Img_test = double(Img);
fin_mat = zeros(row,col);
for i = 1 : row
    for j = 1 : col
        if Img_test(i,j) >= 127
            fin_mat(i,j) = 255;
        end
        quant_err = Img_test(i,j) - fin_mat(i,j);
        if j+1 <= col
            Img_test(i,j+1) = Img_test(i,j+1) + quant_err*(7/16);
            if i+1 <= row
                Img_test(i+1,j+1) = Img_test(i+1,j+1) + quant_err*(1/16);
            end
        end
        if i+1 <= row
            Img_test(i+1,j) = Img_test(i+1,j) + quant_err*(5/16);
            if j-1 >= 1
                Img_test(i+1,j-1) = Img_test(i+1,j-1) + quant_err*(3/16);
            end
        end
    end
end
y = uint8(fin_mat);
end
