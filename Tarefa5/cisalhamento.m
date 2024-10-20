
%Exercício 2: Transformação de Geométrica
%Implemente uma função para implementar a transformação geométrica
%denominada cisalhamento:
%• Receba o nome de uma imagem em escala de cinza;
%• Receba os parâmetros cisalhamento vertical (cv) e cisalhamento
%horizontal (ch) para aplicar a correção gama; Quando cv =0 não há
%%• Dica: use a função de transformação afim implementada.
%• Crie uma nova imagem após cisalhamento;
%• Retorne como resultado o nome do arquivo gerado com a nova imagem.
%Exemplo de chamada da função:
%teste1 = cisalhamento('lena_contraste.bmp', 0.2, 0);
%teste2 = cisalhamento('lena_contraste.bmp', 0, 0.25);
%teste3 = cisalhamento('lena_contraste.bmp', 0.25, 0.1);

function cisalhada = cisalhamento(imagem, cv, ch)

    I = imread(imagem);
    H = size(I, 1);
    W = size(I, 2);

    cisalhada = zeros(size(I), 'uint8');

    if ch == 0 && cv >= 0
        for v = 1:H
            for w = 1:W
                valor = I(v, w);
                x = v + cv * w;
                y = w;
                if x > 0 && x <= H && y > 0 && y <= W
                    cisalhada(uint16(x), uint16(y)) = valor;
                end
            end
        end
        figura_nome = 'lena_cisalhamento_vertical.bmp';
    elseif ch >= 0 && cv == 0
        for v = 1:H
            for w = 1:W
                valor = I(v, w);
                x = v;
                y = ch * v + w;
                if x > 0 && x <= H && y > 0 && y <= W
                    cisalhada(uint16(x), uint16(y)) = valor;
                end
            end
        end
        figura_nome = 'lena_cisalhamento_horizontal.bmp';
    else
        for v = 1:H
            for w = 1:W
                valor = I(v, w);
                x = v + cv * w;
                y = ch * v + w;
                if x > 0 && x <= H && y > 0 && y <= W
                    cisalhada(uint16(x), uint16(y)) = valor;
                end
            end
        end
        figura_nome = 'lena_cisalhamento_horizontal_vertical.bmp';
    end


    figure, imshow(uint8(I)); title('Imagem Original');
    figure, imshow(cisalhada); title('Imagem Cisalhada');

    imwrite(cisalhada, figura_nome);
    disp(['Imagem cisalhada salva como: ', figura_nome]);
end

