%function nova_figura = contraste(figura)
%Crie uma função
%Matlab Octave que:
%Receba uma imagens em escala de cinzas (ex.: img1
%Apresente o histograma da imagem recebida;
%Maximize o contraste da imagem, alargando a gama de valores de
%intensidade entre o mínimo e o máximo possível (0 a 255);
%Crie uma nova imagem com contraste alargado
%Gere o histograma da imagem criada;

% Retorne como resultado o nome do arquivo gerado com a nova imagem.
% Nome da função:
% function
% nova_figura = contraste(figura)
% Exemplo de chamada da função:
% contraste (‘lena_contraste.
% function nova_figura = contraste(figura)
    % Carrega a imagem
    img = imread(figura);
    
    % Verifica se a imagem está em escala de cinza
    if size(img, 3) == 3
        error('A imagem precisa estar em escala de cinza.');
    end
    
    % Apresenta o histograma da imagem original
    figure;
    subplot(1, 2, 1);
    imhist(img);
    title('Histograma da imagem original');
    
    % Maximizando o contraste (alargando a gama de intensidades)
    img_contraste = double(img);
    min_val = min(img_contraste(:));
    max_val = max(img_contraste(:));
    img_contraste = (img_contraste - min_val) * (255 / (max_val - min_val));
    img_contraste = uint8(img_contraste);
    
    % Gera o histograma da imagem com contraste ajustado
    subplot(1, 2, 2);
    imhist(img_contraste);
    title('Histograma da imagem com contraste ajustado');
    
    % Salva a nova imagem com contraste ajustado
    nova_figura = 'imagem_com_contraste_alargado.png';
    imwrite(img_contraste, nova_figura);
    
    % Exibe as imagens original e ajustada lado a lado
    figure;
    subplot(1, 2, 1);
    imshow(img);
    title('Imagem Original');
    subplot(1, 2, 2);
    imshow(img_contraste);
    title('Imagem com Contraste Alargado');
end