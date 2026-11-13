
#define dir_esclavo 1
extern char modbus_rx[];
extern  char modbus_tx[];

extern unsigned char rec_largo;
extern unsigned char rec_socket;


void modbus_write_holding(unsigned int dir_mod, unsigned int dat_mod);
void modbus_write_holding_varios(unsigned int dir_mod, unsigned int *buff_datos,unsigned int cuantos);
void modbus_write_digitalcoils(unsigned int dir_mod, unsigned int dat_dig);
void modbus_read_analog(unsigned int dir_mod, unsigned int cuantos);


