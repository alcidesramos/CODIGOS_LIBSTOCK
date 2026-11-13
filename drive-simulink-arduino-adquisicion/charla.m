clc, close all
%calcula nuemro de datos
cuantos=length(datos);

x=linspace(0,muestreo*cuantos,cuantos);
plot(x,datos);
