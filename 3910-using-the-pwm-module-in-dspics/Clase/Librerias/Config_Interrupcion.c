

//procedimientos y funcionesinterrupciones
 void  osciladorInt() org 0x06
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

void  deshabilita()
{
 //nivel de prioridad interrupcion CPU  //15 deshabilita interrupciones
//temporarmente
intcon1.b15=0; //para poder hacer el cambio debe star en cero habilitado el anidamiento
IPL3_bit=1;
IPL_2_bit=1;
IPL_1_bit=1;
IPL_0_bit=1;
intcon1.b15=0; //habilita aninamiento interrupciones
}


void  habilita()
{
 //nivel de prioridad interrupcion CPU  //0 habilita interrupciones
//IPL3_bit:=0;
intcon1.b15=0; //para poder hacer el cambio debe star en cero habilitado el anidamiento
IPL3_bit=0;
IPL_2_bit=0;
IPL_1_bit=0;
IPL_0_bit=0;
intcon1.b15=0; //habilita aninamiento interrupciones
}


