function novoArquivo = medidas_distancia(nomeImagem, Xp, Yp, Xq, Yq)
    % Carrega a imagem em escala de cinza
    img = imread(nomeImagem);

    % Verifica se a imagem é em escala de cinza
    if size(img, 3) == 3
        error('A imagem fornecida não está em escala de cinza.');
    end

    % Binariza a imagem
    imagemBinaria = im2bw(img, 0.5);

    % Calcula as distâncias D4, D8 e DE
    D4 = abs(Xp - Xq) + abs(Yp - Yq);
    D8 = max(abs(Xp - Xq), abs(Yp - Yq));
    DE = sqrt((Xp - Xq)^2 + (Yp - Yq)^2);

    fprintf('Distância D4 entre P e Q: %.2f\n', D4);
    fprintf('Distância D8 entre P e Q: %.2f\n', D8);
    fprintf('Distância DE (Euclidiana) entre P e Q: %.2f\n', DE);

    % Determina se P e Q têm conectividade e calcula a distância DM
    if imagemBinaria(Xp, Yp) == 1 && imagemBinaria(Xq, Yq) == 1
        DM = calcula_distancia_menor(imagemBinaria, Xp, Yp, Xq, Yq);
        fprintf('P e Q estão conectados. Distância DM entre P e Q: %.2f\n', DM);
    else
        DM = Inf;
        fprintf('P e Q não estão conectados.\n');
    end

    % Salva a imagem binarizada
    novoArquivo = strcat('binarized_', nomeImagem);
    imwrite(imagemBinaria, novoArquivo);
    fprintf('Imagem binarizada salva como: %s\n', novoArquivo);
end

function DM = calcula_distancia_menor(imagem, Xp, Yp, Xq, Yq)
    % Inicializa variáveis
    [linhas, colunas] = size(imagem);
    visitados = zeros(linhas, colunas);
    fila = [Xp, Yp];
    distancia = 0;

    while ~isempty(fila)
        novaFila = [];
        for i = 1:size(fila, 1)
            x = fila(i, 1);
            y = fila(i, 2);
            visitados(x, y) = 1;

            % Verifica se chegou ao destino
            if x == Xq && y == Yq
                DM = distancia;
                return;
            end

            % Adiciona vizinhos não visitados
            for dx = -1:1
                for dy = -1:1
                    if abs(dx) + abs(dy) == 1 % Movimento ortogonal
                        nx = x + dx;
                        ny = y + dy;
                        if nx > 0 && nx <= linhas && ny > 0 && ny <= colunas && ...
                           imagem(nx, ny) == 1 && visitados(nx, ny) == 0
                            novaFila = [novaFila; nx, ny];
                        end
                    end
                end
            end
        end
        fila = novaFila; % Atualiza a fila
        distancia = distancia + 1; % Aumenta a distância
    end

    DM = Inf; % Se não encontrou caminho
end


