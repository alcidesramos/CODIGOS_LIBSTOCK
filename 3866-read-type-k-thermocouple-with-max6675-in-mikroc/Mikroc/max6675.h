//define conexiones
#define max6675_ck RC3_bit
#define max6675_dat RC4_bit

#define max6675_ck_dir trisc.b3
#define max6675_dat_dir   trisc.b4

#define max6675_cs  RC0_bit
#define max6675_cs_dir  trisc.b0

void max6675_init();
float max6675_lee() ;



