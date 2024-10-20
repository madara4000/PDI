pkg load image;
ES = [0 1 0; 
      1 1 1; 
      0 1 0]; 
imagem_original = 'C:\Users\yagom\projects\PDI\Tarefa11\coins.png';

img_dilatada = dilata(imagem_original, ES);

img_fechamento = erosao(img_dilatada, ES);

nome_arquivo_fechamento = 'imagem_fechamento.png';
imwrite(img_fechamento, nome_arquivo_fechamento);

disp(['Imagem resultante do fechamento salva como: ', nome_arquivo_fechamento]);