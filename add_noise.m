function [y] = add_noise(Img)
[row col] = size(Img);
noise_mat = 256*rand(row,col) - 128;
noise_mat = uint8(noise_mat);
y = Img + noise_mat;
