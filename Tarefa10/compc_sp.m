function bpp = compc_sp(imagem)
imwrite(a, 'exemplo.png', ‘png');
function bpp = compc_sp(imagem)
    
    img = imread(imagem);
    

    nome_arquivo_saida = 'imagem_compactada.png';
    imwrite(img, nome_arquivo_saida, 'png');
    
    img_compactada = imread(nome_arquivo_saida);
 
    info_original = imfinfo(imagem);
    info_compactada = imfinfo(nome_arquivo_saida);
    
    tamanho_original = info_original.FileSize; 
    tamanho_compactado = info_compactada.FileSize; 
    
    num_pixels = size(img, 1) * size(img, 2); 
    
    bpp = (tamanho_compactado * 8) / num_pixels; 
    
  
    if isequal(img, img_compactada)
        disp('As imagens de entrada e gerada são iguais.');
    else
        disp('As imagens de entrada e gerada são diferentes.');
    end
    
   
    fprintf('Tamanho original: %.2f bytes\n', tamanho_original);
    fprintf('Tamanho compactado: %.2f bytes\n', tamanho_compactado);
    fprintf('Taxa de compressão: %.4f bits por pixel\n', bpp);
end