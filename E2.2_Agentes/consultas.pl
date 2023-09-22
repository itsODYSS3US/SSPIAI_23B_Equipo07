bc :- consult('bconocimientos.pl').
%N :- Nombre del elemento
%C :- Símbolo del elemento

inicio :-
nl,
write('---Menu---'), nl,
write('1. Mostrar Base de conocimientpo'), nl,
write('2. Agregar nuevo hecho'), nl,
write('3. Eliminar hecho'), nl,
write('4. Buscar hecho'), nl,
write('5. Modificar'), nl,
write('6. Salir'), nl,
write('Ingrese una opcion (1-6): '), nl,
read(OP),
opcion(OP).

%Opcion seleccionado por el usuario
opcion(1) :- mostrar, inicio.
opcion(2) :- agregar, inicio.
opcion(3) :- eliminar, inicio.
opcion(4) :- buscar, inicio.
opcion(5) :- modificar, inicio.
opcion(6) :- write('Fin de programa...'), !.
opcion(_):- write('Ingrese un dato valido'), nl, nl, inicio.

%Mostrar
mostrar :- listing(elemento/2), nl.

%Agregar
    %Guardar los cambios en la base de conocimiento
guardar :- tell('bconocimientos.pl'), listing(elemento/2), told.
    %Agregar elemento insertado por el usuario

agregar :- write("Escriba el elemento: "), nl, read(N), agregar(N).

agregar(N) :- \+elemento(N,_) , write("Escriba el simbolo: "), nl, read(C), assert(elemento(N,C)), guardar , write('Gardado...'), nl.
agregar(N) :- elemento(N,_) , write("El elemento que desea agregar ya existe"), nl.


%Eliminar
eliminar :- write('Escriba el elemento que desea borrar: '), nl, read(N), eliminar(N).

eliminar(N) :- elemento(N,_), retract(elemento(N,_)), guardar, write('Eliminado...'), nl.
eliminar(N) :- elemento(_,N), retract(elemento(_,N)), guardar, write('Eliminado...'), nl.

eliminar(N) :- \+elemento(N,_), write('No se puede eliminar porque el elemento no se encuentra...'), nl.
eliminar(N) :- \+elemento(_,N), write('No se puede eliminar porque el elemento no se encuentra...'), nl.

%Buscar
buscar :- write("Escriba el elemento o simbolo a buscar: "), read(N), buscar(N,_).
    %En caso de encontrar el elemento
buscar(N,C) :- elemento(N,C), write('Elemento encontrado'), nl, write(N), write(' su simbolo es: '), write(C), nl; elemento(C,N), write('Valor encontrado'), nl, write(N), write(' su simbolo es: '), write(C), nl.
    %En caso de no encontrar el elemento
buscar(N,C) :- \+elemento(N,C), write('Elemento no encontrado'), nl, write("¿Deseas guardarlo? Si(s), No(n)"), nl, read(R), opMod(R) ; \+elemento(C,N), write('Simbolo no encontrado'), write("¿Deseas guardarlo? Si(s), No(n)"), nl, read(R), opMod(R).
    %Switch para regresar al inicio o agregar elemento
opMod(s):- agregar.
opMod(n):- write("Regresando al inicio..."), nl, nl,inicio.

%Modificar
    %Elemento encontrado a modificar
modificar :- write("Que elemento deseas modificar?: ") , nl, read(N), modificar(N).

modificar(N) :-  elemento(N,_), retract(elemento(N,_)), agregar.
modificar(N) :-  elemento(_,N), retract(elemento(_,N)), agregar.
    %Elemento no se encuentra en la base de conocimiento
modificar(N) :- \+elemento(N,_), write("El elemento no se puede modificar porque no existe en la base de conocimiento"), nl.
modificar(N) :- \+elemento(_,N), write("El elemento no se puede modificar porque no existe en la base de conocimiento"), nl.


