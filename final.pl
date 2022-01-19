generate_(N, N, []).
generate_(N, I, [Num|LR]) :-
	I_1 is I + 1,
	generate_(N, I_1, LR),
	Num is N**I.

generate(N, LR) :-
	generate_(N, 0, LR).

firstlast([], []).
firstlast([Num], [[Num]]).
firstlast([Left|List], [[Left, Right]|L]) :-
	append(List1, [Right], List),
	firstlast(List1, L).

add_line([], [], []).
add_line([Left|L1], [Right|L2], [E|R]) :-
	add_line(L1, L2, R),
	E is Left + Right.

add([], [], []).
add([Left|L1], [Right|L2], [AnsLine|R]) :-
	add(L1, L2, R),
	add_line(Left, Right, AnsLine).

magique([], []).
magique(L, LR) :- func2(L, [], LR).
func1(T, [[T, _]|_]).
func1(T,[[_, _]|Q]) :- func1(T, Q).
func2([], A, L) :- reverse(A, L).
func2([T|Q], A, R) :- not(func1(T, A)), func2(Q,[[T,1]|A], R).
func2([T|Q], A, R) :- func1(T, A), func3(T, A, A1), func2(Q,A1, R).
func3(T,[[T,Q]|LR], [[T, Q1]|LR]) :- Q1 is Q+1.
func3(T,[T1|Q], [T1|R]) :- func3(T,Q, R).
