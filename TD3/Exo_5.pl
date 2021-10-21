person(frances,wilson,female,28,architect).
person(fred,jones,male,62,doctor).
person(paul,smith,male,45,plumber).
person(martin,williams,male,23,chemist).
person(mary,jones,female,24,programmer).
person(martin,johnson,male,47,solicitor).

% a. tous les males.
male(Prenom, Nom) :- person(Prenom, Nom, male, _, _).

% b. toutes les femmes.
femelle(Prenom, Nom) :- person(Prenom, Nom, female, _, _).

% c. toutes les personnes ayant le prénom 'martin'.
prenom_martin(Nom) :- person(martin, Nom, _, _, _).

% d. le nom et prénom des docteurs.
docteur(Prenom, Nom) :- person(Prenom, Nom, _, _, doctor).

% e. le prénom des programmeurs.
programmeur(Prenom, Nom) :- person(Prenom, Nom, _, _, programmer).

% f. le nom et prénom des chemistes.
chemiste(Prenom, Nom) :- person(Prenom, Nom, _, _, chemist).

% g. toutes les personnes avec son age < 45.
plus_jeune_45(Prenom, Nom) :- person(Prenom, Nom, _, Age, _), Age < 45.

% h. tous les chemistes avec son age entre 30 et 60.
chemiste_entre_30_et_60(Prenom, Nom) :- person(Prenom, Nom, _, Age, chemist), Age >= 30, Age =< 60.