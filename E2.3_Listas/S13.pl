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

%buscar
% buscar(H,[H|_]).
% buscar(X,[_|T]) :- lista([X|_]), buscar(X,[_|X]). 

buscar(H,[H|_]) :- write('El elemento si se encuentra en la lista'), nl.
buscar(X,[_|T]) :- buscar(X,T). 

%longitud
longitud([], 0).
longitud([_|T], L) :- longitud(T,L1), L is L1 + 1.


%length([1,2,3],X).
%member(1,[1,2,3]).
%is_list([1,2,3]).
%delete([1,2,3],2,L).