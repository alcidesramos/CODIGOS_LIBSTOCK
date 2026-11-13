#line 1 "C:/Users/Alcides Ramos/Desktop/Fuzzy_2018/mikroc/controlador.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdio.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/math.h"





double fabs(double d);
double floor(double x);
double ceil(double x);
double frexp(double value, int * eptr);
double ldexp(double value, int newexp);
double modf(double val, double * iptr);
double sqrt(double x);
double atan(double f);
double asin(double x);
double acos(double x);
double atan2(double y,double x);
double sin(double f);
double cos(double f);
double tan(double x);
double exp(double x);
double log(double x);
double log10(double x);
double pow(double x, double y);
double sinh(double x);
double cosh(double x);
double tanh(double x);
#line 1 "c:/users/alcides ramos/desktop/fuzzy_2018/mikroc/controlador.h"
#line 15 "c:/users/alcides ramos/desktop/fuzzy_2018/mikroc/controlador.h"
 typedef struct {
 double (* equal)(double x);
 double (* center)();
 double (* basis)();
 double (* param)(int i);
 } Consequent;

 typedef struct {
 double min;
 double max;
 double step;
 double (* imp)(double a, double b);
 double (* also)(double a, double b);
 int length;
 double* degree;
 int inputlength;
 double* input;
 Consequent* conc;
 } FuzzyNumber;










void controladorInferenceEngine(double error, double Cambio_e, double* pwm);
#line 21 "C:/Users/Alcides Ramos/Desktop/Fuzzy_2018/mikroc/controlador.c"
static double FMF_xfl_sh_triangular_equal(double x, int i, double min, double max, double step, double *p, int length) {
 double a = (i==0? min : p[i-1]);
 double b = p[i];
 double c = (i==length-1? max : p[i+1]);

 if(i==0 && x<p[0]) return 1;
 if(i==length-1 && x>p[length-1]) return 1;
 return (a<x && x<=b? (x-a)/(b-a) : (b<x && x<c? (c-x)/(c-b) : 0));
}









static double MF_xfl_singleton_equal(double x, double min, double max, double step, double a) {
 return (x==a? 1 : 0);

}









static double OP_ope_And(double a, double b) {
 return a*b;

}





static double OP_ope_Defuz(FuzzyNumber mf) {
 double min = mf.min;
 double max = mf.max;
 double num=0, denom=0;
 int i;
 for(i=0; i<mf.length; i++) {
 num += mf.degree[i] * mf.conc[i].center();
 denom += mf.degree[i];
 }
 if(denom==0) return (min+max)/2;
 return num/denom;

}










static double TP_T_error_fam_equal(double x, int i){
 double list[5] = {-50.0,-5.0,0.0,5.0,50.0};
 return FMF_xfl_sh_triangular_equal(x,i,-1500.0,1500.0,11.764705882352942,list,5);
}





static double TP_T_error_muynegativo_equal(double x){
 return TP_T_error_fam_equal(x,0);}





static double TP_T_error_negativo_equal(double x){
 return TP_T_error_fam_equal(x,1);}





static double TP_T_error_cero_equal(double x){
 return TP_T_error_fam_equal(x,2);}





static double TP_T_error_positivo_equal(double x){
 return TP_T_error_fam_equal(x,3);}





static double TP_T_error_muyposito_equal(double x){
 return TP_T_error_fam_equal(x,4);}









static double TP_T_Cambio_e_fam_equal(double x, int i){
 double list[5] = {-10.0,-2.0,0.0,2.0,10.0};
 return FMF_xfl_sh_triangular_equal(x,i,-20.0,20.0,0.1568627450980392,list,5);
}





static double TP_T_Cambio_e_muynegativo_equal(double x){
 return TP_T_Cambio_e_fam_equal(x,0);}





static double TP_T_Cambio_e_negativo_equal(double x){
 return TP_T_Cambio_e_fam_equal(x,1);}





static double TP_T_Cambio_e_neutro_equal(double x){
 return TP_T_Cambio_e_fam_equal(x,2);}





static double TP_T_Cambio_e_positivo_equal(double x){
 return TP_T_Cambio_e_fam_equal(x,3);}





static double TP_T_Cambio_e_muypositivo_equal(double x){
 return TP_T_Cambio_e_fam_equal(x,4);}









static double TP_T_pwm_minimo_equal(double x){
 return MF_xfl_singleton_equal(x,0.0,255.0,1.0,0.0);
}

static double TP_T_pwm_minimo_center(){
 return 0.0;
}





