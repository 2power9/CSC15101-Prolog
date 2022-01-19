chemin(h11,h21).
chemin(h11,v12).
chemin(h31,h41).
chemin(h41,h51).
chemin(h41,v15).

chemin(v11,h11).
chemin(v12,h22).
chemin(v12,v22).
chemin(v13,h32).
chemin(v14,h41).
chemin(v15,h52).
chemin(v16,h62).
chemin(v16,v26).
chemin(v17,h61).

chemin(h12,h22).
chemin(h12,v22).
chemin(h32,v14).
chemin(h42,v14).
chemin(h52,h62).
chemin(h52,v26).
chemin(h62,v17).

chemin(v22,h13).
chemin(v22,h23).
chemin(v23,h32).
chemin(v24,v14).
chemin(v25,h52).
chemin(v27,v17).

chemin(h13,v21).
chemin(h23,v23).
chemin(h33,v23).

% printPath([]).
% printPath([Node| Path]) :-
% 	write(Node), write('-> '),
% 	printPath(Path).

% back_tracking(F, F, Path) :-
% 	printPath(Path).

% back_tracking(U, F, Path) :-
% 	chemin(U, V),
% 	append(Path, [V], Path2),
% 	back_tracking(V, F, Path2).

traverser(Y, Y).
traverser(X, Y) :-
	chemin(X, Z),
	write(X), write(' to '), write(Z), nl,
	traverser(Z, Y).