Utilize os passos abaixo para aplicar a Transformada de Fourier e
visualizar seu resultado
• Receba uma imagem em escala de cinza;
• Aplique a Transformada de Fourier utilizando a função fft2
• Exiba o resultado, como mostrado abaixo:
Como o resultado está em números complexos é preciso visualizar o
módulo utilizando a função abs;
Como os valores são muito altos, devemos utilizar a função log
para melhor visualização;
imshow(log(abs(trans)), []);
• Para posicionar a frequência zero no centro, utilize a função fftshift
• Exiba o resultado.