function inmodelosderuido = modelosderuido(imagemlida, tipo)
    % Read the input image
    img = imread(imagemlida);

    % Display the received type for debugging
    disp(['Tipo recebido: ', tipo]);

    % Add noise based on the specified type
    switch tipo
        case '1'
            inmodelosderuido = imnoise(img, 'gaussian', 0, 0.01);
        case '2'
            inmodelosderuido = imnoise(img, 'gaussian', 30, 0.01);
        case '3'
            inmodelosderuido = imnoise(img, 'gaussian', 50, 0.05);
        case '4'
            inmodelosderuido = imnoise(img, 'poisson');
        case '5'
            inmodelosderuido = imnoise(img, 'salt & pepper', 0.02); % Adjusted density
        case '6'
            inmodelosderuido = imnoise(img, 'salt & pepper', 0.1); % Adjusted density
        otherwise
            error(['Número invalidado: ', tipo]);
    end

    % Display the noisy image
    imshow(inmodelosderuido);
    title(['Imagem com Ruído do Tipo ', tipo]);
end

