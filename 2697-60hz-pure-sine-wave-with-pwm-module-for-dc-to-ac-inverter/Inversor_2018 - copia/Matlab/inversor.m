clc,close all,clear

frecuencia=60;
muestras=120;

x=linspace(0,1/frecuencia,muestras);
y=2.5+2.5*sin(2*pi*frecuencia*x);
figure(1);
plot(x,y);
grid on;

%vsal=(vmax-vmin)*ton/t

%ton=vsal*t/(vmax*vmin);
frec=frecuencia*muestras;
vmax=5;
vmin=0;
t=1/frec;
xtal=20e6;
tosc=1/xtal;
pres=4;

%calcualr el Ton del pwm
for i=1:muestras
    
pwm(i)=y(i)*t/vmax;
reg(i)=pwm(i)/(tosc*pres) ;   
end;

respu=int16(round(reg));   %contiene los coeficientes del pwm
figure(2);
plot(respu);

