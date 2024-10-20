%saida = quantiza(entrada, bitsR, bitsG, bitsB);
%inread=entrada;
function img_quantizada = quantiza(entrada, bitsR, bitsG, bitsB)

    img_rgb = imread(entrada);
    
    if size(img_rgb, 3) ~= 3
        error('A imagem deve ser uma imagem colorida (RGB).');
    end
    

    R = img_rgb(:, :, 1);
    G = img_rgb(:, :, 2);
    B = img_rgb(:, :, 3);

    Q_R = 256 / (2^bitsR); 
    Q_G = 256 / (2^bitsG); 
    Q_B = 256 / (2^bitsB); 
    

    R_quantizado = floor(R / Q_R) * Q_R + Q_R / 2;
    G_quantizado = floor(G / Q_G) * Q_G + Q_G / 2;
    B_quantizado = floor(B / Q_B) * Q_B + Q_B / 2;

    img_quantizada = uint8(cat(3, R_quantizado, G_quantizado, B_quantizado));
    

    figure;
    imshow(img_quantizada);
    title('Imagem Quantizada');
 
    nome_arquivo_saida = 'imagem_quantizada.png';
    imwrite(img_quantizada, nome_arquivo_saida);
    
    disp(['Imagem quantizada salva como: ', nome_arquivo_saida]);
end