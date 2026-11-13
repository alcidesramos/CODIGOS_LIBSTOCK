


void pwm_init_basico()
{
//configuracion timer 2
TMR2=0;
PR2=12500;// para 50HZ = 20 ms manejo de servos
//limpia el registro de configuracion
T2CON=0;
//preescalador  64
T2CONbits.TCKPS=0B10;

 T2CONbits.TON=1; // prende el timer 2
 //configuración

//modulo pwm   oc1
    OC1CON=OC2CON=0;
    OC1CONbits.OCTSEL= OC2CONbits.OCTSEL=0;   //trabaja con timer2  sino timer 3

   OC1RS=OC1R=OC2RS=OC2R=938;      //registro ancho pulso

      //lo habilita como PWM
    OC1CONbits.OCM=OC2CONbits.OCM=0b110;     //configura como PWM


  }