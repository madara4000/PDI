imagem = imread('C:\Users\yagom\projects\PDI\Tarefa6\barbara_gray.bmp');

if size(imagem, 3) == 3
    imagem_gray = rgb2gray(imagem);
else
    imagem_gray = imagem;
end

trans = fft2(double(imagem_gray));
trans_shifted = fftshift(trans);
magnitude = abs(trans_shifted);
magnitude_log = log(magnitude + 1);

imshow(magnitude_log, []);
title('Transformada de Fourier - Magnitude (Escala Logarítmica)');
imwrite(magnitude_log / max(magnitude_log(:)), 'transformada_magnitude_log.png');

img_reconstruida = ifft2(ifftshift(trans_shifted));
img_reconstruida = real(img_reconstruida);

figure;
imshow(img_reconstruida, []);
title('Imagem Reconstruída após Transformada de Fourier Inversa');

