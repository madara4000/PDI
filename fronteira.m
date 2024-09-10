function imfronteira = fronteira(arquivo, tipo, Xp, Yp)
    % Carregar a imagem em escala de cinza
    imagem = imread(arquivo);
    
    % Verificar se a imagem é colorida e converter para escala de cinza, se necessário
    if size(imagem, 3) == 3
        imagem = rgb2gray(imagem);
    end
    
    % Binarizar a imagem usando im2bw
    imagemBin = im2bw(imagem);
    
    % Obter o tamanho da imagem
    [linhas, colunas] = size(imagemBin);
    
    % Inicializar a imagem de saída como uma matriz preta
    imfronteira = zeros(linhas, colunas);
    
    % Definir os deslocamentos para os vizinhos de 8 conectividade
    vizinhos = [-1, -1; -1, 0; -1, 1; 0, -1; 0, 1; 1, -1; 1, 0; 1, 1];
    
    % Percorrer a imagem e determinar a fronteira
    for i = 2:linhas-1
        for j = 2:colunas-1
            if imagemBin(i, j) == 1
                % Verificar se é uma borda interna ou externa
                eFronteira = false;
                for k = 1:8
                    vizinhoX = i + vizinhos(k, 1);
                    vizinhoY = j + vizinhos(k, 2);
                    if tipo == 0  % Fronteira interna
                        if imagemBin(vizinhoX, vizinhoY) == 0
                            eFronteira = true;
                            break;
                        end
                    elseif tipo == 1  % Fronteira externa
                        if imagemBin(vizinhoX, vizinhoY) == 1
                            eFronteira = true;
                            break;
                        end
                    end
                end
                
                % Marcar a fronteira na imagem de saída
                if eFronteira
                    imfronteira(i, j) = 1;
                end
            end
        end
    end
    
    % Mostrar a imagem de saída
    imshow(imfronteira);
end