male(neilsharpe).
male(kensharpe).
male(justinsharpe).
male(louielopez).
male(larrylopez).
male(johnlopez).
male(richdemot).
female(annesharpe).
female(olgalopez).
female(paulahirsh).
female(jaqiehirsh).
female(lindahirsh).
female(robertademot).
female(rachaeldemot).
female(amelialopez).
wife(annesharpe,kensharpe).
wife(olgalopez,louielopez).
wife(ameilalopez,johnlopez).
wife(robertademot,richdemot).
parent(kensharpe,neilsharpe).
parent(kensharpe,justinsharpe).
parent(annesharpe,neilsharpe).
parent(annesharpe,justinsharpe).
parent(louielopez,annesharpe).
parent(olgalopez,annesharpe).
parent(louielopez,larrylopez).
parent(olgalopez,larrylopez).
parent(olgalopez,robertademot).
parent(louielopez,robertademot).
parent(louielopez,paulahirsh).
parent(olgalopez,paulahirsh).
parent(louielopez,johnlopez).
parent(olgalopez,johnlopez).
parent(paulahirsh,jaqiehirsh).
parent(paulahirsh,lindahirsh).

husband(H,W) :- wife(W,H).
married(X,Y) :- wife(X,Y)|husband(X,Y).
brother(B,Y) :- male(B),sibling(B,Y).
sister(S,Y) :- female(S), sibling(S,Y).
mother(M,Y) :- female(M), parent(M,Y).
father(F,Y) :- male(F), parent(F,Y).
secondparent(P,Y) :-( parent(Z,Y),sibling(P,Z))|(parent(W,Y),sibling(W,Z),married(Z,P)).
aunt(A,Y) :-  secondparent(A,Y),female(A).
uncle(M,Y) :- secondparent(M,Y), male(M).
cousin(X,Y) :- (aunt(A,X),parent(A,Y))|(uncle(U,X),parent(U,Y)).
child(X,Y) :- parent(Y,X).
grandchild(X,Y) :- child(X,Z),child(Z,Y).
granddaughter(X,Y) :- female(X),grandchild(X,Y).
grandson(X,Y) :- male(X),grandchild(X,Y).
grandparent(X,Y) :- grandchild(Y,X).
grandfather(X,Y) :- male(X),grandparent(X,Y).
grandmother(X,Y) :- female(X),grandparent(X,Y).

sibling(X,Y) :- fullsibling(X,Y) | halfsibling(X,Y).

fullsibling(X,Y) :- father(F,X), father(F,Y), mother(M,X), mother(M,Y),not(X=Y).
halfsibling(X,Y) :- parent(P,X), parent(P,Y), not( fullsibling(X,Y) ),not(X=Y).


