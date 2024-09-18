/*********************************************
 * OPL 20.1.0.0 Model
 * Author: utente
 * Creation Date: 15 nov 2022 at 16:53:24
 *********************************************/

 //		1.19
 
  //insiemi 
 
setof(string) puntiV=...;

setof(string) magaz=...;

// VARIABILI DECISIONALI


dvar int+ x[magaz][puntiV];			//	televisori da magazz[i] a puntiV[i]
dvar boolean y[puntiV];

//dati

int D[magaz] = ...;

int c[magaz][puntiV] = ...;

int F[puntiV] = ...;
int R[puntiV] = ...;
					
//FUNZIONE OBBIETTIVO

	minimize sum(i in magaz, j in puntiV) (c[i][j]*x[i][j])+sum(j in puntiV) F[j]*y[j];
	
	//vincoli
	
	constraints {
	  
	  	sum(j in puntiV) y[j] == 2;
	  	forall(i in magaz) sum(j in puntiV) x[i][j] <= D[i];	  	    
	 	forall(j in puntiV) sum(i in magaz) x[i][j] == R[j]*y[j];
	 	
}