%Leia uma imagem em escala de ciunza
%Binarize a imagem utilizando a função9 im2bw (utiliza thresholds entre [0 1]);
%Crie uma função no Matlab/Octave que:
%receba uma imagem binarizada
%receba uma matriz descrevendo o elemento estruturante ;
%implemente a operação de erosão sobre a imagem  utilizando o elemento estruturante fornecido
%Crie uma nova imagem erodida
%retorne como resultado o nome  do arquivo gerado com a nova imagem
function imagem_erodida_nome = erosao(imagem, elemento_estrutante)
    matriz_extendida = extendMatrix(imagem, elemento_estrutante);
    imagem_erodida = zeros(size(imagem, 1), size(imagem, 2));
    tamanho_elem_est = size(elemento_estrutante);
    deslocamento_linhas = floor(tamanho_elem_est(1) / 2);
    deslocamento_colunas = floor(tamanho_elem_est(2) / 2);

    for linha = 1:size(imagem_erodida, 1)
        for coluna = 1:size(imagem_erodida, 2)
            imagem_erodida(linha, coluna) = aplicaErosao(matriz_extendida, elemento_estrutante, linha + deslocamento_linhas, coluna + deslocamento_colunas, deslocamento_colunas, deslocamento_linhas);
        end
    end

    imagem_erodida_nome = 'imagem_erodida.bmp';
    imwrite(imagem_erodida, imagem_erodida_nome);
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

function novo_valor = aplicaErosao(matriz, elemento_estrutante, linha, coluna, deslocamento_colunas, deslocamento_linhas)
    soma_elementos_do_elem_est = sum(sum(elemento_estrutante)) + 1;
    matriz_temporaria = matriz(linha - deslocamento_linhas:linha + deslocamento_linhas, coluna - deslocamento_colunas:coluna + deslocamento_colunas) .* elemento_estrutante;

    if (soma_elementos_do_elem_est == sum(sum(matriz_temporaria)) + 1)
        novo_valor = 1;
    else
        novo_valor = 0;
    end
end

