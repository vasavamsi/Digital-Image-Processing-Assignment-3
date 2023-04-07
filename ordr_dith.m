function [y1 y2 y3] = ordr_dith(Img)
[row col] = size(Img);
I2 = [1 2; 3 0];
T2 = 255*((I2+0.5)/4);
y1 = dith(Img,T2);

I4 = [(4*I2)+1 (4*I2)+2; (4*I2)+3 (4*I2)];
T4 = 255*((I4+0.5)/16);
y2 = dith(Img,T4);

I8 = [(4*I4)+1 (4*I4)+2; (4*I4)+3 (4*I4)];
T8 = 255*((I8+0.5)/64);
y3 = dith(Img, T8);