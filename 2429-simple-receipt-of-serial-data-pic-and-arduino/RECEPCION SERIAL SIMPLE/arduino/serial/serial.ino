//pines de direccion del motor
#define m11 13
#define m12 12

#define led1 2
#define led2 3

//PIn de pwm
#define pwm 11

//variables para capturar la trama
char trama[30];
char procesa[30];

char dato;

//funcion para que gira a la derecha
void m1derecha()
{
 digitalWrite(m11,HIGH); 
 digitalWrite(m12,LOW);  
}

void m1izquierda()
{
 digitalWrite(m11,LOW); 
 digitalWrite(m12,HIGH);  
}

void m1quieto()
{
 digitalWrite(m11,LOW); 
 digitalWrite(m12,LOW);  
}








void setup() 
{
  // put your setup code here, to run once:

 Serial.begin(9600);// inica el puerto serial
 pinMode(led1,OUTPUT);
 pinMode(led2,OUTPUT);
 pinMode(pwm,OUTPUT);
 pinMode(m11,OUTPUT);
 pinMode(m12,OUTPUT);

 //inia con una velocidad basica el pwm
 analogWrite(pwm,100);
//motor arranca apagado
 m1quieto();

}

void loop()
{
  // put your main code here, to run repeatedly:

 while (Serial.available()==0);
  Serial.readBytesUntil('*',trama,30);
  
  if (strstr(trama,"led1="))
  {
     if (strstr(trama,"on")) digitalWrite(led1,HIGH);
    else digitalWrite(led1,LOW);
    }

   else if (strstr(trama,"led2="))
  {
     if (strstr(trama,"on")) digitalWrite(led2,HIGH);
    else digitalWrite(led2,LOW);
    }

    else if (strstr(trama,"m1der"))  m1derecha();

  else if (strstr(trama,"m1izq"))  m1izquierda();

  else if (strstr(trama,"m1stop"))  m1quieto();



else if (strstr(trama,"m1pwm="))
    {
        strcpy(procesa, strtok(trama, "="));  //inicia captura de tokens desde el =
        strcpy(procesa, strtok(0, "/"));  //captura hasta el /
        //pasa la cadena a  numero
        dato=atoi(procesa);
        analogWrite(pwm,dato);// aplica la velocidad al pwm
        
     
    }
  


  


}
