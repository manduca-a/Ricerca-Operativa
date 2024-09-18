/*********************************************
 * OPL 20.1.0.0 Model
 * Author: anton
 * Creation Date: 20 dic 2022 at 12:02:23
 *********************************************/

 setof(string) componenti = ...;
 
 setof(string) olii = ...;
 
 
 
 int costo[componenti] = ...;		//	al barile
 
 int quantita[componenti] = ...;		//	barili al giorno

int vendita[olii] = ...; 
 
 
 dvar float+ x[componenti][olii];		// barili di componenti I neessari per un barile di olio J
 
 
 
 maximize (sum(j in olii) sum(i in componenti) x[i][j] * vendita[j]) - (sum(i in componenti) sum(j in olii) x[i][j] * costo[i]);
 
 constraints{
   forall(i in componenti) sum(j in olii) x[i][j] <= quantita[i];
   x["c1"]["Super"] >= 0.5 * sum(i in componenti) x[i]["Super"];
   x["c2"]["Super"] <= 0.3 * sum(i in componenti) x[i]["Super"];
   x["c2"]["Premium"] >= 0.4 * sum(i in componenti) x[i]["Premium"];
   x["c3"]["Premium"] <= 0.25 * sum(i in componenti) x[i]["Premium"];
   x["c3"]["Extra"] >= 0.6 * sum(i in componenti) x[i]["Extra"];
   x["c1"]["Extra"] <= 0.1 * sum(i in componenti) x[i]["Extra"];
 }