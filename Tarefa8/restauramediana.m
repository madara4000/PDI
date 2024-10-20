function figura_out = restaura_media(figura_in, N)
  
    img = imread(figura_in);
    if size(img, 3) > 1
        img = rgb2gray(img);
    end
    h = ones(N) / N^2;
    img_filtrada = conv2(img, h, 'same');
    figura_out = 'img_restaurada.jpg';
    imwrite(uint8(img_filtrada), figura_out);
end