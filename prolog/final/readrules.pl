%Neil Sharpe
% reads words separated by white space and terminated by a period,
% and constucts a list.

read_word_list(Ws):-
        get0(C),C\==end_of_file,
        read_word_list(C,Ws).

read_word_list(C,[W|Ws]):-
        word_char(C),
        read_word(C,W,C1),
        read_word_list(C1,Ws).

read_word_list(C,Ws):-

        fill_char(C),
        get0(C1),
        read_word_list(C1,Ws).

read_word_list(C,[]):-
        end_of_words_char(C).

read_word(C,W,C1):-
        word_chars(C,Cs,C1),
        name(W,Cs).

word_chars(C,[C|Cs],C0):-
        word_char(C),!,get0(C1),
        word_chars(C1,Cs,C0).

word_chars(C,[],C):-
        not(word_char(C)).
word_char(C):-C>47,C<58.
word_char(C):-C >96,C<123.

%word_char(C):-C>64,C<91.



end_of_words_char(46).            % 46-period

%fill_char(33).                   % 33-xclamation
fill_char(44).                    % 44-comma
fill_char(32).                    % 32 space
fill_char(10).                    % 10 is newline
fill_char(9).                     % 9 is tab
fill_char(63).                    % \n

word_char(40).                  % (
word_char(41).                  % )
word_char(34).                  % "
word_char(49).                  % 1
word_char(50).                  % 2
word_char(95).
load_rules :-
  write('file name? '),
  read(F),
  write(F),
  open(F,read,Str),
  load_rules(Str).

load_rules(F) :-
 % clear_db,
  see(F),
  lod_ruls,
  write('rules loaded'), nl,
  seen, !.

lod_ruls :-repeat,
           read_word_list(L),
           printlist(L),nl,
	   processline(O,L),
	   assert(O),
	   L=[end].

again:-read_word_list(L),printlist(L).

% state(Noun,Status)
processline(state(Noun,Status),Ws):- read_word_list(Noun,Ws),skipword(G,Ws),read_word_list(Status,G),

skipword(Ws,[W|Ws]).



printlist([]).
printlist([H|T]) :-
  write(H), write(' '),
  printlist(T).



