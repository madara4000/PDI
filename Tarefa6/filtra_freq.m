%Crie uma função Matlab/Octave que:
%• Receba uma imagem em escala de cinzas;
%• Receba uma máscara para filtragem no domínio das frequências;
%• Transforme a imagem para o domínio de Fourier;
%• Posicione a frequência zero no centro;
%• Exiba e salve o espectro de Fourier em um arquivo imagem;
%• Aplique a máscara/filtro utilizando multiplicação;
%• Coloque o espectro novamente na posição original com ifftshift
%• Reconstrua a imagem filtrada;
%• Exiba a nova imagem filtrada;
%• Retorne como resultado o nome do arquivo gerado com a nova imagem.
%Nome da função:

%Exemplo de chamada da função:
%filtra_freq(‘lena.bmp’, mascara);
function img_filtrada = filtra_freq(imagem, mascara)
    imagem = imread(imagem);

    if size(imagem, 3) == 3
        imagem_gray = rgb2gray(imagem);
    else
        imagem_gray = imagem;
    end

    imagem_gray = double(imagem_gray);
    [M, N] = size(imagem_gray);

    X = fft2(imagem_gray);
    X_shifted = fftshift(X);

    if isempty(mascara)
        error('Máscara não pode ser vazia. Forneça uma máscara para filtrar.');
    end

    [m_mask, n_mask] = size(mascara);
    if m_mask ~= M || n_mask ~= N
        error('A máscara deve ter o mesmo tamanho que a imagem.');
    end

    X_filtrada = X_shifted .* mascara;

    img_reconstruida = ifft2(ifftshift(X_filtrada));
    img_reconstruida = uint8(mat2gray(abs(img_reconstruida)) * 255);

    figure;
    imshow(img_reconstruida, []);
    title('Imagem Filtrada');

    img_filtrada = img_reconstruida;
end

