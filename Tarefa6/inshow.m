pkg load image

imagem = imread('C:\Users\yagom\projects\PDI\Tarefa6\barbara_gray.bmp');

if size(imagem, 3) == 3
    imagem_gray = rgb2gray(imagem);
else
    imagem_gray = imagem;
end

[M, N] = size(imagem_gray);
[U, V] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
D = sqrt(U.^2 + V.^2);  % Distância do centro

% 1. Eliminar Bordas Verticais
mascara1 = ones(M, N);
mascara1(:, round(N/2):end) = 0;  % Eliminar bordas verticais
img_filtrada1 = filtra_freq('C:\Users\yagom\projects\PDI\Tarefa6\barbara_gray.bmp', mascara1);

% 2. Passa Baixas
D0 = 30;
mascara2 = double(D <= D0);  % Filtro passa-baixa
img_filtrada2 = filtra_freq('C:\Users\yagom\projects\PDI\Tarefa6\barbara_gray.bmp', mascara2);

% 3. Passa Altas
mascara3 = double(D > D0);  % Filtro passa-alta
img_filtrada3 = filtra_freq('C:\Users\yagom\projects\PDI\Tarefa6\barbara_gray.bmp', mascara3);

% 4. Passa Faixa
D1 = 60;
mascara4 = double(D >= D0 & D <= D1);  % Filtro passa-faixa
img_filtrada4 = filtra_freq('C:\Users\yagom\projects\PDI\Tarefa6\barbara_gray.bmp', mascara4);

% 5. Rejeita Faixa
mascara5 = double(D < D0 | D > D1);  % Filtro rejeita-faixa
img_filtrada5 = filtra_freq('C:\Users\yagom\projects\PDI\Tarefa6\barbara_gray.bmp', mascara5);

