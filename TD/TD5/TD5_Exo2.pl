:- dynamic interiuer/2.
inclus(katarina,olga).
inclus(olga,natsha).
inclus(natsha,irina).

interieur(X, Y) :- inclus(X, Y).
interieur(X, Y) :-
	inclus(X, Z),
	interieur(Z, Y).

% ?- interieur(katarina,natsha).
% true .
% ?- interieur(natsha,katarina).
% false.