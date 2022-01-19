% changer le caractère de la chaîne en minuscule.

readin :- get0(X), process(X).
process(10) :- nl.
process(X) :- X >= 65, X =< 90, Upper is X + 32, put(Upper), readin.
process(X) :- put(X), readin.

% ?- readin.
% |: I love You ChuCaMoa @#
% i love you chucamoa @#
% true .

write_to_file(File, Text) :-
	open(File, write, Stream),
	write(Stream, Text), nl,
	close(Stream).

% 1
write_nombres :-
	write_to_file('sortieavecformat.txt', "\t\tun\n\tdeux\ttrois\nquatre\tcinq\tsix").

% ?- write_nombres.
% true.

/*============================================================================================*/
readWord(InStream,W):-
	get_code(InStream,Char),
	checkCharAndReadRest(Char,Chars,InStream),
	atom_codes(W,Chars).

checkCharAndReadRest(9,[],_):- !.
checkCharAndReadRest(10,[],_):- !.
checkCharAndReadRest(32,[],_):- !.
checkCharAndReadRest(33,[],_):- !.
checkCharAndReadRest(44,[],_):- !.
checkCharAndReadRest(46,[],_):- !.
checkCharAndReadRest(58,[],_):- !.
checkCharAndReadRest(59,[],_):- !.
checkCharAndReadRest(63,[],_):- !.
checkCharAndReadRest(-1,[],_):- !.
checkCharAndReadRest(end_of_file,[],_):- !.

checkCharAndReadRest(Char,[Char|Chars],InStream):-
	get_code(InStream,NextChar),
	checkCharAndReadRest(NextChar,Chars,InStream).

% 2
main2(InFile):-
	open(InFile,read,Str),
	readin2(Str),
	close(Str),
	!.
readin2(Str):- at_end_of_stream(Str).
readin2(Str):- \+ at_end_of_stream(Str),
	readWord(Str, W), 
	write(W), nl,
	readin2(Str).

% ?- main2('temp.txt'). 
% i
% love
% you
% 3000
% more
% than
% 3000
% actually
% true.

%3 

% create a dictionary
ajouter_cle(Mot, Cles, []) :- member(Mot, Cles).
ajouter_cle(Mot, _, [Mot]).

ajouter_mot([], []).
ajouter_mot([Mot|Text], Cles) :-
	ajouter_mot(Text, C),
	ajouter_cle(Mot, C, Ans),	
	append(Ans, C, Cles).
	
egal(Mot, Mot, 1).
egal(_, _, 0).

compter_freq([], _, 0).
compter_freq([Mot|Text], Cle, Count) :-
	compter_freq(Text, Cle, C1),
	egal(Mot, Cle, C2),
	Count is C1 + C2.

compter_freq_text(_, [], []).
compter_freq_text(Text, [Cle|Cles], Freqs) :-
	compter_freq_text(Text, Cles, F),
	compter_freq(Text, Cle, Count),
	append([Count], F, Freqs).

print_dict([], []).
print_dict([X|Cles], [Y| Freqs]) :- write(X), write(" : "), write(Y), nl, print_dict(Cles, Freqs).

% test :-
% 	ajouter_mot([an, binh, cao, duong, an, binh], Cles),
% 	compter_freq_text([an, binh, cao, duong, an, binh], Cles, Freqs),
% 	print_dict(Cles, Freqs).


main3(InFile):-
	open(InFile,read,Str),
	readin3(Str, Words),
	ajouter_mot(Words, Cles),
	compter_freq_text(Words, Cles, Freqs),
	print_dict(Cles, Freqs),
	close(Str),
	!.
readin3(Str, []):- at_end_of_stream(Str).
readin3(Str, Words):- \+ at_end_of_stream(Str),
	readWord(Str, W), 
	readin3(Str, Ws),
	append([W], Ws, Words).

% ?- main3('temp.txt').
% i : 1
% love : 1
% you : 1
% more : 1
% than : 1
% 3000 : 2
% actually : 1
% true.