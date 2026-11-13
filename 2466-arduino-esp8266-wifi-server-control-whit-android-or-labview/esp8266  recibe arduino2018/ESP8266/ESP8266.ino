//pines de direccion del motor
#define m11 13
#define m12 12

#define led1 2
#define led2 3
#define led3 4
#define suiche 5


//variables nuevas
char datorx;
char puntero=0;
char flag_rx=0;



//PIn de pwm
#define pwm 11

//variables para capturar la trama
char trama[100];
char procesa[30];
char dato;


//variables para leer analogo
unsigned int codigo;
float temperatura;

char texto[20];// trama para pasar de numero a cadena




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


void procesarx()
{
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


void serialEvent()
  {
       while (Serial.available())
       {
       
     datorx= (char)Serial.read();
     trama[puntero]=datorx;
     puntero++;
              if (puntero>=100) 
              {
               puntero=0;
              }
              if (datorx== '*') 
              {
              flag_rx=1;
              }
       }
 
  
  
  
  }





void setup() 
{
  // put your setup code here, to run once:

 Serial.begin(115200);// inica el puerto serial
 pinMode(led1,OUTPUT);
 pinMode(led2,OUTPUT);
 pinMode(led3,OUTPUT);
 
 
 
 pinMode(pwm,OUTPUT);
 pinMode(m11,OUTPUT);
 pinMode(m12,OUTPUT);

pinMode(suiche,INPUT);
 

 //inia con una velocidad basica el pwm
 analogWrite(pwm,100);
//motor arranca apagado
 m1quieto();


 Serial.print("ATE0\r\n"); //SIN ECO
delay(2000);


Serial.print("AT+CWMODE=2\r\n"); //ACTUA COMO  ROUTER CREA UNA RED PROPIA
delay(200);

//antes de poner modo cierra sevidores pone conexion unica
//BORRA SERIDOR
Serial.print("AT+CIPSERVER=0\r\n");  //cierra sevidores
delay(200);
Serial.print("AT+CIPMUX=0\r\n");   //pone conexion un unica
delay(200);


Serial.print("AT+CIPMODE=0\r\n"); //Trabaja en modo normal
delay(200);
//Red WIFI como acces point  cana 5  clave tipo WPA2_PSK
Serial.print("AT+CWSAP=\"ESP8266_ARZ\",\"noconectar\",5,3\r\n");
delay(600);
//Coloca la IP del acces ponit
Serial.print("AT+CIPAP=\"192.168.1.254\"\r\n");
delay(200);

//Crea el servidor y el puerto a escuchar
Serial.print("AT+CIPMUX=1\r\n");  //habilita multiples conexiones
delay(200);

//Activa la escucha por el puerto 200
Serial.print("AT+CIPSERVER=1,200\r\n");
delay(200);

//tiemo en el cual actua como servidor en segundos
Serial.print("AT+CIPSTO=0\r\n");    //0  siempre(todo el tiempo)



}

void loop()
{
  // put your main code here, to run repeatedly:


      if (flag_rx==1)

      {
       
        procesarx();        
        flag_rx=0;// borra la bandera
        puntero=0;  //reseta contador de datos
        memset(trama,0,100);  // borra el vector de datos recibicos en la trama
        
       } 

   


}
