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
contar(nil, 0).
contar(arbol(_, I, D), L) :-  
    contar(I, L1),
    contar(D, L2),
    L is L1 + L2 + 1.


%deArbolALista(arbol(R,I,D),listaRes).
%Calcular/conocer la profundidad del árbol


%Lista


%Contar la cantidad de hojas


%lista([raiz,[Hizq],[Hder]])izq  