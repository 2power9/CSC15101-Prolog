plus_grand_que(_, [], []).
plus_grand_que(N, [E|L], [E|LR]) :-
	E > N,
	plus_grand_que(N, L, LR).
plus_grand_que(N, [_|L], LR) :- plus_grand_que(N, L, LR).



enlever(N, L, LR) :-
	N_1 is N - 1,
	N_1 >= 0,
	length(L, Len),
	N_1 =< Len,
	append(L1, [_|L2], L),
	length(L1, N_1),
	append(L1, L2, LR).


elemPair([], []).
elemPair([_], []).
elemPair([_, Even|L], [Even|LR]) :- elemPair(L, LR).