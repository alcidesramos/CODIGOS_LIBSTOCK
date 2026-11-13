 
 unsigned int codigo;
 float velocidad;
  unsigned int velocidad_grafica;
 unsigned int temperatura;
 char envia[30];//trama a enviar
 char trama[30]; //trama recibida
 
 
 unsigned char dato;
char cuenta=0;
boolean flag_rx=0;


char led=13;
char pulsador=2;

void serialEvent()
  {
        while (Serial.available())
       {
       
     dato =(unsigned char)Serial.read();
     trama[cuenta]=dato;
     
        if (( cuenta>3) && ((unsigned char)trama[cuenta]==0xff) && ((unsigned char)trama[cuenta-1]==0xff) && ((unsigned char)trama[cuenta-2]==0xff) )
      {
       flag_rx=1;
          }

       cuenta++;
       
    if (cuenta>=30) 
    {
    memset (trama,0,30);
    cuenta=0;
    }
      
       }
 
     
  }


  void procesa_rx()
  {
  
    if (flag_rx==1)

      {     
    
     
   if ( strstr(trama,"led1=on" ))   digitalWrite(led,HIGH);
   else  if ( strstr(trama,"led1=off" )) digitalWrite(led,LOW);
   else  if ( strstr(trama,"pw1=" ))
     {
      dato=trama[5];
      analogWrite(3,dato);
     }  
     
      memset(trama,0,30);
      cuenta=0;

      flag_rx=0;//vualve a limpiar rx
      }

  }




void setup() {
  // put your setup code here, to run once:

  pinMode(led,OUTPUT);  //Salida LED
  pinMode(3,OUTPUT);//salida PWM
  pinMode(pulsador,INPUT);  //Salida LED
  Serial.begin(9600); 
  analogWrite(3,10);

  
 

}

void loop() {
  // put your main code here, to run repeatedly:

codigo=analogRead(0);
 temperatura=codigo*5.0*100.0/1023.0;
 
 
 codigo=analogRead(1);
 velocidad=codigo*100.0/1023.0;   //para que de de 0kmh a 100 kmh
  
  sprintf(envia,"pa1.te2.val=%d",(unsigned int)temperatura);
   Serial.print(envia);
   Serial.print("\xFF\xFF\xFF");
   
   //aplica cuacion para vizualizador grafic0
  temperatura=0.8654*temperatura + 10.032;  
 sprintf(envia,"pa1.te1.val=%d",(unsigned int)temperatura);
 Serial.print(envia);
Serial.print("\xFF\xFF\xFF"); 


 //envia la velocidad grafica
 if (velocidad>20) velocidad_grafica=  3.152*velocidad - 65.949;
 else  velocidad_grafica= 2.92*velocidad + 298.6;
 
 //arma la trama de envio, solo recibe enteros
 sprintf(envia,"pa0.ve1.val=%d",velocidad_grafica);
  Serial.print(envia);
 Serial.print("\xFF\xFF\xFF"); 
 
 //envia la velocidad numerica y con decimales
   dtostrf(velocidad,4, 2, envia); 
  Serial.print("pa0.ve2.txt=\"");
  Serial.print(envia);
  Serial.print("\"");
  Serial.print("\xFF\xFF\xFF"); 
  
  //manda el dato del pulsador para activar el led
  if (digitalRead(pulsador)==1) Serial.print("pa1.led.pic=1"); 
 else Serial.print("pa1.led.pic=2");
 Serial.print("\xFF\xFF\xFF"); 
 
 
 procesa_rx();
   
   delay(100); 
 


}
