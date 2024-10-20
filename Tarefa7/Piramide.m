% Passo 1: Carregar o pacote LTFAT
pkg load ltfat;

% Passo 2: Carregar a imagem em escala de cinzas
img = imread('C:\Users\yagom\projects\PDI\Tarefa7\barbara_gray.bmp'); % Coloque o caminho correto para sua imagem


% Passo 3: Verificar se a imagem já está em escala de cinzas
if ndims(img) == 3
    img = rgb2gray(img);
end


[cA1, cH1, cV1, cD1] = fwt2(img, 'haar', 'mode', 'per'); % Primeiro nível


[cA2, cH2, cV2, cD2] = fwt2(cA1, 'haar', 'mode', 'per'); % Segundo nível


[cA1_db10, cH1_db10, cV1_db10, cD1_db10] = fwt2(img, 'db10', 'mode', 'per'); % Primeiro nível


[cA2_db10, cH2_db10, cV2_db10, cD2_db10] = fwt2(cA1_db10, 'db10', 'mode', 'per'); % Segundo nível


figure;
subplot(2, 4, 1); imshow(img, []); title('Imagem Original');
subplot(2, 4, 2); imshow(cA1, []); title('cA1 (Haar)');
subplot(2, 4, 3); imshow(cH1, []); title('cH1 (Haar)');
subplot(2, 4, 4); imshow(cD1, []); title('cD1 (Haar)');
subplot(2, 4, 5); imshow(cA2, []); title('cA2 (Haar)');

subplot(2, 4, 6); imshow(cA1_db10, []); title('cA1 (Daubechies 10)');
subplot(2, 4, 7); imshow(cH1_db10, []); title('cH1 (Daubechies 10)');
subplot(2, 4, 8); imshow(cD1_db10, []); title('cD1 (Daubechies 10)');


