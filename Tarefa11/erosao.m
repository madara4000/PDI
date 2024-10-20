%Leia uma imagem em escala de ciunza 
%Binarize a imagem utilizando a função9 im2bw (utiliza thresholds entre [0 1]);
%Crie uma função no Matlab/Octave que:
%receba uma imagem binarizada
%receba uma matriz descrevendo o elemento estruturante ;
%implemente a operação de erosão sobre a imagem  utilizando o elemento estruturante fornecido
%Crie uma nova imagem erodida
%retorne como resultado o nome  do arquivo gerado com a nova imagem
function img_erodida = erosao(imagem, ES)

    img = imread(imagem);

    if size(img, 3) == 3
        img_gray = rgb2gray(img);
    else
        img_gray = img;
    end

    img_bin = im2bw(img_gray, 0.5); 

    
    [linhas, colunas] = size(img_bin);
    
   
    [es_linhas, es_colunas] = size(ES);
    
    
    offset_linha = floor(es_linhas / 2);
    offset_coluna = floor(es_colunas / 2);
    
   
    img_erodida = ones(linhas, colunas);

    for i = 1:linhas
        for j = 1:colunas
           
            erode_pixel = 1;
            
        
            for m = 1:es_linhas
                for n = 1:es_colunas
                    if ES(m, n) == 1 
                 
                        linha_nova = i + (m - offset_linha);
                        coluna_nova = j + (n - offset_coluna);
                        
                        if linha_nova > 0 && linha_nova <= linhas && ...
                           coluna_nova > 0 && coluna_nova <= colunas
                           
                            if img_bin(linha_nova, coluna_nova) == 0
                                erode_pixel = 0; 
                            end
                        else
                            erode_pixel = 0; 
                        end
                    end
                end
            end
            
   
            img_erodida(i, j) = erode_pixel;
        end
    end

   
    img_erodida = uint8(img_erodida * 255); 

   
    nome_arquivo = 'imagem_erodida_manual.png';
    imwrite(img_erodida, nome_arquivo);

    disp(['Imagem erodida salva como: ', nome_arquivo]);
end