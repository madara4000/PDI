%Utilize os passos abaixo para aplicar a Transformada de Fourier e
%visualizar seu resultado
%Receba uma imagem em escala de cinza;
 %Aplique a Transformada de Fourier utilizando a função fft2
 %Exiba o resultado, como mostrado abaixo:
%Como o resultado está em números complexos é preciso visualizar o
%módulo utilizando a função abs;
%Como os valores são muito altos, devemos utilizar a função log
%para melhor visualização;
%imshow(log(abs(trans)), []);
¨% Para posicionar a frequência zero no centro, utilize a função fftshift
% Exiba o resultado.
% Lê a imagem em escala de cinza
imagem = imread('C:\Users\yagom\projects\PDI\Tarefa6\barbara_gray.bmp');

% Verifica se a imagem é colorida e converte para escala de cinza se necessário
if size(imagem, 3) == 3
    imagem_gray = rgb2gray(imagem);
else
    imagem_gray = imagem; % Se já estiver em escala de cinza
end

% Aplica a Transformada de Fourier bidimensional
trans = fft2(double(imagem_gray));

% Centraliza a frequência zero no centro da imagem
trans_shifted = fftshift(trans);

% Calcula o módulo da transformada
magnitude = abs(trans_shifted);

% Aplica a escala logarítmica para melhor visualização
magnitude_log = log(magnitude + 1); % Adiciona 1 para evitar log(0)

% Exibe o resultado
imshow(magnitude_log, []);
title('Transformada de Fourier - Magnitude (Escala Logarítmica)');