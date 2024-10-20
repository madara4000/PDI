%saida = quantizar(entrada, bitsY, bitsCb, bitsCr)
function saida = quantizar(entrada, bitsY, bitsCb, bitsCr)
   
    imgRGB = imread(entrada);
    
 
    imgYCbCr = rgb2ycbcr(imgRGB);
    

    Y = imgYCbCr(:,:,1);
    Cb = imgYCbCr(:,:,2);
    Cr = imgYCbCr(:,:,3);
    
   
    Y = double(Y) / 255;
    Cb = double(Cb) / 255;
    Cr = double(Cr) / 255;
 
    Y = quantizar_canal(Y, bitsY);
    Cb = quantizar_canal(Cb, bitsCb);
    Cr = quantizar_canal(Cr, bitsCr);
    
   
    imgQuantYCbCr = cat(3, Y, Cb, Cr);
    
    
    imgQuantYCbCr = uint8(imgQuantYCbCr * 255); % Remover normalização
    imgQuantRGB = ycbcr2rgb(imgQuantYCbCr);
    

    imshow(imgQuantRGB);
    imwrite(imgQuantRGB, 'imagem_quantizada.png');
    

    saida = imgQuantRGB;
end


function canalQuantizado = quantizar_canal(canal, bits)

    niveis = 2^bits;
    
 
    canalQuantizado = round(canal * (niveis - 1)) / (niveis - 1);
end
