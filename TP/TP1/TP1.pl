homme(albert).
homme(tom).
homme(daniel).
homme(david).
homme(michel).
homme(jack).
homme(john).
homme(scott).
homme(francois).

femme(marie).
femme(isabelle).
femme(jacques). 
femme(sylvie).
femme(maria).
femme(jeanne).
femme(august).
femme(linda).
femme(nicole).
femme(hana).
femme(jacqueline).
femme(chloe).

parent(albert, sylvie).
parent(marie, sylvie).
parent(tom, david).
parent(isabelle, david).
parent(jacques, michel).
parent(daniel, michel).
parent(sylvie, jack).
parent(sylvie, john).
parent(sylvie, august).
parent(david, jack).
parent(david, john).
parent(david, august).
parent(michel, linda).
parent(michel, nicole).
parent(maria, linda).
parent(maria, nicole).
parent(jeanne, scott).
parent(jack, scott).
parent(scott, hana).
parent(scott, francois).
parent(linda, hana).
parent(linda, francois).
parent(francois, chloe).
parent(jacqueline, chloe).

marie_a(albert, marie).
marie_a(tom, isabelle).
marie_a(daniel, jacques).
marie_a(david, sylvie).
marie_a(michel, maria).
marie_a(jack, jeanne).
marie_a(scott, linda).
marie_a(francois, jacqueline).

epoux(Homme, Femme) :-
	homme(Homme),
	femme(Femme),
	marie_a(Homme, Femme).

epouse(Femme, Homme) :- epoux(Homme, Femme).

pere(Person, Enfant) :-
	homme(Person),
	parent(Person, Enfant).

mere(Person, Enfant) :-
	femme(Person),
	parent(Person, Enfant).

enfant_de_meme_parents(X, Y) :-
	X \= Y,
	parent(Parent, X),
	parent(Parent, Y).	

frere(Frere, Enfant) :- 
	homme(Frere),
	enfant_de_meme_parents(Frere, Enfant).

soeur(Soeur, Enfant) :-
	femme(Soeur),
	enfant_de_meme_parents(Soeur, Enfant).

grand_parent(GrandParent, Enfant) :-
	parent(GrandParent, Parent),
	parent(Parent, Enfant).

grand_pere(GrandParent, Enfant) :-
	homme(GrandParent),
	grand_parent(GrandParent, Enfant).

grand_mere(GrandParent, Enfant) :-
	femme(GrandParent),
	grand_parent(GrandParent, Enfant).

oncle_ou_tante(Person, Enfant) :-
	parent(Parent, Enfant),
	enfant_de_meme_parents(Person, Parent).

oncle(Oncle, Enfant) :-
	homme(Oncle),
	oncle_ou_tante(Oncle, Enfant).

tante(Tante, Enfant) :-
	femme(Tante),
	oncle_ou_tante(Tante, Enfant).

cousin(X, Y) :-
	parent(ParentX, X),
	parent(ParentY, Y),
	enfant_de_meme_parents(ParentX, ParentY).

niece_ou_neveu(Enfant, Person) :-
	oncle_ou_tante(Person, Enfant).

niece(Enfant, Person) :-
	femme(Enfant),
	niece_ou_neveu(Enfant, Person).

neveu(Enfant, Person) :-
	homme(Enfant),
	niece_ou_neveu(Enfant, Person).

petit_fils(GrandParent, Fils) :-
	homme(Fils),
	grand_parent(GrandParent, Enfant).

petite_fille(GrandParent, Fille) :-
	femme(Fille),
	grand_parent(GrandParent, Fille).