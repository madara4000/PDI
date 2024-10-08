function imagem_realcada = realce(imagem)
%Crie uma função
%Matlab Octave que:
%Receba uma imagens em escala de cinzas;
%Realce a imagem aplicando uma convolução da imagem com a máscara
%do Laplaciano apresentada abaixo;
%Crie uma nova imagem realçada;
%Retorne como resultado o nome do arquivo gerado com a nova imagem.
 % Carregar a imagem em escala de cinza
    img = imread(imagem);
    
    % Verificar se a imagem está em escala de cinza
    if size(img, 3) == 3
        img = rgb2gray(img); % Converter para escala de cinza se for RGB
    end

    % Definir a máscara do Laplaciano
    laplacian_mask = [0 -1 0; -1 4 -1; 0 -1 0];
    
    % Aplicar a convolução da imagem com a máscara do Laplaciano
    enhanced_img = conv2(double(img), laplacian_mask, 'same');
    
    % Normalizar a imagem resultante para o intervalo [0, 255]
    enhanced_img = uint8(mat2gray(enhanced_img) * 255);
    
    % Gerar um nome para o arquivo de saída
    [~, name, ext] = fileparts(imagem);
    output_filename = strcat(name, '_enhanced', ext);
    
    % Salvar a nova imagem
    imwrite(enhanced_img, output_filename);
    
    % Retornar o nome do arquivo de saída
    disp(['Imagem realçada salva como: ', output_filename]);
end