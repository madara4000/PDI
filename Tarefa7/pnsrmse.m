%Utilize os passos abaixo para implementar as métricas de qualidade PSNR
%(Peak Signal-to-Noise Ratio) e MSE (Mean Square Error)
%• Receba duas imagens em escala de cinza;
%• Garanta que tenham a mesma resolução;
%• Implemente uma função (ou duas funções separadas) que calcule as
%equações abaixo;
% Exiba os resultados de MSE e PSNR.
% Lê as duas imagens em escala de cinza
imagem1 = imread('C:\Users\yagom\projects\PDI\Tarefa7\lena_contraste.bmp');
imagem2 = imread('C:\Users\yagom\projects\PDI\Tarefa7\barbara_gray.bmp');

if size(imagem1, 3) == 3
    imagem1 = rgb2gray(imagem1);
end

if size(imagem2, 3) == 3
    imagem2 = rgb2gray(imagem2);
end

if size(imagem1) ~= size(imagem2)
    error('As imagens devem ter a mesma resolução.');
end

imagem1 = double(imagem1);
imagem2 = double(imagem2);

% Cálculo do MSE (Mean Square Error)
mse = mean((imagem1(:) - imagem2(:)).^2);

% Cálculo do PSNR (Peak Signal-to-Noise Ratio)
if mse == 0
    psnr = Inf;
else
    max_pixel_value = 255; % Para imagens de 8 bits
    psnr = 10 * log10((max_pixel_value^2) / mse);
end

fprintf('MSE: %.4f\n', mse);
fprintf('PSNR: %.4f dB\n', psnr);