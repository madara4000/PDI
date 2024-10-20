
%Crie uma função
%Matlab Octave que:
%Receba uma imagens em escala de cinzas;
%Suavize a imagem aplicando uma convolução da imagem com a máscara
%apresentada abaixo;
%Crie uma nova imagem suavizada;
%Retorne como resultado o nome do arquivo gerado com a nova imagem.
function imagem_suavizada = suaviza(imagem)
    
    img = imread(imagem);
    
 
    if size(img, 3) == 3
        
        img_gray = rgb2gray(img);
    else
        img_gray = img; 
    end

    img_gray = double(img_gray);
    
    
    mascara = (1/9) * [1 1 1; 
                       1 1 1; 
                       1 1 1];

    [linhas, colunas] = size(img_gray);
    [m_linhas, m_colunas] = size(mascara);
    
    imagem_suavizada = zeros(linhas, colunas);
    
    
    offset_linha = floor(m_linhas / 2);
    offset_coluna = floor(m_colunas / 2);
    
    for i = 1:linhas
        for j = 1:colunas
            soma = 0; 
            
         
            for m = 1:m_linhas
                for n = 1:m_colunas
                  
                    linha_nova = i + (m - offset_linha);
                    coluna_nova = j + (n - offset_coluna);
                    
                   
                    if linha_nova > 0 && linha_nova <= linhas && ...
                       coluna_nova > 0 && coluna_nova <= colunas
                        soma = soma + img_gray(linha_nova, coluna_nova) * mascara(m, n);
                    end
                end
            end
            
           a
            imagem_suavizada(i, j) = soma;
        end
    end
   
    imagem_suavizada = uint8(imagem_suavizada);
    
 
    nome_arquivo = 'imagem_suavizada.png';
    imwrite(imagem_suavizada, nome_arquivo);
    

    disp(['Imagem suavizada salva como: ', nome_arquivo]);
end