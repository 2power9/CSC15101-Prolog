% 6
fibonacci(1, 1).
fibonacci(2, 1).
fibonacci(N, R) :-
	N_1 is N - 1,
	fibonacci(N_1, Fibo_1),
	N_2 is N - 2,
	fibonacci(N_2, Fibo_2),
	R is Fibo_1 + Fibo_2.

% 7
add_impair(Nombre, 0):- 0 is mod(Nombre, 2).
add_impair(Nombre, Nombre).

somme_des_impairs([], 0).
somme_des_impairs([Nombre|L], S):-
	somme_des_impairs(L, S1),
	add_impair(Nombre, NombreRes),
	S is S1 + NombreRes.

% 8
add_pair(Nombre, 0):- 1 is mod(Nombre, 2).
add_pair(Nombre, Nombre).

somme_des_pairs([], 0).
somme_des_pairs([Nombre|L], S):-
	somme_des_pairs(L, S1),
	add_pair(Nombre, NombreRes),
	S is S1 + NombreRes.

% 9
compter_pair(Nombre, 0):- 1 is mod(Nombre, 2).
compter_pair(_, 1).

nombre_des_pairs([], 0).
nombre_des_pairs([Nombre|L], S):-
	nombre_des_pairs(L, S1),
	compter_pair(Nombre, Compter),
	S is S1 + Compter.