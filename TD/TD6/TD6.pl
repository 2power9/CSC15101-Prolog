% 1
tous_a([]).
tous_a([a|Q]) :- tous_a(Q).

% 2
remplacer_a_b_c([], []).
remplacer_a_b_c([a|ListeEntree], [b|ListeSortie]) :- remplacer_a_b_c(ListeEntree, ListeSortie).
remplacer_a_b_c([b|ListeEntree], [c|ListeSortie]) :- remplacer_a_b_c(ListeEntree, ListeSortie).
remplacer_a_b_c([c|ListeEntree], [a|ListeSortie]) :- remplacer_a_b_c(ListeEntree, ListeSortie).

% 3
nieme([Ans|_], 1, Ans).
nieme([], X, _) :- X > 0, write('Index out of range'), nl.
nieme([_|Q], Index, Ans) :- 
	Index1 is Index - 1,
	nieme(Q, Index1, Ans).

%4
egale([], []).
egale([X|Q1], [X|Q2]) :- egale(Q1, Q2).

double(Liste) :-
	append(Prefix, _ , Liste),
	append(_, Suffix, Liste),
	length(Prefix, LengthPrefix),
	length(Suffix, LengthSuffix),
	LengthPrefix =:= LengthSuffix,
	length(Liste, Length),
	Length =:= LengthPrefix + LengthSuffix,
	egale(Prefix, Suffix).

% 5
est_liste(X) :- var(X), !, fail.
est_liste([]).
est_liste([_|Q]) :- est_liste(Q).

aplatir([], []).
aplatir([X|Liste],Liste1) :-
	est_liste(X),
	aplatir(X, Prefix),
	aplatir(Liste, Suffix),
	append(Prefix, Suffix, Liste1).
aplatir([X|Liste], Liste1) :-
	aplatir(Liste, Suffix),
	append([X], Suffix, Liste1).

% 6
palindrome(Liste) :-
	reverse(Liste, RevListe),
	egale(Liste, RevListe).

% 7
premier_dernier(L,LR) :-
	length(L, Len),
	Len >= 2,
	append(Prefix, Reste, L),
	length(Prefix, 1),
	append(LR, Suffix, Reste),
	length(Suffix, 1).

% 8
dernier([X], X).
dernier([_|L], X) :- dernier(L, X).

% 9
echanger(L, LR) :-
	length(L, Len),
	Len >= 2,
	append(Prefix, R1, L),
	length(Prefix, 1),
	append(R2, Suffix, R1),
	length(Suffix, 1),
	append(Suffix,R2, R3),
	append(R3, Prefix, LR).

% 10

bulle(X,[],[],X).
bulle(X,[Y|Q],[Y|QR],Max):- 
	X > Y,
	bulle(X,Q,QR,Max).
bulle(X,[Y|Q],[X|QR],Max):- 
	X =< Y,
	bulle(Y,Q,QR,Max).

tri_b([],Acc,Acc).
tri_b([T|Q],Acc,R):-
	bulle(T,Q,QR,Max),
	tri_b(QR,[Max|Acc],R).

tri_bulle(L,R):- tri_b(L,[],R).

% ?- tri_bulle([1,5,4,3,2],Ans).
% Ans = [1, 2, 3, 4, 5] .