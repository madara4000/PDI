function [verde, azul, vermelho] = decompoem(imagem)

    imagemrgb = imread(imagem);
    img_rgb = im2double(imagemrgb);

    vermelho = zeros(size(img_rgb));
    verde = zeros(size(img_rgb));
    azul = zeros(size(img_rgb));

    vermelho(:, :, 1) = img_rgb(:, :, 1);
    vermelho(:, :, 2:3) = 0;

    verde(:, :, 2) = img_rgb(:, :, 2);
    verde(:, :, [1, 3]) = 0;

    azul(:, :, 3) = img_rgb(:, :, 3);
    azul(:, :, 1:2) = 0;

    figure;
    subplot(1, 3, 1), imshow(vermelho), title('Tons de Vermelho');
    subplot(1, 3, 2), imshow(verde), title('Tons de Verde');
    subplot(1, 3, 3), imshow(azul), title('Tons de Azul');
end

