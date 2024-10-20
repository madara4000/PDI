%Utilize os passos abaixo para implementar o cálculo da entropia de uma
%imagem
% Receba uma imagem em escala de cinza;
% Implemente uma função que calcule as equações abaixo;
%OBS: Log é logaritmo de base 2
% Exiba os resultados da entropia H.
function H = calcular_entropia(imagem)
    % Certifique-se de que a imagem está em escala de cinza
    if size(imagem, 3) == 3
        imagem = rgb2gray(imagem); 
    end


    histograma = imhist(imagem);
    
 
    probabilidades = histograma / numel(imagem);
    

    probabilidades(probabilidades == 0) = [];
    

    H = -sum(probabilidades .* log2(probabilidades));
    
  
    fprintf('A entropia da imagem é: %.4f\n', H);
end