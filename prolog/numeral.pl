
equals(z,z).
equals(X,X).
equals(s(X),s(X)).

plus(z,Out,Out).
plus(Out,z,Out).
plus(s(X),Y,Out) :- plus(X,Y,U), s(U) = Out.

less_then(z,X) :- X\=z.
less_then(s(X),s(Y)) :- less_then(X,Y).

greater_then(X,z) :- X\=z.
greater_then(s(X),s(Y)) :- greater_then(X,Y).

subtract(Out,z,Out).
subtract(s(X),s(Y),Out) :- subtract(X,Y,Out).

multiplication(X,s(z),X).
multiplication(s(z),X,X).
multiplication(X,Y,Out) :- decrement(Y,S),multiplication(X,S,M), plus(X,M,Out).

divide(X,Y,s(z)) :- equals(X,Y).
divide(X,Y,z) :- less_then(X,Y).
divide(X,Y,Out) :- subtract(X,Y,S), divide(S,Y,D), increment(D,Out).

remainder(z,_,z).
remainder(X,Y,Out) :- divide(X,Y,D), multiplication(D,Y,M), subtract(X,M,Out).

factorial(z,s(z)).
factorial(s(z),s(z)).
factorial(X,Out) :- decrement(X,D),factorial(D,F),multiplication(X,F,Out).

increment(X,s(X)).
decrement(s(X),X).
