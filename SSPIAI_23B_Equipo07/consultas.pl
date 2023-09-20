bc :- consult('bconocimientos.pl').
%N :- Nombre del elemento
%C :- Símbolo del elemento

inicio :-
write('---Menu---'), nl,
write('1. Mostrar Base de conocimientpo'), nl,
write('2. Agregar nuevo hecho'), nl,
write('3. Eliminar hecho'), nl,
write('4. Buscar hecho'), nl,
write('5. Modificar'), nl,
write('6. Salir'), nl,
write('Ingrese una opcion (1-6): '),
read(OP),
opcion(OP).

%Opcion seleccionado por el usuario
opcion(1) :- mostrar, inicio.
opcion(2) :- agregar, inicio.
opcion(3) :- eliminar, inicio.
opcion(4) :- buscar, inicio.
opcion(5) :- modificar, inicio.
opcion(6) :- !.
opcion(_):- write('Ingrese un dato valido'), nl, nl,inicio.

%Mostrar
mostrar :- listing(elemento/2).

%Agregar
guardar :- tell('bconocimientos.pl'), listing(elemento/2), told, write('Guardado...').
agregar :- write("Escriba el elemento y su simbolo, al final poner un punto"), nl, read(N), read(C), assert(elemento(N,C)), guardar.

%Eliminar
eliminar :- write("Escriba el elemento a borrar: "), nl, read(N), retract(elemento(N,C)), guardar.
eliminar :- write("Escriba el elemento a borrar: "), nl , read(C), retract(elemento(N,C)), guardar.

%Buscar
buscar :- write("Escriba el elemento o simbolo a buscar: "), read(N), buscar(N).
buscar(N) :- elemento(N,C), write('Elemento encontrado'), nl, write(N), write(' su simbolo es: '), write(C) ; elemento(C,N), write('Valor encontrado'), nl, write(N), write(' su simbolo es: '), write(C).
buscar(N) :- \+elemento(N,_), write('Elemento no encontrado') ; \+elemento(_,N), write('Simbolo no encontrado').

%Modificar
modificar :- write("Que elemento deseas borrar: ") , read(N), elemento(N,C), retract(elemento(N,C)), agregar.
modificar :- write("Que elemento deseas borrar: ") , read(N), \+elemento(N,C), write("El elemento no se puede modificar porque no existe en la base de conocimiento"), nl, modificar.

