function img_quantizada=Quantiza(entrada, saida, bitsY, bitsCb, bitsCr)
%A função deve:
%1. Ler a imagem de entrada
%2. Converter de RGB para YCbCr
%3. Salvar os canais Y, Cb, Cr em três matrizes separadas
%4. Realizar quantização separadamente para cada canal de acordo com o número de bits
%indicado como parâmetros da função
%5. Combinar os canais quantizados em uma nova imagem YCbCr
%6. Retornar a imagem resultante ao espaço de cores RGB
%7. Apresentar e salvar a imagem quantizada
%• Teste:
%1. Quantizar com 8 bits em Y, 2 bits em Cb e 2 bits em Cr e verificar a imagem resultante