/*********************************************
 * OPL 20.1.0.0 Model
 * Author: utente
 * Creation Date: 15 nov 2022 at 16:53:24
 *********************************************/

 //		1.26
 
  //insiemi 
 
setof(float) lunghezza=...;
setof(int) tagli=...;

// VARIABILI DECISIONALI

dvar int+ x[tagli];

//dati

int tab[lunghezza][tagli]=...;
int ric[lunghezza]=...;
					
//FUNZIONE OBBIETTIVO

	minimize sum(j in tagli)x[j];
	
	//vincoli
	
	constraints {
	  
	  	forall(i in lunghezza) sum(j in tagli) tab[i][j]*x[j] >= ric[i];	  	    
	 
	
}