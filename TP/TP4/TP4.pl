readWord(InStream, W, IsEndList):-
	get_code(InStream,Char),
	checkCharAndReadRest(Char,Chars, IsEndList, InStream),
	atom_codes(W,Chars).

checkCharAndReadRest(9,[], 0,_):- !.
checkCharAndReadRest(10,[], 1,_):- !.
checkCharAndReadRest(32,[], 0,_):- !.
checkCharAndReadRest(33,[], 0,_):- !.
checkCharAndReadRest(44,[], 0,_):- !.
checkCharAndReadRest(46,[], 1,_):- !.
checkCharAndReadRest(58,[], 0,_):- !.
checkCharAndReadRest(59,[], 0,_):- !.
checkCharAndReadRest(63,[], 0,_):- !.
checkCharAndReadRest(-1,[], 1,_):- !.
checkCharAndReadRest(end_of_file,[], 1,_):- !.

checkCharAndReadRest(Char,[Char|Chars],IsEndList,InStream):-
	get_code(InStream,NextChar),
	checkCharAndReadRest(NextChar,Chars, IsEndList, InStream).


% Exercice 1 :

getSum(Str, [], _) :- at_end_of_stream(Str).
getSum(Str, SumList, S):- 
	readWord(Str, Word, IsEndList),
	atom_number(Word, Num),
	Sum is S + Num,
	( IsEndList =:= 1 ->
		getSum(Str, Postfix, 0),
		append([Sum], Postfix, SumList);
		getSum(Str, SumList, Sum)
	).

printSumList(_, []).
printSumList(Str, [Num|Rest]) :-
	writeln(Str, Num),
	printSumList(Str, Rest).

calcule(InFile, OutFile):-
	open(InFile, read, StreamIn),
	getSum(StreamIn, SumList, 0), % return a list of sum of every single line
	close(StreamIn), !,

	open(OutFile, write, StreamOut),
	printSumList(StreamOut, SumList), % print this list into file
	close(StreamOut).

% ?- calcule('input.txt', 'ouput.txt').
% true .


% Exercice 2 :
s(C) :- append(A,B,C), np(A), vp(B). % format of a sentence
np([Det|Noun]):-  det([Det]), n(Noun). % format of a noun phrase

vp(V):- v(V).
vp([Verb|Noun]):- v([Verb]), np(Noun). % format of a verb + noun phrase

det([the]).
det([a]).
det([an]).

n([cat]).
n([man]).
n([boy]).
n([dog]).
n([Adj|Rest]) :-
	adj([Adj]),
	n(Rest).

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

% grouping the words in the same line into a list
getSentence(Str, [], _) :- at_end_of_stream(Str).
getSentence(Str, Text, S):- 
	readWord(Str, Word, IsEndList),
	append(S, [Word], Sentence),
	( IsEndList =:= 1 ->
		getSentence(Str, Postfix, []),
		append([Sentence], Postfix, Text);
		getSentence(Str, Text, Sentence)
	).

writeSentence([Word]) :- write(Word), writeln(".").
writeSentence([Word|Rest]) :-
	write(Word), write(" "),
	writeSentence(Rest).

processSentence(Sentence) :-
	s(Sentence),
	writeln("True").
processSentence(_) :- writeln("False").


printText([], _).
printText([Sentence|Rest], Index) :-
	Check is Index mod 2,
	(Check =:= 0 -> % remove trailing array (ex: [,])
		writeSentence(Sentence),
		processSentence(Sentence);
		true
	),
	NexIndex is Index + 1,
	printText(Rest, NexIndex).

grammaire(InFile) :-
	open(InFile, read, StreamIn),
	getSentence(StreamIn, Text, []),
	close(StreamIn), !,

	printText(Text, 0).

% ?- grammaire('input2.txt').
% a man sees a small brown cat.
% True
% see boy small.
% False
% true .