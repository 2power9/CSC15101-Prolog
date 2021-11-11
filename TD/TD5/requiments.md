# Exercice 1: Nombres entiers
- Définition récursive de successeur
- Ajouter des prédicats suivants
    - Add
    - Mult
    - Plus_grand_que
    - Moins_que
    - Egale_a
```
numeral(0).
numeral(succ(X)):-numeral(X).
```

# Exercice 2: Matriochkas(pouppées russes)
- Série de poupées de tailles décroissantes placées les unes à l'intérieur des autres.

| Example |
|:--------:|
|![](https://i.imgur.com/0Crrt0y.png)|

1. Écrivez la base de faits `inclus(X,Y)` pour exprimer l'inclusion immédiate d'une poupée dans une autre.
2. Définissez récursivement le prédicat `intérieur(X,Y)` : la poupée X est incluse dans Y.
3. Donnez des requêtes pour vérifier vos résultats.

# Exercice 3: Réseau ferré
La base de faits suivante explicite les villes qu'il est possible de relier via un train direct.
```
trainDirect(paris,nancy).
trainDirect(nancy,metz).
trainDirect(metz,strasbourg).
trainDirect(paris,lyon).
trainDirect(lyon,marseille).
trainDirect(marseille,nice).
trainDirect(paris,lehavre).
```
Construire un prédicat récursif `allerDe(X,Y)`, qui est vrai si l'on peut aller de `X` à `Y`.

# Exercice 4: Voyager
Étant donné une base de faits suivante:
```
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).
byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).
byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).
```
1. Définir un prédicat `travel1(X,Y)` qui est vrai si l'on peut aller de `X` à `Y`.
2. Définir un prédicat `travel2` qui est vrai si l'on peut aller de `X` à `Y` en affichant toutes les villes traversées.
3. Définir un prédicat `travel3` qui est vrai si l'on peut aller de `X` à `Y` en affichant toutes les villes traversées et tous les moyens de transport utilisés.