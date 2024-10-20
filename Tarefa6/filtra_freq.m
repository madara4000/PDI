%Crie uma função Matlab/Octave que:
%• Receba uma imagem em escala de cinzas;
%• Receba uma máscara para filtragem no domínio das frequências;
%• Transforme a imagem para o domínio de Fourier;
%• Posicione a frequência zero no centro;
%• Exiba e salve o espectro de Fourier em um arquivo imagem;
%• Aplique a máscara/filtro utilizando multiplicação;
%• Coloque o espectro novamente na posição original com ifftshift
%• Reconstrua a imagem filtrada;
%• Exiba a nova imagem filtrada;
%• Retorne como resultado o nome do arquivo gerado com a nova imagem.
%Nome da função:

%Exemplo de chamada da função:
%filtra_freq(‘lena.bmp’, mascara);

function img_filtrada = filtra_freq(imagem, mascara)
imagem = imread('C:\Users\yagom\projects\PDI\Tarefa6\barbara_gray.bmp');

if size(imagem, 3) == 3
    imagem_gray = rgb2gray(imagem);
else
    imagem_gray = imagem; 
end

imagem_gray = double(imagem_gray);


[M, N] = size(imagem_gray);


X = zeros(M, N);

for k = 1:M
    for l = 1:N
        soma = 0;
        for m = 1:M
            for n = 1:N
               
                soma = soma + imagem_gray(m, n) * exp(-1i * 2 * pi * ((k-1)*(m-1)/M + (l-1)*(n-1)/N));
            end
        end
        X(k, l) = soma;
    end
end

X_shifted = fftshift(X);


magnitude = abs(X_shifted);


magnitude_log = log(magnitude + 1);

figure;
imshow(magnitude_log, []);
title('Espectro de Fourier - Magnitude (Escala Logarítmica)');


nome_arquivo_espectro = 'espectro_fourier_manual.png';
imwrite(uint8(mat2gray(magnitude_log) * 255), nome_arquivo_espectro);


img_reconstruida = zeros(M, N);
for m = 1:M
    for n = 1:N
        soma_inv = 0;
        for k = 1:M
            for l = 1:N
               
                soma_inv = soma_inv + X(k, l) * exp(1i * 2 * pi * ((k-1)*(m-1)/M + (l-1)*(n-1)/N));
            end
        end
        img_reconstruida(m, n) = soma_inv / (M * N); 
    end
end


img_reconstruida = uint8(mat2gray(abs(img_reconstruida)) * 255);


figure;
imshow(img_reconstruida, []);
title('Imagem Reconstruída');


nome_arquivo_reconstruido = 'imagem_reconstruida_manual.png';
imwrite(img_reconstruida, nome_arquivo_reconstruido);