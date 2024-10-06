function imfronteira = fronteira(arquivo, tipo, Xp, Yp)

    imagem = imread(arquivo);
    
    if size(imagem, 3) == 3
        imagem = rgb2gray(imagem);
    end
    
    
    imagemBin = im2bw(imagem);
    
 
    [linhas, colunas] = size(imagemBin);
    
    imfronteira = zeros(linhas, colunas);
    

    vizinhos = [-1, -1; -1, 0; -1, 1; 0, -1; 0, 1; 1, -1; 1, 0; 1, 1];
    
    % Percorrer a imagem e determinar a fronteira
    for i = 2:linhas-1
        for j = 2:colunas-1
            if imagemBin(i, j) == 1
             
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
    
   
    imshow(imfronteira);
end