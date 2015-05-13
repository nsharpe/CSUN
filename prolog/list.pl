

lastelement([]).
lastelement([_|Y],Out) :- lastelement(Y,Out).
lastelement([Y],Y).

reverse([],[]).
reverse([X|Y],R) :- reverse(Y,Reverted), append(Reverted,[X],R).
