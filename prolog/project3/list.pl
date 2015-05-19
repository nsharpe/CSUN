# Neil Sharpe

last([]).
last(Out,[_|Y]) :- last(Out,Y).
last(Y,[Y]).

reverse([],[]).
reverse([X|Y],R) :- reverse(Y,Reverted), append(Reverted,[X],R).

index([Out|_],0,Out).
index([_|Y],Position,Out) :- decrement(Position,I),index(Y,I,Out).

size([_|Y],Out) :- size(Y,Index),increment(Index,Out) .
size([],0).
size(_,1).

compress([Duplicate|Y],Duplicate,Out) :- compress(Y,Duplicate,Out).
compress([X|Y],_,Out) :- compress(Y,X,G), add(X,G,Out).
compress(Y,Y,[]).
compress(Y,_,Y).


decrement(X,Out) :- Out is X - 1.
increment(X,Out) :- Out is X + 1.
add(X,Y,[X|Y]).
