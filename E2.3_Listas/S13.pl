%Listas

%Simple
mamiferos([leon,perro,tigre,caballo]).
semana([lunes,martes,miercoles]).

%Listas de listas
animales(
    [leon,tigre,jaguar],
    [caballo],
    [perro,oso],
    [oso_homigero]
).

%Listas como relación
animales(carnivoro,
    [lobo,leopardo,leon]
).

animales(insectivoro,
    [rana,camaleon]
).

%Listas y elementos
platillos(
    [pozole,pozolillo,menudo],
    tamales,
    [chile_relleno,chile_nogada],
    barbacoa
).

%Vectores
vector(
    [1,2,3],
    [x,y,z]
).



%Operaciones
%Comprobar
lista([]).
lista([_|T]) :- lista(T).

%--
%Agregar
insertar(E,L,Lr) :- Lr = [E|L].
insertar1(E,L,[E|L]).
insertar2(E, L, [Rh|Rt]) :- Rh = E, Rt = L.

%concatenar
concatenar([], L, L).
concatenar([H|T], L, [H|Result]) :- concatenar(T, L, Result).

%eliminar
eliminar(_, [], []).
eliminar(R, [R|T], T2) :- eliminar(R, T, T2).
eliminar(R, [H|T], [H|T2]) :- H \= R, eliminar(R, T, T2).

% eliminar1(_, [], []).
eliminar1(R, [R|T], T) :- !.
eliminar1(R, [H|T], [H|T2]) :- H \= R, eliminar1(R, T, T2).

%buscar
% buscar(H,[H|_]).
% buscar(X,[_|T]) :- lista([X|_]), buscar(X,[_|X]). 

buscar(X,[_|T]) :- buscar(X,T). 
buscar(H,[H|_]) :- write('El elemento si se encuentra en la lista'), nl.

%longitud
longitud([], 0).
longitud([_|T], L) :- longitud(T,L1), L is L1 + 1.


%length([1,2,3],X).
%member(1,[1,2,3]).
%is_list([1,2,3]).
%delete([1,2,3],2,L).
%append([1,2,3],[2,3,4],Lr).
%sort([1,4,8,3,5,2,9,8],Lr).
%msort([1,4,8,3,5,2,9,8],Lr).



%agregar:
% agregar(E, [], [E]) :- !.
% agregar(E,[H|T],[H|L] :- agregar(E,T,L)).

%concatenar
% concatenar([], L2, L2).
% concatenar([H|T], L2, [H|T3] :- concatenar (T1, L2, T3)).

%eliminar
% eliminar([],_,_).
% eliminar([H|T],B,N) :- H \= B, agregar(H,R,N), eliminar(T,B,R).
% eliminar([H|T], B, N) :- \+ (H \= B), eliminar(T,B,N).

% agregar(H,T,[H|T]).


contar_elementos(Tipo,Cant) :-
    animales(Tipo,Lista),
    longitud(Lista,Cant).

