function imagem_dilatada_nome = dilata(imagem, elemento_estrutante)
    matriz_extendida = extendMatrix(imagem, elemento_estrutante);
    imagem_dilatada = zeros(size(imagem, 1), size(imagem, 2));
    tamanho_elem_est = size(elemento_estrutante);
    deslocamento_linhas = floor(tamanho_elem_est(1) / 2);
    deslocamento_colunas = floor(tamanho_elem_est(2) / 2);

    for linha = 1:size(imagem_dilatada, 1)
        for coluna = 1:size(imagem_dilatada, 2)
            imagem_dilatada(linha, coluna) = aplicaDilatacao(matriz_extendida, elemento_estrutante, linha + deslocamento_linhas, coluna + deslocamento_colunas, deslocamento_colunas, deslocamento_linhas);
        end
    end

    imagem_dilatada_nome = 'imagem_dilatada.png';
    imwrite(imagem_dilatada, imagem_dilatada_nome);
end

function matriz_extendida = extendMatrix(matriz, filtro)
    tamanho_filtro = size(filtro);
    deslocamento_linhas = floor(tamanho_filtro(1) / 2);
    deslocamento_colunas = floor(tamanho_filtro(2) / 2);
    [linhas_matriz, colunas_matriz] = size(matriz);
    matriz_extendida = zeros(linhas_matriz + (2 * deslocamento_linhas), colunas_matriz + (2 * deslocamento_colunas));
    [linhas_ext, colunas_ext] = size(matriz_extendida);
    matriz_extendida(deslocamento_linhas + 1:linhas_ext - deslocamento_linhas, deslocamento_colunas + 1:colunas_ext - deslocamento_colunas) = matriz(:, :);
end

function novo_valor = aplicaDilatacao(matriz, elemento_estrutante, linha, coluna, deslocamento_colunas, deslocamento_linhas)
    matriz_temporaria = matriz(linha - deslocamento_linhas:linha + deslocamento_linhas, coluna - deslocamento_colunas:coluna + deslocamento_colunas) .* elemento_estrutante;
    novo_valor = sum(sum(matriz_temporaria)) ~= 0;
end



