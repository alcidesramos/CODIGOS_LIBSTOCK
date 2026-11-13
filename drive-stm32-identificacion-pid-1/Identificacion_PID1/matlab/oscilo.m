clc ,clear all, close all
datos = readmatrix('LoggedData.csv');
datain = datos(:, 1);  % Primera columna
dataout = datos(:, 2);  % Segunda columna

figure (1)
plot(datain, 'b-', 'DisplayName', 'ENTRADA');
hold on
plot(dataout, 'r-', 'DisplayName', 'SALIDA');
legend;
xlabel('TIEMPO');
ylabel('RPM');
grid on;
