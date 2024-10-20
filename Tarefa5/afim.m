
%Implemente uma função para implementar a transformação afim:
%• Receba as coordenadas na imagem de entrada (v,w);
%• Receba a matriz de transformação afim.
%• Retorne as coordenadas mapeadas para a imagem de saída (x,y).
%Nome da função:

%Exemplo de chamada da função:
%[x, y] = afim(10, 5, T);
function [x y] = afim(v, w, T)
v = 10; 
w = 5;  


theta = 30; % ângulo em graus
T = [cosd(theta) -sind(theta) 10; 
     sind(theta) cosd(theta) 5; 
     0          0           1];


coord_homogeneas = [v; w; 1]; 


x = T(1,1) * coord_homogeneas(1) + T(1,2) * coord_homogeneas(2) + T(1,3) * coord_homogeneas(3);
y = T(2,1) * coord_homogeneas(1) + T(2,2) * coord_homogeneas(2) + T(2,3) * coord_homogeneas(3);

fprintf('Novas coordenadas: (%.2f, %.2f)\n', x, y);