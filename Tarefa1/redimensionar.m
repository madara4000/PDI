function novo_arquivo = redimensionar(imagem_entrada, tipo_interpolacao, fator_x, fator_y)
    img = imread(imagem_entrada);

    [linhas, colunas] = size(img);

    novas_linhas = round(linhas * fator_x);
    novas_colunas = round(colunas * fator_y);

    nova_img = zeros(novas_linhas, novas_colunas, 'uint8');


    if tipo_interpolacao == 1
        % Interpolação por vizinho mais próximo
        for i = 1:novas_linhas
            for j = 1:novas_colunas
                orig_x = round((i - 1) / fator_x) + 1;
                orig_y = round((j - 1) / fator_y) + 1;
                orig_x = min(max(orig_x, 1), linhas);
                orig_y = min(max(orig_y, 1), colunas);
                nova_img(i, j) = img(orig_x, orig_y);
            end
        end
    elseif tipo_interpolacao == 2
        % Interpolação bilinear
        for i = 1:novas_linhas
            for j = 1:novas_colunas
                orig_x = (i - 1) / fator_x + 1;
                orig_y = (j - 1) / fator_y + 1;
                x1 = floor(orig_x); x2 = ceil(orig_x);
                y1 = floor(orig_y); y2 = ceil(orig_y);
                x1 = min(max(x1, 1), linhas); x2 = min(max(x2, 1), linhas);
                y1 = min(max(y1, 1), colunas); y2 = min(max(y2, 1), colunas);
                Q11 = double(img(x1, y1)); Q12 = double(img(x1, y2));
                Q21 = double(img(x2, y1)); Q22 = double(img(x2, y2));
                wx2 = orig_x - x1; wx1 = 1 - wx2;
                wy2 = orig_y - y1; wy1 = 1 - wy2;
                novo_valor = wx1 * wy1 * Q11 + wx1 * wy2 * Q12 + wx2 * wy1 * Q21 + wx2 * wy2 * Q22;
                nova_img(i, j) = uint8(novo_valor);
            end
        end
    else
        error('Tipo de interpolação inválido. Use 1 para vizinho mais próximo ou 2 para interpolação bilinear.');
    end

    [~, nome, ext] = fileparts(imagem_entrada);
    novo_arquivo = [nome, '_redimensionada', ext];


    imwrite(nova_img, novo_arquivo);

end

