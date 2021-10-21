pere_de(paul, christine).
pere_de(paul, sylvain).
pere_de(mathias, catherine).
pere_de(albert, francois).
pere_de(sylvain, nathalie).

mere_de(helene, christine).
mere_de(helene, sylvain).
mere_de(sylvie, catherine).
mere_de(christine, francois).
mere_de(catherine, nathalie).

parent_de(Parent, Enfant) :- pere_de(Parent, Enfant).
parent_de(Parent, Enfant) :- mere_de(Parent, Enfant).

enfant_de(Enfant, Parent) :- pere_de(Parent, Enfant).
enfant_de(Enfant, Parent) :- mere_de(Parent, Enfant).

grand_mere_de(GrandMere, Enfant) :- mere_de(GrandMere, Parent), parent_de(Parent, Enfant).
grand_pere_de(GrandPere, Enfant) :- pere_de(GrandPere, Parent), parent_de(Parent, Enfant).

mari_de(Male, Femelle) :- mere_de(Femelle, Enfant), pere_de(Male, Enfant).
femme_de(Femelle, Male) :- mere_de(Femelle, Enfant), pere_de(Male, Enfant).