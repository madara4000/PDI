function figura_out = restaura_media(figura_in, N)
    % Lê a imagem de entrada
    img = imread(figura_in);

    % Verifica se a imagem é em tons de cinza
    if size(img, 3) > 1
        img = rgb2gray(img);
    end

    % Cria o filtro de média
    h = ones(N) / N^2;

    % Aplica a filtragem por convolução
    img_filtrada = conv2(img, h, 'same');

    % Salva a imagem filtrada
    figura_out = 'img_restaurada.jpg';
    imwrite(uint8(img_filtrada), figura_out);
end