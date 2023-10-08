%%Busqueda en un árbol%%
arbol(+,arbol(x,3,5),arbol(-,2,5)).

buscar(N,arbol(N,_,_)) :- !.
buscar(E,arbol(N,_,_)) :- E \= N, 
    buscar(N,arbol(_,N,_)),
    buscar(N,arbol(_,_,N)).
    
%buscar(3,arbol(+,arbol(x,3,5),arbol(-,2,5))).

%Contar Nodos
arbolB(+,arbolB(x,arbolB(3,vacio,vacio),arbolB(5,vacio,vacio)),arbolB(-,arbolB(2,vacio,vacio),arbolB(5,vacio,vacio))).

contar(vacio, 0).
contar(arbolB(_, I, D), L) :-  
    contar(I, L1),
    contar(D, L2),
    L is L1 + L2 + 1.

%contar(arbolB(+,arbolB(x,arbolB(3,vacio,vacio),arbolB(5,vacio,vacio)),arbolB(-,arbolB(2,vacio,vacio),arbolB(5,vacio,vacio))) ,L).

%Calcular/conocer la profundidad del árbol
arbolC(+,arbolC(x,arbolC(3,arbolC(4,arbolC(6,vacio,vacio),vacio),vacio),arbolC(5,vacio,vacio)),arbolC(-,arbolC(2,vacio,vacio),arbolC(5,vacio,vacio))).
profundidad(vacio,0).
profundidad(arbolC(_,I,D),P) :-
	profundidad(I,PI),
	profundidad(D,PD),
	P is 1 + max(PI,PD).

%profunidad(arbolC(+,arbolC(x,arbolC(3,arbolC(4,arbolC(6,vacio,vacio),vacio),vacio),arbolC(5,vacio,vacio)),arbolC(-,arbolC(2,vacio,vacio),arbolC(5,vacio,vacio))),P).

%%De Árbola a Lista
arbolD(+,arbolD(x,arbolD(3,arbolD(4,arbolD(6,vacio,vacio),vacio),vacio),arbolD(5,vacio,vacio)),arbolD(-,arbolD(2,vacio,vacio),arbolD(5,vacio,vacio))).

lista(vacio, []).
lista(arbolD(Raiz, Izquierda, Derecha), Lista) :-
    lista(Izquierda, ListaIzquierda),
    lista(Derecha, ListaDerecha),
    append(ListaIzquierda,[Raiz|ListaDerecha], Lista).
    
%lista(arbolD(+,arbolD(x,arbolD(3,arbolD(4,arbolD(6,vacio,vacio),vacio),vacio),arbolD(5,vacio,vacio)),arbolD(-,arbolD(2,vacio,vacio),arbolD(5,vacio,vacio))) ,L).


%%Contar la cantidad de hojas%%
arbolF(+,arbolF(x,arbolF(3,arbolF(4,arbolF(6,arbolF(4,hoja,hoja),hoja),hoja),hoja),arbolF(5,arbolF(4,hoja,hoja),hoja)),arbolF(-,arbolF(2,hoja,hoja),arbolF(5,hoja,hoja))).

contar_hojas(hoja, 1).
contar_hojas(arbolF(_, Izquierda, Derecha), Conteo) :-
    contar_hojas(Izquierda, ConteoIzquierda),
    contar_hojas(Derecha, ConteoDerecha),
    Conteo is ConteoIzquierda + ConteoDerecha.

%contar_hojas(arbolF(+,arbolF(x,arbolF(3,arbolF(4,arbolF(6,arbolF(4,hoja,hoja),hoja),hoja),hoja),arbolF(5,arbolF(4,hoja,hoja),hoja)),arbolF(-,arbolF(2,hoja,hoja),arbolF(5,hoja,hoja))), C).

