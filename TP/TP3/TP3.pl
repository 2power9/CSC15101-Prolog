% Exercice 1

alterner([], [], []).
alterner([], [E2|L2], [E2|L3]) :- alterner([], L2, L3).
alterner([E1|L1], [], [E1|L3]) :- alterner(L1, [], L3).
alterner([E1|L1], [E2|L2], L3) :-
	alterner(L1, L2, Postfix),
	append([E1, E2], Postfix, L3).

% Exercice 2

fleche(v1, v2, 3).
fleche(v1, v3, 5).
fleche(v1, v4, 13).
fleche(v1, v6, 25).
fleche(v1, v7, 5).
fleche(v2, v7, 17).
fleche(v3, v4, 15).
fleche(v4, v2, 4).
fleche(v4, v6, 2).
fleche(v7, v6, 15).

print_path([_], Total) :-
	write('Total : '), write(Total), nl.

print_path([U|Path], T) :-
	append([V], _, Path),
	fleche(U, V, Weight),
	maplist(write, [U, ' -> ', V, ' : ', Weight]), nl,
	Total is T + Weight,
	print_path(Path, Total).


backtracking(T, T, Path) :- print_path(Path, 0).
backtracking(U, T, P) :-
	fleche(U, V, _),
	append(P, [V], Path),
	backtracking(V, T, Path).

traverser(X, Y) :- backtracking(X, Y, [X]).

/*	Demo:

?- alterner([1,3,5],[2,4,6],[1,2,3,4,5,6]).
true .

?- alterner([1,3,5],[2,4,6],[1,2,3,4,6]).   
false.

?- alterner([1,3,5],[2,4,6,7,8,9], Ans).        
Ans = [1, 2, 3, 4, 5, 6, 7, 8, 9] .

?- alterner([1,3,5,7,8,9,10],[2,4,6], Ans).   
Ans = [1, 2, 3, 4, 5, 6, 7, 8, 9|...] .

?- traverser(v1,v4).
v1 -> v3 : 5
v3 -> v4 : 15
Total : 20
true ;
v1 -> v4 : 13
Total : 13
true .

?- traverser(v4,v1). 
false.

*/