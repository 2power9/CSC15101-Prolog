/* Animals Database */
animal(mammal,tiger,carnivore,stripes).
animal(mammal,hyena,carnivore,ugly).
animal(mammal,lion,carnivore,mane).
animal(mammal,zebra,herbivore,stripes).
animal(bird,eagle,carnivore,large).
animal(bird,sparrow,scavenger,small).
animal(reptile,snake,carnivore,long).
animal(reptile,lizard,scavenger,small).

/* a. tous les mammifères */
mammiferes(X) :- animal(mammal, X, _, _).

/* b. tous les carnivores qui sont des mammifères */
carnivores_sont_mammiferes(X) :- animal(mammal, X, carnivore, _).

/* c. tous les mammifères avec des rayures */
mammiferes_ont_rayures(X) :- animal(mammal, X, _, stripes).

/* d. s’il y a un reptile qui a une crinière */
reptile_a_criniere(X) :- animal(reptile, X, _, mane).