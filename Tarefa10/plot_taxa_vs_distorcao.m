function plot_taxa_vs_distorcao(imagem)
  
    qualidades = [0, 20, 40, 60, 80, 100];
    
    
    bpp = zeros(size(qualidades));
    PSNR = zeros(size(qualidades));
    
 
    img_original = imread(imagem);
    
 
    for i = 1:length(qualidades)
        
        nome_arquivo_saida = sprintf('imagem_compactada_%d.jpg', qualidades(i));
        
      
        imwrite(img_original, nome_arquivo_saida, 'Quality', qualidades(i));
        
      
        img_compactada = imread(nome_arquivo_saida);
        
     
        info_compactada = imfinfo(nome_arquivo_saida);
        tamanho_compactado = info_compactada.FileSize; 
        
      
        num_pixels = size(img_original, 1) * size(img_original, 2);
        
   
        bpp(i) = (tamanho_compactado * 8) / num_pixels;
        
        
        mse = mean((double(img_original(:)) - double(img_compactada(:))).^2); 
        if mse == 0
            PSNR(i) = Inf; 
        else
            max_pixel_value = 255; 
            PSNR(i) = 10 * log10((max_pixel_value^2) / mse);
        end
    end
    
  
    figure;
    plot(bpp, PSNR, '-o', 'LineWidth', 2);
    xlabel('Bits per Pixel (bpp)');
    ylabel('PSNR (dB)');
    title('Curva Taxa vs Distorção');
    grid on;
end