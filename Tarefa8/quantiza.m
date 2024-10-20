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
function img_quantizada = quantiza(entrada, saida, bitsY, bitsCb, bitsCr)

    img_rgb = imread(entrada);


    img_ycbcr = rgb2ycbcr(img_rgb);


    Y = img_ycbcr(:, :, 1);
    Cb = img_ycbcr(:, :, 2);
    Cr = img_ycbcr(:, :, 3);

    Y_quantizado = round(Y / (256 / (2^bitsY)));

    Cb_quantizado = round(Cb / (256 / (2^bitsCb)));

    Cr_quantizado = round(Cr / (256 / (2^bitsCr)));

    img_ycbcr_quantizada = cat(3, Y_quantizado, Cb_quantizado, Cr_quantizado);

    img_quantizada = ycbcr2rgb(uint8(img_ycbcr_quantizada));


    figure;
    imshow(img_quantizada);
    title('Imagem Quantizada');

    imwrite(img_quantizada, saida);
end
