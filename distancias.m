function [D4, D8, DE, DM] = distancias(arquivo, Xp, Yp, Xq, Yq)
    img = imread(arquivo);

    if size(img, 3) == 3
        error('A imagem fornecida não está em escala de cinza.');
    end

    imagemBinaria = im2bw(img, 0.5);
    
    P = [Xp, Yp];
    Q = [Xq, Yq];
    
    D4 = abs(P(1) - Q(1)) + abs(P(2) - Q(2)); 
    D8 = max(abs(P(1) - Q(1)), abs(P(2) - Q(2)));
    DE = sqrt((P(1) - Q(1))^2 + (P(2) - Q(2))^2); 
    
    fprintf('Distância D4 entre P e Q: %.2f\n', D4);
    fprintf('Distância D8 entre P e Q: %.2f\n', D8);
    fprintf('Distância DE (Euclidiana) entre P e Q: %.2f\n', DE);
    connectivity = 8;
    labeledImage = bwlabel(imagemBinaria, connectivity);

     labelP = labeledImage(P(1), P(2));
    labelQ = labeledImage(Q(1), Q(2));
    
    if labelP == labelQ && labelP ~= 0
        estaConectado = true;
        distanceMap = bwdistgeodesic(imagemBinaria, P(2), P(1), 'quasi-euclidean');
        DM = distanceMap(Q(1), Q(2));
        fprintf('P e Q estão conectados. Distância DM (Menor Caminho) entre P e Q: %.2f\n', DM);
    else
        estaConectado = false;
        DM = inf;
        fprintf('P e Q não estão conectados.\n');
    end
   
    novoNomeImagem = strcat('binarized_', arquivo);
    imwrite(imagemBinaria, newImageName);
    
    fprintf('Imagem binarizada salva como: %s\n', novoNomeImagem);
    
    fprintf('Nome do novo arquivo gerado: %s\n', novoNomeImagem);
end
