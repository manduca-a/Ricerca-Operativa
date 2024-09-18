/*********************************************
 * OPL 20.1.0.0 Model
 * Author: utente
 * Creation Date: 8 nov 2022 at 17:37:45
 *********************************************/

 //1.24
 
 //Insiemi
 {string} sedi = {"RC", "CS", "CZ", "VV"};		//crea un insieme di stringhe, si fa anche con setof(string) sedi = ...
 
  //Variabili decisionali
 dvar int+ x[sedi][sedi];				//sarebbe la x[i][j], che deve prendere qualcosa da sedi
 dvar float v;
 
 //Dati
 int budget = 10000;
 int min_trasf = 5;
 int c[sedi][sedi] = [[0, 150, 400, 300], [150, 0, 250, 200], [400, 250, 0, 200], [300, 200, 200, 0]];		//matrice degli aumenti
 
 //Fuzione obiettivo
 maximize v;
 
 //Vincoli
 constraints		//per i vincoli, si potrebbe anche mettere subject to
 {
   vincolo_1: forall(j in sedi) v <= sum(i in sedi : i != j) x[i][j];
   vincolo_2: sum(i in sedi) sum(j in sedi : j != i) c[i][j] * x[i][j] <= budget;		//si potrebbero anche unire le due somme
   vincolo_3: forall(i in sedi) sum(j in sedi : j != i) x[i][j] >= min_trasf;
 }