static double TP_T_pwm_bajo_equal(double x){
 return MF_xfl_singleton_equal(x,0.0,255.0,1.0,63.75);
}

static double TP_T_pwm_bajo_center(){
 return 63.75;
}





static double TP_T_pwm_medio_equal(double x){
 return MF_xfl_singleton_equal(x,0.0,255.0,1.0,127.5);
}

static double TP_T_pwm_medio_center(){
 return 127.5;
}





static double TP_T_pwm_alto_equal(double x){
 return MF_xfl_singleton_equal(x,0.0,255.0,1.0,191.25);
}

static double TP_T_pwm_alto_center(){
 return 191.25;
}





static double TP_T_pwm_maximo_equal(double x){
 return MF_xfl_singleton_equal(x,0.0,255.0,1.0,255.0);
}

static double TP_T_pwm_maximo_center(){
 return 255.0;
}





static void RL_reglas(double error, double Cambio_e, double *pwm) {
 double _rl;

 double _pwm_degree[25];
 Consequent _pwm_conc[25];
 FuzzyNumber _pwm;
 int _pwm_i = 0;

 double _error_eq[5];

 double _Cambio_e_eq[5];

 _pwm.min = 0.0;
 _pwm.max = 255.0;
 _pwm.step = 1.0;
 _pwm.length = 25;
 _pwm.degree = _pwm_degree;
 _pwm.conc = _pwm_conc;
 _error_eq[0] = TP_T_error_muynegativo_equal(error);
 _error_eq[1] = TP_T_error_negativo_equal(error);
 _error_eq[2] = TP_T_error_cero_equal(error);
 _error_eq[3] = TP_T_error_positivo_equal(error);
 _error_eq[4] = TP_T_error_muyposito_equal(error);


 _Cambio_e_eq[0] = TP_T_Cambio_e_muynegativo_equal(Cambio_e);
 _Cambio_e_eq[1] = TP_T_Cambio_e_negativo_equal(Cambio_e);
 _Cambio_e_eq[2] = TP_T_Cambio_e_neutro_equal(Cambio_e);
 _Cambio_e_eq[3] = TP_T_Cambio_e_positivo_equal(Cambio_e);
 _Cambio_e_eq[4] = TP_T_Cambio_e_muypositivo_equal(Cambio_e);

 _rl = OP_ope_And(_error_eq[0],_Cambio_e_eq[0]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[0],_Cambio_e_eq[1]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[0],_Cambio_e_eq[2]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_bajo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_bajo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[0],_Cambio_e_eq[3]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_bajo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_bajo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[0],_Cambio_e_eq[4]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_medio_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_medio_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[1],_Cambio_e_eq[0]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[1],_Cambio_e_eq[1]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[1],_Cambio_e_eq[2]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_medio_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_medio_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[1],_Cambio_e_eq[3]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_medio_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_medio_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[1],_Cambio_e_eq[4]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_alto_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_alto_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[2],_Cambio_e_eq[0]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[2],_Cambio_e_eq[1]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[2],_Cambio_e_eq[2]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_minimo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_minimo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[2],_Cambio_e_eq[3]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_bajo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_bajo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[2],_Cambio_e_eq[4]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_bajo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_bajo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[3],_Cambio_e_eq[0]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_bajo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_bajo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[3],_Cambio_e_eq[1]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_bajo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_bajo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[3],_Cambio_e_eq[2]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_medio_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_medio_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[3],_Cambio_e_eq[3]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_alto_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_alto_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[3],_Cambio_e_eq[4]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_alto_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_alto_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[4],_Cambio_e_eq[0]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_medio_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_medio_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[4],_Cambio_e_eq[1]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_medio_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_medio_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[4],_Cambio_e_eq[2]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_alto_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_alto_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[4],_Cambio_e_eq[3]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_maximo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_maximo_center;
 _pwm_i++;

 _rl = OP_ope_And(_error_eq[4],_Cambio_e_eq[4]);
 _pwm_degree[_pwm_i] = _rl;
 _pwm_conc[_pwm_i].equal = TP_T_pwm_maximo_equal;
 _pwm_conc[_pwm_i].center = TP_T_pwm_maximo_center;
 _pwm_i++;

 *pwm = OP_ope_Defuz(_pwm);
}






void controladorInferenceEngine(double error, double Cambio_e, double *_d_pwm) {
 double pwm;
 RL_reglas(error, Cambio_e, &pwm);
 *_d_pwm = pwm;
}
