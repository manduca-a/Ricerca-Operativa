/*********************************************
 * OPL 20.1.0.0 Model
 * Author: utente
 * Creation Date: 29 nov 2022 at 17:14:34
 *********************************************/
//5.28		Problema flusso a costo minimo

int nnodi=...;

range Nodi = 1..nnodi;

tuple arco
{
  int i;
  int j;
}

setof(arco) Archi = ...;

int L[Archi] = ...;		//Lower Bound
int U[Archi] = ...;		//Upper Bound
int C[Archi] = ...;		//Capacità dell'arco

int D[Nodi] = ...;


dvar float f[Archi];

//C'è bisogno di controllare che la somma delle divergenze sia 0
assert sum(i in Nodi) D[i] == 0;


minimize sum(<i,j> in Archi) C[<i,j>] * f[<i,j>];


constraints{
  forall(i in Nodi) sum(<i,j> in Archi) f[<i,j>] - sum(<j,i> in Archi) f[<j,i>] == D[i];		//Flusso uscente - flusso entrante == divergenza
  
  forall(<i,j> in Archi) L[<i,j>] <= f[<i,j>] <= U[<i,j>];
}