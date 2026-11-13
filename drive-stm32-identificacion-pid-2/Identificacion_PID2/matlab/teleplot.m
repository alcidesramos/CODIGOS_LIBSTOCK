clc ,clear all, close all

data = readmatrix('teleplot.csv');


% Extraer columna 2
data_out_tele = data(:, 2);  % Segunda columnat_tele1);


figure(1);
plot(data_out_tele, 'r');
title('SALIDA');
xlabel('Tiempo');
ylabel('PWM');
grid on;

