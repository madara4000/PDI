
%Utilize as funções de erosão e dilatação desenvolvidas nas atividades
%anteriores para:
%Crie um script que aplique a operação de abertura sobre a imagem e
%Crie um script que aplique a operação de fechamento sobre a
%imagem e salve em um arquivo;
ES = [0 1 0; 
      1 1 1; 
      0 1 0]; 

imagem_original = 'C:\Users\yagom\projects\PDI\Tarefa11\coins.png';

img_erodida = erosao(imagem_original, ES);

img_abertura = dilata(img_erodida, ES);

nome_arquivo_abertura = 'imagem_abertura.png';
imwrite(img_abertura, nome_arquivo_abertura);

disp(['Imagem resultante da abertura salva como: ', nome_arquivo_abertura]);