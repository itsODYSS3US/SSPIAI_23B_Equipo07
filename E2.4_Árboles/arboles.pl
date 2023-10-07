% Buscar
% busqueda :- pregunta, read(VB), busPre(arbol,VB),
% busPre(arbol(R,I,D),B) :- R == B, !,
%                           buscarPre(I),
%                           buscarPre(D).

arbol(+,arbol(x,3,5),arbol(-,2,5)).

buscar(N,arbol(N,_,_)) :- !.
buscar(E,arbol(N,_,_)) :- E \= N, 
    buscar(N,arbol(_,N,_)),
    buscar(N,arbol(_,_,N)).
    
%buscar(3,arbol(+,arbol(x,3,5),arbol(-,2,5))).

% preorden(arbol(Raiz,Hizq,Hder)):- write(Raiz), preorden(Hizq), preorden(Hder).
% preorden(H):- write(H).

%Contar
arbolB(+,arbolB(x,arbolB(3,vacio,vacio),arbolB(5,vacio,vacio)),arbolB(-,arbolB(2,vacio,vacio),arbolB(5,vacio,vacio))).

contar(vacio, 0).
contar(arbolB(_, I, D), L) :-  
    contar(I, L1),
    contar(D, L2),
    L is L1 + L2 + 1.

%contar(arbolB(+,arbolB(x,arbolB(3,vacio,vacio),arbolB(5,vacio,vacio)),arbolB(-,arbolB(2,vacio,vacio),arbolB(5,vacio,vacio))) ,L).

%deArbolALista(arbol(R,I,D),listaRes).
%Calcular/conocer la profundidad del árbol

arbolC(+,arbolC(x,arbolC(3,arbolC(4,arbolC(6,vacio,vacio),vacio),vacio),arbolC(5,vacio,vacio)),arbolC(-,arbolC(2,vacio,vacio),arbolC(5,vacio,vacio))).
profundidad(vacio,0).
profundidad(arbolC(_,I,D),P) :-
	profundidad(I,PI),
	profundidad(D,PD),
	P is 1+max(PI,PD).

%

%Lista

arbolD(+,arbolD(x,arbolD(3,arbolD(4,arbolD(6,vacio,vacio),vacio),vacio),arbolD(5,vacio,vacio)),arbolD(-,arbolD(2,vacio,vacio),arbolD(5,vacio,vacio))).

lista(vacio, []).
lista(arbolD(Raiz, Izquierda, Derecha), Lista) :-
    lista(Izquierda, ListaIzquierda),
    lista(Derecha, ListaDerecha),
    append(ListaIzquierda,[Raiz|ListaDerecha], Lista).
%lista(arbolD(+,arbolD(x,arbolD(3,arbolD(4,arbolD(6,vacio,vacio),vacio),vacio),arbolD(5,vacio,vacio)),arbolD(-,arbolD(2,vacio,vacio),arbolD(5,vacio,vacio))) ,L).


%Contar la cantidad de hojas


%lista([raiz,[Hizq],[Hder]])izq  