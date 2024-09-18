/*********************************************
 * OPL 20.1.0.0 Model
 * Author: utente
 * Creation Date: 8 nov 2022 at 15:06:19
 *********************************************/

 // MODELLO SEMPLICE
 
 //Variabili decisionali
 dvar float+ x1;	//con float+ indico una variabile, in quesro caso x1, >=0
 dvar float+ x2;
 
 //Fuzione obiettivo
 minimize -2*x1-2*x2;
 
 //Vincoli
 constraints		//per i vincoli, si potrebbe anche mettere subject to
 {
   vincolo_1: x1 + 3*x2 <=14;
   vincolo_2: x1 <=5;
   vincolo_3: x2 <=4;
   vincolo_4: x1-x2 <=4;
 }