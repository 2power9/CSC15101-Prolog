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

edge(X,Y) :- byCar(X, Y); byTrain(X, Y); byPlane(X, Y).

travel1(X, Y) :- edge(X,Y).
travel1(X,Y) :-
	edge(X,Z),
	travel1(Z, Y).

% ?- travel1(valmont,singapore).
% true .
% ?- travel1(auckland,paris).   
% false.


/* path2 is just called when having a path from X to Y */
path2(X, Y) :-
	X=Y,
	write(Y), nl.
path2(X, Y) :-
	edge(X,Z),
	write(X), write(' -> '), 
	path2(Z, Y).

travel2(X, Y) :-
	travel1(X, Y),
	path2(X, Y).

% ?- travel2(valmont,singapore).
% valmont -> saarbruecken -> frankfurt -> bangkok -> auckland -> hamilton -> frankfurt -> singapore
% true .
% ?- travel2(auckland,paris).    
% false.


way(X, Y) :- byCar(X, Y), write(' --car-> ').
way(X, Y) :- byTrain(X, Y), write(' --train-> ').
way(X, Y) :- byPlane(X, Y), write(' --plane-> ').

/* path3 is just called when having a path from X to Y */
path3(X, Y) :-
	X=Y,
	write(Y), nl.
path3(X, Y) :-
	edge(X,Z),
	write(X),
	way(X, Z), 
	path3(Z, Y).

travel3(X, Y) :-
	travel1(X, Y),
	path3(X, Y).

% ?- travel3(valmont,singapore). 
% valmont --car-> saarbruecken --train-> frankfurt --plane-> bangkok --plane-> auckland --car-> hamilton --car-> frankfurt --plane-> singapore
% true .

% ?- travel3(auckland,paris).    
% false.