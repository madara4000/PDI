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