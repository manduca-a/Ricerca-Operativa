/*********************************************
 * OPL 20.1.0.0 Model
 * Author: utente
 * Creation Date: 8 nov 2022 at 17:40:27
 *********************************************/

 //insiemi 
 
{string} corsi = ...;
{string} giorni = ...;

// VARIABILI DECISIONALI

dvar int+ x[corsi][giorni];

dvar boolean y[giorni];

//dati

int m[corsi]=...;

int g[giorni]=...;

int giornis= ...;


					
//FUNZIONE OBBIETTIVO

	minimize sum(j in giorni) y[j];
	
	//vincoli
	
	constraints {
	  
	  	forall(i in corsi) sum(j in giorni)x[i][j]==m[i];
	  	
	  	forall(j in giorni) sum(i in corsi) x[i][j]<= g[j]*y[j];	  
	 
	
}