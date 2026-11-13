#line 1 "C:/Users/Alcides Ramos/Desktop/PWM/Clase/Librerias/Config_Interrupcion.c"



 void osciladorInt() org 0x06
{
OSCFAIL_bit=0;
}

void direccionInt() org 0x08
{
ADDRERR_bit=0;
}

void pilaInt() org 0x0A
{
STKERR_bit=0;
}


void aritmetrico() org 0x0C
{
MATHERR_bit=0;
}

void deshabilita()
{


intcon1.b15=0;
IPL3_bit=1;
IPL_2_bit=1;
IPL_1_bit=1;
IPL_0_bit=1;
intcon1.b15=0;
}


void habilita()
{


intcon1.b15=0;
IPL3_bit=0;
IPL_2_bit=0;
IPL_1_bit=0;
IPL_0_bit=0;
intcon1.b15=0;
}
