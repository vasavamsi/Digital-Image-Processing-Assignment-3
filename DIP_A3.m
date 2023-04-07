
clear all
clc

f = imread('trial2.png');
imwrite(f,'trial2_f.tiff');

g1 = tresh(f);
figure;
subplot(1,2,1),imshow(f);
subplot(1,2,2),imshow(g1);
truesize;
imwrite(g1,'trial2_g1.tiff');

f1 = add_noise(f);
g2 = tresh(f1);
figure;
imshow(g2);
truesize;
imwrite(g2,'trial2_g2.tiff');

%ordered dithering

[g3 g4 g5] = ordr_dith(f);
figure;
imshow(g3);
truesize;
imwrite(g3,'trial2_g3.tiff');

figure;
imshow(g4);
truesize;
imwrite(g4,'trial2_g4.tiff');


figure;
imshow(g5);
truesize;
imwrite(g5,'trial2_g5.tiff');

% Error diffusion

g6 = err_diff(f);
figure;
imshow(g6);
truesize;
imwrite(g6,'trail2_g6.tiff');

% Generating image fidelity table

Image_metric = {'alpha_1'; 'alpha_2'; 'alpha_3'; 'alpha_4'; 'alpha_5'; 'alpha_6'};

fid_g1 = fidelity_19210112(f,g1);
fid_g2 = fidelity_19210112(f,g2);
fid_g3 = fidelity_19210112(f,g3);
fid_g4 = fidelity_19210112(f,g4);
fid_g5 = fidelity_19210112(f,g5);
fid_g6 = fidelity_19210112(f,g6);

Fid_table = table(Image_metric, fid_g1, fid_g2, fid_g3, fid_g4, fid_g5, fid_g6)
writetable(Fid_table,'trial2.csv');

