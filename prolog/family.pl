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

husband(X,Y) :- wife(Y,X).
married(X,Y) :- wife(X,Y)|husband(X,Y).
sibling(X,Y) :- parent(Z,X),parent(W,X),father(Z,Y),mother(W,Y),X\=Y.
brother(X,Y) :- male(X),sibling(X,Y).
sister(X,Y) :- female(X), sibling(X,Y).
mother(X,Y) :- female(X), parent(X,Y).
father(X,Y) :- male(X), parent(X,Y).
secondparent(X,Y) :-( parent(Z,Y),sibling(X,Z))|(parent(W,Y),sibling(W,Z),married(Z,X)).
aunt(X,Y) :-  secondparent(X,Y),female(X).
uncle(X,Y) :- secondparent(X,Y), male(X).
cousin(X,Y) :- grandparent(Z,X),grandparent(Z,Y).
child(X,Y) :- parent(Y,X).
grandchild(X,Y) :- child(X,Z),child(Z,Y).
granddaughter(X,Y) :- female(X),grandchild(X,Y).
grandson(X,Y) :- male(X),grandchild(X,Y).
grandparent(X,Y) :- grandchild(Y,X).
grandfather(X,Y) :- male(X),grandparent(X,Y).
grandmother(X,Y) :- female(X),grandparent(X,Y).
