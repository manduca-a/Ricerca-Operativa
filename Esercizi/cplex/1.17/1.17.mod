/*********************************************
 * OPL 20.1.0.0 Model
 * Author: utente
 * Creation Date: 8 nov 2022 at 17:40:27
 *********************************************/

 //insiemi 
 
{string} macchine = ...;
{int} prodotti = ...;


// VARIABILI DECISIONALI

dvar int+ x[prodotti][macchine];

dvar int v;


//dati

int o[macchine]=...;

int prodo[prodotti][macchine]=...;

					
//FUNZIONE OBBIETTIVO

	maximize v;
	
	//vincoli
	
	constraints {
	  
	  	forall(i in prodotti) v <= sum(j in macchine) x[i][j];
	  	
	  	forall(j in macchine) sum(i in prodotti) x[i][j] * prodo[i][j] <= o[j]*60;	  
	 
	
}