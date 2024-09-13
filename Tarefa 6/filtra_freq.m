function img_filtrada = filtra_freq(imagem, mascara)
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