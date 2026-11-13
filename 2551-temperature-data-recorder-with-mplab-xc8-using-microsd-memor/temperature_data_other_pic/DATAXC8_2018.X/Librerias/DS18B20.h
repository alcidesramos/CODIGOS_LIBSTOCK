#include "../mcc_generated_files/mcc.h"



//float ds18b20_read();

unsigned char Ow_Reset();
void Ow_Write(char OW_DATO);
unsigned char  Ow_Read();
float ds18b20_read();


unsigned char  Ow_Reset()
{
	 OW_TRIS=0; 
	 OW_PORT = 0;
	__delay_us(480);
	 OW_TRIS=1; 
	__delay_us(60); //RETARDO DE RESET
	
		if (OW_PORT == 0) // si hay sensor retorna 0
		{ 
		__delay_us(480);
		return 0;   
		} 
		else 
		{
		__delay_us(480);//retardo del bus
		return 1; //sino 1
		}
}

void  Ow_Write(char OW_DATO)
{
	char CONT_,OW_DATO_T;
	OW_DATO_T=OW_DATO;
	 OW_TRIS=1; 
	
		for(CONT_ = 0; CONT_ < 8; CONT_++)
		{
			//ANAIZA SI DEBE PONER UN 1
            if((OW_DATO_T & (1<<CONT_))!= 0) 
			{
			 OW_TRIS=0; 
			OW_PORT = 0;
			__delay_us(1);
			 OW_TRIS=1; 
			__delay_us(60); //RETARDO DEL BUS
			} 
			else 
			{
               // COLOCA UN 0
			 OW_TRIS=0; 
			OW_PORT = 0;
			__delay_us(60); //RETARDO DEL BUS
			 OW_TRIS=1; 
			}
		}
}

unsigned char  Ow_Read()
{
	char CONT_,OUT_ = 0;
	 OW_TRIS=1; 
            for(CONT_ = 0; CONT_ < 8; CONT_++)
            {
             OW_TRIS=0;
            OW_PORT = 0;
            __delay_us(2);
             OW_TRIS=1; 
            if(OW_PORT != 0) 
            OUT_ |= 1<<CONT_;//DEZPLAZA EL BIT
            __delay_us(60); //RETARDO DEL BUS
            }
	 return OUT_;
}


float ds18b20_read()
{
unsigned int temp_;
float tempo__;
unsigned char t1_,t2_,td__;
float signo=1.0;
float sensor_temp_;



    Ow_Reset();                         // Onewire reset signal
   __delay_ms(18);
    Ow_Write(0xCC);                   // dirrecciona todos sensores
   __delay_ms(1);
    Ow_Write(0x44);                   //iniica conversion
   __delay_ms(150);

    Ow_Reset();
   __delay_ms(18);
    Ow_Write(0xCC);
  __delay_ms(1);
    Ow_Write(0xBE);
    __delay_ms(1);
     t1_ =  Ow_Read();        //lee parte baja
     t2_ =  Ow_Read();       //lee parte alta

    temp_=( (unsigned int)t2_<<8) | t1_;

     //si es negado
    if ( t2_ & 0x80)
    {
    temp_=~temp_+1;
    signo=-1.0;
     }
      temp_=temp_>>4; //quita la parte decimal

     td__=t1_ & 0x0f;    //saca parte decima
    //suma las decimas deseadas analizando los bits del td__
      tempo__=0;
        if ((td__  & (1 << 3))>0) tempo__=tempo__+0.5;
       if ((td__  & (1 << 2))>0) tempo__=tempo__+0.25;
       if ((td__  & (1 << 1))>0) tempo__=tempo__+0.125;
       if ((td__  & (1 << 0))>0) tempo__=tempo__+0.0625;
      
          if (signo<0) tempo__=-tempo__;
     sensor_temp_=(temp_*signo)+tempo__;  //calcula vlor final

    return (sensor_temp_);

}



