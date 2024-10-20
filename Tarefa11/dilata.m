%Leia uma imagem em escala de cinzas;
%Binarizea imagem utilizando a função im2bw (utiliza thresholds entre [0 1]);
%Crie uma função Matlab Octave que:
%eceba uma imagens binzarizada
%Receba uma matriz descrevendo o elemento estruturante;
%Implemente a operação de dilatação sobre a imagem utilizando o elemento
%estruturante fornecido;
%Crie uma nova imagem dilatada;
%Retorne como resultado o nome do arquivo gerado com a nova imagem.

function img_dilatada = dilata(imagem, ES)
   
    img = imread(imagem);

if size(imagem, 3) == 3

    imagem_gray = rgb2gray(img);
else
   
    imagem_gray = img;
end
   

    img_bin = im2bw(img_gray, 0.5); 

   
    [linhas, colunas] = size(img_bin);
    
    [es_linhas, es_colunas] = size(ES);
    
    offset_linha = floor(es_linhas / 2);
    offset_coluna = floor(es_colunas / 2);
    
  
    img_dilatada = zeros(linhas, colunas);

  
    for i = 1:linhas
        for j = 1:colunas
            if img_bin(i, j) == 1  
             
                for m = 1:es_linhas
                    for n = 1:es_colunas
                        if ES(m, n) == 1  
                          
                            linha_nova = i + (m - offset_linha);
                            coluna_nova = j + (n - offset_coluna);
                            
                         
                            if linha_nova > 0 && linha_nova <= linhas && ...
                               coluna_nova > 0 && coluna_nova <= colunas
                                img_dilatada(linha_nova, coluna_nova) = 1;
                            end
                        end
                    end
                end
            end
        end
    end

    
    img_dilatada = uint8(img_dilatada * 255); 


    nome_arquivo = 'imagem_dilatada_manual.png';
    imwrite(img_dilatada, nome_arquivo);
    
    
    disp(['Imagem dilatada salva como: ', nome_arquivo]);
end