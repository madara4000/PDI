function inmodelosderuido = modelosderuido(img,tipo)
img= imread(imagemlida);
switch tipo
    case '1'
    imnoise(img,'gaussian',0,0.01);
    case '2'
    imnoise(img,'gaussian',30,0.01);
    case '3'
    imnoise(img,'gaussian',50,0.05);
    case '4'
    imnoise(img,'poisson');
    case '5'
     imnoise(img,'salt & pepper',2);
    case '6'
     imnoise(img,'salt & pepper',10);
    otherwise
        error ("numero invalidado");
end 
        imshow(inmodelosderuido);
    title(['Imagem com Ruído do Tipo ', tipo]);
end
