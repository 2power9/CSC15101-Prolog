add(0, Y, Y).
add(X, Y, Z) :-
    X1 is X - 1, 
    add(X1, Y, Z1),
    Z is Z1 + 1.

% ?- add(2,5,Ans).
% Ans = 7 .

mult(0, _, 0).
mult(X, Y, Z) :-
    X1 is X - 1,
    mult(X1, Y, Z1),
    Z is Y + Z1.

% ?- mult(12,15,Z). 
% Z = 180 .

plus_grand_que(succ(_), 0).
plus_grand_que(succ(X), succ(Y)) :- plus_grand_que(X, Y).

% 27 ?- plus_grand_que(succ(succ(0)),succ(0)). 
% true.
% ?- plus_grand_que(succ(0),succ(succ(0))). 
% false.

moin_que(0, succ(_)).
moin_que(succ(X), succ(Y)) :- moin_que(X, Y).

% ?- moin_que(succ(0),succ(succ(0))).
% true.
% moin_que(succ(succ(succ(0))),succ(succ(0))). 
% false.

egale_a(0,0).
egale_a(succ(X), succ(Y)) :- egale_a(X, Y).

% ?- egale_a(succ(0),succ(0)).
% true.
% ?- egale_a(succ(0),succ(succ(0))). 
% false.