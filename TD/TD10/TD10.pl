% Exercice 1

deplacer(1,Gauche, Milieu, _) :-
	maplist(write, ['deplacer le disque superieur de ', Gauche, ' -> ', Milieu]), nl.
deplacer(N, Gauche, Milieu, Droite) :-
	N > 1,
	M is N - 1,
	deplacer(M,Gauche, Droite, Milieu),
	deplacer(1, Gauche, Milieu, _),
	deplacer(M, Droite, Milieu, Gauche).

/*
?- deplacer(5, gauche, milieu, droite). 
deplacer le disque superieur de gauche -> milieu
deplacer le disque superieur de gauche -> droite
deplacer le disque superieur de milieu -> droite
deplacer le disque superieur de gauche -> milieu
deplacer le disque superieur de droite -> gauche
deplacer le disque superieur de droite -> milieu
deplacer le disque superieur de gauche -> milieu
deplacer le disque superieur de gauche -> droite
deplacer le disque superieur de milieu -> droite
deplacer le disque superieur de milieu -> gauche
deplacer le disque superieur de droite -> gauche
deplacer le disque superieur de milieu -> droite
deplacer le disque superieur de gauche -> milieu
deplacer le disque superieur de gauche -> droite
deplacer le disque superieur de milieu -> droite
deplacer le disque superieur de gauche -> milieu
deplacer le disque superieur de droite -> gauche
deplacer le disque superieur de droite -> milieu
deplacer le disque superieur de gauche -> milieu
deplacer le disque superieur de droite -> gauche
deplacer le disque superieur de milieu -> droite
deplacer le disque superieur de milieu -> gauche
deplacer le disque superieur de droite -> gauche
deplacer le disque superieur de droite -> milieu
deplacer le disque superieur de gauche -> milieu
deplacer le disque superieur de gauche -> droite
deplacer le disque superieur de milieu -> droite
deplacer le disque superieur de gauche -> milieu
deplacer le disque superieur de droite -> gauche
deplacer le disque superieur de droite -> milieu
deplacer le disque superieur de gauche -> milieu
true .
*/

% Exercice 2

% maison(couleur, nationalite, animal, boisson, cigarette).

voisin(A, B, Ms) :- append(_, [A, B|_], Ms).
voisin(A, B, Ms) :- append(_, [B, A|_], Ms).

maisons(Ms) :-
	length(Ms, 5),
	Ms = [m(_, norvegien, _, _, _)|_], % 1
	voisin(m(_, norvegien, _, _, _), m(bleue, _, _, _, _), Ms), % 2
	Ms = [_, _, m(_, _, _, lait, _), _, _], % 3
	member(m(rouge, anglais, _, _, _), Ms), % 4
	member(m(verte, _, _, cafe, _), Ms), % 5
	member(m(jaune, _, _, _, kool), Ms), % 6
	append(_, [m(verte, _, _, _, _), m(blanc, _, _, _, _)|_], Ms), % 7
	member(m(_, espagnol, chien, _, _), Ms), % 8
	member(m(_, ukrainian, _, the, _), Ms), % 9
	member(m(_,japonais, _, _, craven), Ms), % 10
	member(m(_, _, escargot, _, old_gold), Ms), % 11
	member(m(_, _, _, vin, gitane), Ms), % 12
	voisin(m(_, _, _, _, chesterfield), m(_, _, renard, _, _), Ms), % 13
	voisin(m(_, _, _,_, kool), m(_, _, cheval, _, _), Ms), % 14
	member(m(_, _, zebre, _, _), Ms), % 15.1
	member(m(_, _, _, eau, _), Ms). % 15.2

habitant_a_zebre(Habiant) :-
	maisons(Maisons),
	member(m(_, Habiant, zebre, _, _), Maisons).

habitant_boit_eau(Habiant) :-
	maisons(Maisons),
	member(m(_, Habiant, _, eau, _), Maisons).

/*
?- habitant_a_zebre(Habitant).
Habitant = japonais .

?- habitant_boit_eau(Habitant).
Habitant = norvegien .
*/