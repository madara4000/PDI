
function [bpp, PSNR] = compc_cp(imagem, qualidade)
  
    img_original = imread(imagem);
    
 
    nome_arquivo_saida = 'jpg_com_perdas.jpg';
    imwrite(img_original, nome_arquivo_saida, 'Quality', qualidade);
    
 
    img_compactada = imread(nome_arquivo_saida);
    
   
    info_original = imfinfo(imagem);
    info_compactada = imfinfo(nome_arquivo_saida);
    
    tamanho_original = info_original.FileSize; 
    tamanho_compactado = info_compactada.FileSize; 
    
    num_pixels = size(img_original, 1) * size(img_original, 2);
    
    
    bpp = (tamanho_compactado * 8) / num_pixels; 
    
   
    mse = mean((double(img_original(:)) - double(img_compactada(:))).^2); 
    if mse == 0
        PSNR = Inf; 
    else
        max_pixel_value = 255; % 
        PSNR = 10 * log10((max_pixel_value^2) / mse);
    end
    
    
    figure;
    imshow(img_compactada);
    title(['Imagem Compactada com Qualidade: ', num2str(qualidade)]);
    
   
    fprintf('Tamanho original: %.2f bytes\n', tamanho_original);
    fprintf('Tamanho compactado: %.2f bytes\n', tamanho_compactado);
    fprintf('Taxa de compressão: %.4f bits por pixel\n', bpp);
    fprintf('PSNR: %.4f dB\n', PSNR);
end