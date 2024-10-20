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

    if size(img, 3) == 3
        img = rgb2gray(img);
    end


    laplacian_mask = [0 -1 0; -1 4 -1; 0 -1 0];

    enhanced_img = conv2(double(img), laplacian_mask, 'same');


    enhanced_img = uint8(mat2gray(enhanced_img) * 255);


    [~, name, ext] = fileparts(imagem);
    output_filename = strcat(name, '_realçada', ext);


    imwrite(enhanced_img, output_filename);

    disp(['Imagem realçada salva como: ', output_filename]);
end
