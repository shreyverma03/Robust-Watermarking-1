%%  DWT - SVD Watermarking
function  dwt_svd()
clear all;
close all;
clc;

%change directory
folder_name = uigetdir(pwd, 'Select Directory Where the .m Files Resides');
if(folder_name ~= 0)
    if(strcmp(pwd, folder_name) == 0)
        cd(folder_name);
    end
else
    return;
end

% read cover image & watermark logo
[cover_fname, cover_pthname] = uigetfile('*.jpg; *.png; *.tif; *.bmp', 'Select the Cover Image');
if (cover_fname ~= 0)
    cover_image = strcat(cover_pthname, cover_fname);
    cover_image = double( rgb2gray( imread( cover_image ) ) );
    cover_image = imresize(cover_image, [512 512], 'bilinear');
else
    return;
end

[watermark_fname, watermark_pthname] = uigetfile('*.jpg; *.png; *.tif; *.bmp', 'Select the Watermark Logo');
if (watermark_fname ~= 0)
    watermark_logo = strcat(watermark_pthname, watermark_fname);
    watermark_logo = double(im2bw( rgb2gray( imread( watermark_logo ))));
    watermark_logo = imresize(watermark_logo, [512 512], 'bilinear');
else
    return;
end

% Set constant variables
print_figures=true;


if (print_figures == true)
    secret_key = 3; % random secret key
    
    watermarked_image = watermark_embedding(cover_image, watermark_logo,secret_key, print_figures);
    
    watermark_extraction(watermarked_image, watermark_logo, secret_key,print_figures, true);
    

    


end