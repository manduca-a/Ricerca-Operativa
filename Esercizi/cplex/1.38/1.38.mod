/*********************************************
 * OPL 20.1.0.0 Model
 * Author: anton
 * Creation Date: 18 nov 2022 at 18:29:58
 *********************************************/

 
 setof(int) macchine=...;
 setof(int) componenti=...;
 
 int minimo = 20;
 
 int tempi[macchine][componenti]=...;
 
 dvar int+ x[macchine][componenti];		//		COMPONENTI J PRODOTTI DALLA MACCHINA I
 
 minimize sum(i in macchine, j in componenti) tempi[i][j]*x[i][j];
 
 constraints{
   
   
   forall(j in componenti) sum(i in macchine) x[i][j]>=minimo;
 }