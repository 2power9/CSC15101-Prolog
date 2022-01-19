afficher_edge(Src, Dest, Lenght):-
    write(Src),
    write(' -> '),
    write(Dest),
    write(' : '),
    write(Lenght),nl.

% Le chemin de Src à Src est égal à 0 (zero)
traverser(Src, Src):-
    afficher_edge(Src, Src, 0),
    write('Total : 0'),nl.

%% chemin(Src, Dest, Total).
:-  dynamic chemin/3.

% Cherche des chemins de Src à Dest
traverser(Src, Dest):-
    % grâce à "fail" dans le "essayer fonction", 
    % j'ultilise \+ à continuer.
    \+ essayer(Src, Dest),

    % vérifer s'il ly a au moins un chemin de Src à Dest 
    % dans la base de données
    chemin(Src, Dest, _). 

% essayer et chercher tous les chemins possibles,
% et les ajouter dans la base de données si les trouver
essayer(Src, Dest):-
    % appeler accompagne traverser
    acc_traverser(Src, Dest, Total),

    % il y a un chemin de Src à Dest
    % écrivez Total dans le terminal
    write('Total : '), write(Total), nl,

    % si le résultat n'existe pas dans la base de données, 
    % ajoutez-le à la base de données
    (   \+ chemin(Src, Dest, Total)
    ->  assert(chemin(Src, Dest, Total))
    ),

    % "fail" ici à essayer de chercher un autre resultat
    fail.

acc_traverser(A, B, Length):- 
    % Il est possible qu'on peut aller directemment de A à B
    edge(A, B, Length_from_A_to_B),
    afficher_edge(A,B, Length_from_A_to_B),
    Length is Length_from_A_to_B.

acc_traverser(A, B, Length):- 
    % Chercher une transition C entre A et B, 
    % et il est possible qu'on peut aller directemment de C à B 
    edge(C, B, Length_from_C_to_B),

    % Chercher des chemins de A à C
    acc_traverser(A, C, Length_from_A_to_C),

    % Si il est un chemins de A à C, écriver le chemin de C à B
    afficher_edge(C, B, Length_from_C_to_B),

    % Calculater Length de A à B
    Length is Length_from_A_to_C + Length_from_C_to_B.