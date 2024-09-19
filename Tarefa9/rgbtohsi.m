function Saida = rgbtohsi(entrada)
   
    imagem = imread(entrada);
    imagemrgb = im2double(imagem); 
    
 
    R = imagemrgb(:,:,1);
    G = imagemrgb(:,:,2);
    B = imagemrgb(:,:,3);
    
    soma = R + G + B + eps; 
    g = G ./ soma;
    r = R ./ soma;
    b = B ./ soma;
    
   
    min_RGB = min(min(R, G), B); 
    s = 1 - 3 .* (min_RGB ./ soma); 
    
    
    num = 0.5 * ((R - G) + (R - B)); 
    div = sqrt((R - G).^2 + (R - B) .* (G - B)); 
    h = acos(num ./ (div + eps));
    
   
    h(B > G) = 2 * pi - h(B > G);
    h = h / (2 * pi); 
    
 
    i1 = (R + G + B) / 3; 
    
    
    figure;
    subplot(2, 2, 1), imshow(imagemrgb), title('Imagem RGB Original');
    subplot(2, 2, 2), imshow(h), title('Matiz (h)');
    subplot(2, 2, 3), imshow(s), title('Saturação (s)');
    subplot(2, 2, 4), imshow(i1), title('Intensidade (i)');
    
    Saida.h = h;
    Saida.s = s;
    Saida.i1 = i1;
end
