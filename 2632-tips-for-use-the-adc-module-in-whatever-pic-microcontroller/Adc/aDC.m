x=linspace(0,2*pi,100);
y=sin(x);
x1=linspace(0,2*pi,4);
y1=sin(x1);

x1=linspace(0,2*pi,8);
y2=sin(x1);

x1=linspace(0,2*pi,16);
y3=sin(x1);

x1=linspace(0,2*pi,40);
y4=sin(x1);


%se divide en tres por 2 parte y se grafica en la primera
subplot(3,2,1),plot(x,y);
subplot(3,2,2),stem(y1);
subplot(3,2,3),stem(y2);
subplot(3,2,4),stem(y3);
subplot(3,2,5),stem(y4);
subplot(3,2,6),stem(y);


