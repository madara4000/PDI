%Receba uma imagem em escala de cinzas;
% Decomponha com uma pirâmide de dois níveis (ver exemplo abaixo)
%sando dwt2
%Utilize waveletHaar
%Utilize wavelet Daubechies 10 (db10)
%%Exemplo: [cA,cH,cV,cD] = dwt2(X,’haar','mode','per');

imagem = imread('C:\Users\yagom\projects\PDI\Tarefa7\barbara_gray.bmp');


if size(imagem, 3) == 3
    imagem_gray = rgb2gray(imagem);
else
    imagem_gray = imagem;
end


imagem_gray = im2double(imagem_gray);


[cA1, cH1, cV1, cD1] = dwt2(imagem_gray, 'haar', 'mode', 'per');


[cA2, cH2, cV2, cD2] = dwt2(cA1, 'db10', 'mode', 'per');


figure;
subplot(2, 2, 1); imshow(cA1, []); title('Aproximação Haar (cA1)');
subplot(2, 2, 2); imshow(cH1, []); title('Detalhes Horizontais Haar (cH1)');
subplot(2, 2, 3); imshow(cV1, []); title('Detalhes Verticais Haar (cV1)');
subplot(2, 2, 4); imshow(cD1, []); title('Detalhes Diagonais Haar (cD1)');

figure;
subplot(2, 2, 1); imshow(cA2, []); title('Aproximação Daubechies (cA2)');
subplot(2, 2, 2); imshow(cH2, []); title('Detalhes Horizontais Daubechies (cH2)');
subplot(2, 2, 3); imshow(cV2, []); title('Detalhes Verticais Daubechies (cV2)');
subplot(2, 2, 4); imshow(cD2, []); title('Detalhes Diagonais Daubechies (cD2)');