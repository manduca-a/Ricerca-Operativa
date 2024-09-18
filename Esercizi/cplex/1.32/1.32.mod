/*********************************************
 * OPL 20.1.0.0 Model
 * Author: anton
 * Creation Date: 19 nov 2022 at 10:09:42
 *********************************************/

 
 setof(string) dolci=...;
 setof(string) basi=...;
 
 int produ[dolci][basi]=...;		//	QUANTITA' NECESSARIE PER PREPARAZIONE
 
 int disp[basi]=...;		//	DISPONIBILITA' SETTIMANALI
 
 int inutil[basi]=...;		//	PREZZO/ETTO VENDITA BASI INUTILIZZATE 
 
 int vend[dolci]=...;		//	PREZZO/CHILO VENDITA DOLCI
 
 dvar int+ x[dolci];			//	VARIABILE DECISIONALE DOLCI PRODOTTI SETTIMANALMENTE
 
 maximize ((sum(i in dolci) vend[i]*x[i]) + (sum(j in basi) inutil[j]*((disp[j]-sum(i in dolci) produ[i][j]*x[i]))/100));
 
 constraints {
   forall(j in basi) sum(i in dolci) produ[i][j]*x[i]<=disp[j];
 }