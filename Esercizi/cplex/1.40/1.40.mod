/*********************************************
 * OPL 20.1.0.0 Model
 * Author: anton
 * Creation Date: 19 nov 2022 at 16:09:22
 *********************************************/

 setof(string) premi = ...;
 setof(string) tipo = ...;
 
 int punti[premi][tipo] = ...;

 float denaro[premi] = ...;
 
 int puntiD = 9123;
 
 int decis[premi] = ...;
 
 dvar int+ x[premi][tipo];
 
 minimize sum(i in premi) denaro[i] * x[i]["Con"];
 
 constraints{
 
	 sum(i in premi) sum(j in tipo) punti[i][j] * x[i][j] <= puntiD;
	 
	 forall(i in premi) sum(j in tipo) x[i][j] == decis[i];
 
} 