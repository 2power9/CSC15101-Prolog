# Exercices
1. Définir le prédicat `tous_a(Liste)`: vrai si Liste ne contient que des lettres $a$.

2. Définir le prédicat `remplacer_a_b_c(ListeEntree, ListeSortie)` qui permet de remplacer des $a$ dans `ListeEntree` par des $b$, des $b$ dans `ListeEntree` par des $c$, et des $c$ dans `ListeEntree` par des $a$.

3. Définir le prédicat `nieme/3` qui retourne le $n^{ième}$ élément de la liste.

4. Une liste est doublée si elle est constituée de deux blocs consécutifs d'éléments qui sont exactement les mêmes.
    - Exemple: $[a, b, c, a, b, c]$ est doublé.
    - Par contre: $[a, b, c, d, a, b, c]$ n'est pas doublé. 

    Définir le prédicat `double(Liste)` qui retourne vrai si la liste est doublée, faux sinon.

5. Définir le prédicat `aplatir(Liste,Liste1)` qui prend une liste $Liste$ (avec éventuellement des listes imbriquées), retourne dans $Liste1$ la liste aplatie (sans imbrication des listes).

6. Définir le prédicat `palindrome/1` qui est vrai si l'inverse d'une liste est elle-même.

7. Définir le prédicat `premier_dernier(L,LR)` qui
    - est faux si la liste $L$ contient moins que 2 éléments.
    - supprime le premier et le dernier élément de la liste L et retourne le résultat dans $LR$.
    - Exemple:
    ```
    ?- premier_dernier([a,b,c,d],R)
    R = [b,c]
    ```
8. Définir le prédicat `dernier(L, X)` dans lequel
    - $L$ est une liste avec au moins un élément.
    - $X$ est le dernier élément de la liste $L$.
    - Deux façons: En utilisant le prédicat `reverse/2` et la définition récursive.

9. Définir le prédicat `echanger(L, LR)` qui échange le premier et le dernier élément de la liste $L$ est retourne le résultat dans $LR$. Exemple:
    ```
    ?- echanger([1,2,3,4],R)
    R = [4,2,3,1]
    ```

10. Tri à bulles d'une liste des entiers.