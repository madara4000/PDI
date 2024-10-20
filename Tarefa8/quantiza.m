%A função deve:
%1. Ler a imagem de entrada
%2. Converter de RGB para YCbCr
%3. Salvar os canais Y, Cb, Cr em três matrizes separadas
%4. Realizar quantização separadamente para cada canal de acordo com o número de bits
%indicado como parâmetros da função
%5. Combinar os canais quantizados em uma nova imagem YCbCr
%6. Retornar a imagem resultante ao espaço de cores RGB
%7. Apresentar e salvar a imagem quantizada
%• Teste:
%1. Quantizar com 8 bits em Y, 2 bits em Cb e 2 bits em Cr e verificar a imagem resultante
function img_quantizada = Quantiza(entrada, saida, bitsY, bitsCb, bitsCr)
    % 1. Lê a imagem de entrada
    img_rgb = imread(entrada);
    
    % 2. Converte de RGB para YCbCr
    img_ycbcr = rgb2ycbcr(img_rgb);
    
    % 3. Salva os canais Y, Cb, Cr em três matrizes separadas
    Y = img_ycbcr(:, :, 1);
    Cb = img_ycbcr(:, :, 2);
    Cr = img_ycbcr(:, :, 3);
    
    % 4. Realiza quantização separadamente para cada canal
    % Quantização do canal Y
    Y_quantizado = round(Y / (256 / (2^bitsY)));
    
    % Quantização do canal Cb
    Cb_quantizado = round(Cb / (256 / (2^bitsCb)));
    
    % Quantização do canal Cr
    Cr_quantizado = round(Cr / (256 / (2^bitsCr)));
    
    % 5. Combina os canais quantizados em uma nova imagem YCbCr
    img_ycbcr_quantizada = cat(3, Y_quantizado, Cb_quantizado, Cr_quantizado);
    
    % 6. Retorna a imagem resultante ao espaço de cores RGB
    img_quantizada = ycbcr2rgb(uint8(img_ycbcr_quantizada));
    
    % 7. Apresenta e salva a imagem quantizada
    figure;
    imshow(img_quantizada);
    title('Imagem Quantizada');
    
    % Salva a imagem quantizada
    imwrite(img_quantizada, saida);
end