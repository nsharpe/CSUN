

reverse([],[]).
reverse([X|Y],R) :- reverse(Y,Reverted), append(Reverted,[X],R).
