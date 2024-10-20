function PSNR = CPSNR(imagem1, imagem2)
  
    img1 = imread(imagem1);
    img2 = imread(imagem2);
    
   
    if size(img1) ~= size(img2)
        error('As imagens devem ter a mesma resolução.');
    end
    
 
    img1 = double(img1);
    img2 = double(img2);
    
    
    mse = mean((img1(:) - img2(:)).^2);
    
 
    if mse == 0
        PSNR = Inf; 
    else
        max_pixel_value = 255; 
        PSNR = 10 * log10((max_pixel_value^2) / mse);
    end
    
   
    if isequal(img1, img2)
        disp('As imagens de entrada e gerada são iguais.');
    else
        disp('As imagens de entrada e gerada são diferentes.');
    end
    

    fprintf('PSNR: %.4f dB\n', PSNR);
end