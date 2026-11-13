//define conexiones

#include "definiciones.h"

//coneciones del max6675
#define max6675_ck RC3
#define max6675_dat RC4

#define max6675_ck_dir TRISC3
#define max6675_dat_dir   TRISC4
#define max6675_cs  RC0
#define max6675_cs_dir  TRISC0


void max6675_init();
float max6675_lee() ;



