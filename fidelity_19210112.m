function [y] = fidelity_19210112(f, g)
[row col] = size(f);
f = double(f);
g = double(g);

alpha1 = sum(sum(f-g));
alpha1 = alpha1/(row*col);

alpha2 = sum(sum(abs(f-g)));
alpha2 = alpha2/(row*col);

f1 = 255*((f/255).^2.2);
g1 = 255*((g/255).^2.2);

alpha3 = sum(sum(abs(f1-g1)));
alpha3 = alpha3/(row*col);

f1_new = 255*((f/255).^(1/2.2));
g1_new = 255*((g/255).^(1/2.2));

alpha4 = sum(sum(abs(f1_new-g1_new)));
alpha4 = alpha4/(row*col);

gauss = fspecial('Gaussian', 7);
f2 = imfilter(f, gauss);
g2 = imfilter(g, gauss);

f3 = 255*((f2/255).^2.2);
g3 = 255*((g2/255).^2.2);

alpha5 = sum(sum(abs(f3-g3)));
alpha5 = alpha5/(row*col);

f3_new = 255*((f2/255).^(1/2.2));
g3_new = 255*((g2/255).^(1/2.2));

alpha6 = sum(sum(abs(f3_new-g3_new)));
alpha6 = alpha6/(row*col);

y = [alpha1;alpha2;alpha3;alpha4;alpha5;alpha6];
end


