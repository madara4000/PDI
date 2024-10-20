
%Utilize os passos abaixo para aplicar a Transformada de Fourier Inversa e
%visualizar seu resultado
%• Receba a imagem transformada;
%• Aplique a Transformada de Fourier Inversa utilizando a função ifft2
%• Exiba a imagem reconstruída.
% Lê a imagem transformada (supondo que você já tenha uma imagem transformada)
function fouriaplicada = fourinversa(imagem)
    % Lê a imagem transformada
    imagem_transformada = imread(imagem); 



    imagem_transformada = im2double(imagem_transformada); 

    trans = imagem_transformada; 

    img_reconstruida = ifft2(trans);


    img_reconstruida = uint8(mat2gray(abs(img_reconstruida)) * 255);

   
    figure;
    imshow(img_reconstruida, []);
    title('Imagem Reconstruída da Transformada de Fourier Inversa');


    nome_arquivo_reconstruido = 'imagem_reconstruida.png';
    imwrite(img_reconstruida, nome_arquivo_reconstruido);

    disp(['Imagem reconstruída salva como: ', nome_arquivo_reconstruido]);
end
