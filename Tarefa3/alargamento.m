%Utilize a função
%imadjust para alargamento de contraste, variando os
%seus parâmetros para:
%Transformação de intensidade linear identidade;
%Transformação de intensidade linear com ajuste variando entre max e
%min da imagem de entrada;

Transformação de intensidade com correção gama, usando valores de
gama < 1, gama = 1, gama > 1.
Gere um histograma para cada imagem transformada e compare com o
histograma da imagem original.
% Carregar uma imagem em escala de cinza
I = imread('barbara_gray.bmp');  % Você pode substituir pela imagem que deseja usar
I = im2double(I);  % Converter para double para operações de intensidade

% Transformação de intensidade linear identidade
I_linear_identity = imadjust(I, [0 1], [0 1]);

% Transformação de intensidade linear com ajuste variando entre min e max
I_linear_adjust = imadjust(I, stretchlim(I), []);

% Transformação de intensidade com correção gama (gama < 1)
I_gamma_low = imadjust(I, [], [], 0.5);

% Transformação de intensidade com correção gama (gama = 1)
I_gamma_equal = imadjust(I, [], [], 1);

% Transformação de intensidade com correção gama (gama > 1)
I_gamma_high = imadjust(I, [], [], 2);

% Exibir as imagens transformadas
figure;
subplot(2,3,1), imshow(I), title('Imagem Original');
subplot(2,3,2), imshow(I_linear_identity), title('Linear Identidade');
subplot(2,3,3), imshow(I_linear_adjust), title('Linear Ajustada');
subplot(2,3,4), imshow(I_gamma_low), title('Gama < 1');
subplot(2,3,5), imshow(I_gamma_equal), title('Gama = 1');
subplot(2,3,6), imshow(I_gamma_high), title('Gama > 1');

% Gerar e exibir os histogramas
figure;
subplot(2,3,1), imhist(I), title('Histograma Original');
subplot(2,3,2), imhist(I_linear_identity), title('Linear Identidade');
subplot(2,3,3), imhist(I_linear_adjust), title('Linear Ajustada');
subplot(2,3,4), imhist(I_gamma_low), title('Gama < 1');
subplot(2,3,5), imhist(I_gamma_equal), title('Gama = 1');
subplot(2,3,6), imhist(I_gamma_high), title('Gama > 1');