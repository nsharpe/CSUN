

last([]).
last(Out,[_|Y]) :- last(Out,Y).
last(Y,[Y]).

reverse([],[]).
reverse([X|Y],R) :- reverse(Y,Reverted), append(Reverted,[X],R).
