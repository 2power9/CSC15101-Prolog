trainDirect(paris,nancy). 
trainDirect(nancy,metz). 
trainDirect(metz,strasbourg). 
trainDirect(paris,lyon). 
trainDirect(lyon, marseille). 
trainDirect(marseille,nice). 
trainDirect(paris, lehavre).

allerDe(X,Y) :- trainDirect(X, Y).
allerDe(X,Y) :- 
	trainDirect(X, Z),
	allerDe(Z, Y).

% ?- allerDe(marseille,lyon).
% false.

% ?- allerDe(paris,strasbourg). 
% true .