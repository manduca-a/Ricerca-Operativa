/*********************************************
 * OPL 20.1.0.0 Model
 * Author: anton
 * Creation Date: 19 nov 2022 at 11:18:26
 *********************************************/

 
 setof(string) stabilimentiCal = ...;
 setof(string) stabilimentiCam = ...;
 setof(string) stabilimentiLaz = ...;
 setof(string) stabilimenti = stabilimentiCal union stabilimentiCam union stabilimentiLaz;
 
 string allocazione[stabilimenti] = ...;
 
 int attivazione[stabilimenti] = ...;
 
 int produzione[stabilimenti] = ...;
 
 int budget = 1500;
 
 int stabCal = 1;
 
 int stabLaz = 2;
 
 int stabCamp = 1;
 
 dvar boolean x[stabilimenti];
 
 
 maximize sum(i in stabilimenti) produzione[i] * x[i];
 
 constraints{
   sum(i in stabilimenti) attivazione[i] * x[i] <= budget;
   sum(i in stabilimentiCal) x[i] >= stabCal;
   sum(i in stabilimentiLaz) x[i] >= stabLaz;
   sum(i in stabilimentiCam) x[i] >= stabCamp;
   x["G"]>=x["A"];
 }