% 1

s1 --> [].
s1 --> left1, s1, right1.

left1 --> [a].
right1 --> [b].

% ?- s1([a,a,b,b],[]).
% true .

% ?- s1([],[]).        
% false.

% ?- s1([a,a,b,b,b],[]).
% false.

/* ====== */

%2

s2 --> [a, b].
s2 --> left2, s2, right2.

left2 --> [a].
right2 --> [b].

% ?- s2([a,a,b,b],[]).
% true .

% ?- s2([],[]).        
% true.

% ?- s2([a,a,b,b,b],[]).
% false.

/* ====== */

% 3

s3 --> [].
s3 --> left3, s3, right3.

left3 --> [a].
right3 --> [b, b].

% ?- s([a,a,b,b,b,b],[]). 
% true .

% ?- s([a,a,b,b,b],[]).   
% false.

% ?- s([],[]).          
% true .

/* ====== */

% 4

s4 --> [].
s4 --> left_a_4, s4, right_a_4.
s4 --> left_b_4, s4, right_b_4.

left_a_4 --> [a].
right_a_4 --> [a].

left_b_4 --> [b].
right_b_4 --> [b].

% ?- s4([a,b,b,a],[]).     
% true .

% ?- s4([a,b,a,b,a],[]).  
% false.

% ?- s4([],[]).          
% true .

/* ====== */

% 5

s5 --> [a].
s5 --> [b].
s5 --> left_a_5, s5, right_a_5.
s5 --> left_b_5, s5, right_b_5.

left_a_5 --> [a].
right_a_5 --> [a].

left_b_5 --> [b].
right_b_5 --> [b].

% ?- s5([a,b,b,a],[]).
% false.

% ?- s5([a,b,a,b,a],[]).
% true .

% ?- s5([],[]).
% false.

% ?- s5([a,b,a,b,b],[]). 
% false.

/* ====== */

% 6
s(C) :- np(A), vp(B), append(A,B,C).
np(D):- det(A), adj(B), n(C), append(A,B,X), append(X, C, D).
vp(C):- v(A), np(B), append(A,B,C).
vp(C):- v(C).

det([the]).
det([a]).
det([an]).

n([cat]).
n([man]).
n([boy]).
n([dog]).

v([sat]).
v([saw]).
v([hears]).
v([took]).
v([sees]).
v([will_see]).

adj([large]).
adj([small]).
adj([brown]).
adj([orange]).
adj([green]).
adj([blue]).
adj([]).

% ?- s([a,small,boy,saw,a,cat]).
% true .

% ?- s([small,boy,saw,a,cat]).   
% false.