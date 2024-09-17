function decompondo(verde,azul,vermelho)=decompoem(imagem);
    vermelho = imagem;
    verde = imagem;
    azul = imagem;
    
    % Zera os canais das outras cores nos 3 
    vermelho(:, :, 2:3) = 0;
    
   
    verde(:, :, [1, 3]) = 0;
    
    
    azul(:, :, 1:2) = 0;
    

    figure;
    subplot(1, 3, 1), imshow(vermelho), title('Tons de Vermelho');
    subplot(1, 3, 2), imshow(azul), title('Tons de Verde');
    subplot(1, 3, 3), imshow(azul), title('Tons de Azul');
end