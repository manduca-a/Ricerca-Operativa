/*********************************************
 * OPL 20.1.0.0 Model
 * Author: utente
 * Creation Date: 29 nov 2022 at 17:54:08
 *********************************************/

 
 int budget = 10000;
 
 tuple trasferimento
 {
   string i;			//Partenza
   string j;				//Arrivo
 }
 
 setof(string) city = ...;
 
 setof(trasferimento) Trasferimenti = ...;
 
 int min_trasf[city] = ...;
 
 int S[Trasferimenti] = ...;		//Aumenti
 
   //Variabili decisionali
 dvar int+ x[Trasferimenti];				//sarebbe la x[i][j], che deve prendere qualcosa da sedi
 dvar float v;
 
 maximize v;
 
 constraints{
    forall(j in city) v <= sum(<i,j> in Trasferimenti) x[<i,j>];
    sum(<i,j> in Trasferimenti) S[<i,j>] * x[<i,j>] <= budget;
    forall(i in city) sum(<i,j> in Trasferimenti) x[<i,j>] >= min_trasf[i];
 }