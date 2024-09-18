/*********************************************
 * OPL 20.1.0.0 Model
 * Author: utente
 * Creation Date: 15 nov 2022 at 16:53:24
 *********************************************/

 //		1.19
 
  //insiemi 
 
setof(string) stabilimento1=...;
setof(string) stabilimento2=...;
{string} stabilimenti = stabilimento1 union stabilimento2;

setof(string) modello1=...;
setof(string) modello2=...;
{string} modelli = modello1 union modello2;


// VARIABILI DECISIONALI

dvar int+ x[stabilimenti][modelli];
dvar boolean y[stabilimenti];
//dati

int capProd[stabilimenti] = ...;
int costoAtt[stabilimenti] = ...;
int budget = ...;
int costiProd[modelli] = ...;
int costiVend[modelli] = ...;
int quantMin = ...;
					
//FUNZIONE OBBIETTIVO

	maximize sum(i in stabilimento1, j in modello1) ((costiVend[j]-costiProd[j])*x[i][j])+sum(i in stabilimento2, j in modello2) ((costiVend[j]-costiProd[j])*x[i][j]);
	
	//vincoli
	
	constraints {
	  
	  	sum(i in stabilimento1) y[i] == 1;
	  	sum(i in stabilimento2) y[i] == 1;	  	    
	 	sum(i in stabilimenti) costoAtt[i]*y[i] <= budget;
	 	forall(i in stabilimento1) sum(j in modello1) x[i][j] <= capProd[i]*y[i];
	 	forall(i in stabilimento2) sum(j in modello2) x[i][j] <= capProd[i]*y[i];
		forall(j in modello1) sum(i in stabilimento1) x[i][j] >= quantMin;
		forall(j in modello2) sum(i in stabilimento2) x[i][j] >= quantMin;
}