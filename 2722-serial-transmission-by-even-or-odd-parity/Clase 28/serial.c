 unsigned int  codigo;
 float voltaje;
 float temperatura;
 
 char texto[20];

void Uart1_write_text_const(const char *info)
{
 while(*info) UART1_Write(*info++);
}

//para paridad par oddd
void UART1_Write_pa(char dat_)
{
 char cont_,pari,p_cont=0;
  //uno paridad par(Even)  cero impar(ODD)
  pari=0;     //cambie a 0 para paridad impar
 for (cont_=0;cont_<=7;cont_++)

  {
   if ((dat_ & 1<<cont_)!=0) p_cont++;

 }

 if (p_cont%2!=0) pari=~pari;       // dicision por residuo
 
  TX9D_bit=pari;
 UART1_Write(dat_);

}


void UART1_Write_text_pa(char *info)
{
 while(*info) UART1_Write_pa(*info++);
}

void UART1_Write_text_pa_const(const char *info)
{
 while(*info) UART1_Write_pa(*info++);
}


void main() 
{
 //adcon1=0b0100;// 3 analogos en el 16f87x

 adcon1=0b1101;// 2 analogos en el 18f25x

 // entradas analogas
 TRISA0_bit=1;
 TRISA1_bit=1;
 
 
 TRISC6_bit=0;// saluida tx
 TRISC7_bit=1; // entrada rx
 UART1_Init(9600);
 TX9_bit=1; //habilita transmitir 9 bits

 
 UART1_Write_text_pa_const("INICIANDO\r\n");

 
 while (1)
 {
   codigo=ADC_Read(0);
   voltaje=codigo*5.0/1023.0;
/*floattostr_(voltaje,texto,2);
   Uart1_write_text_const("Voltaje=");
   UART1_Write_Text(texto);
   Uart1_write_text_const(" V\r\n");*/
   
   sprintf(texto,"Voltaje=%.2f V\r\n",voltaje);
   UART1_Write_text_pa(texto);


   
   
   
      codigo=ADC_Read(1);
   temperatura=codigo*500.0/1023.0;
   sprintf(texto,"Temperatura=%.1f \r\n",temperatura);
   UART1_Write_text_pa(texto);
   
   
   

   
   
   
 
 
 Delay_ms(800);
 
 }
 
 

}