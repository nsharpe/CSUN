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
married(annesharpe,kensharpe).
married(olgalopez,louielopez).
married(ameilalopez,johnlopez).
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

sibling(X,Y) :- child(X,Z),child(Y,Z),X\=Y.
brother(X,Y) :- male(X),sibling(X,Y).
sister(X,Y) :- female(X), sibling(X,Y).
mother(X,Y) :- female(X), parent(X,Y).
father(X,Y) :- male(X), parent(X,Y).
aunt(X,Y) :-  parent(Z,Y), sister(X,Z).
uncle(X,Y) :- parent(Z,Y), brother(X,Z).
cousin(X,Y) :- grandparent(Z,X),grandparent(Z,Y).
child(X,Y) :- parent(Y,X).
grandchild(X,Y) :- child(X,Z),child(Z,Y).
granddaughter(X,Y) :- female(X),grandchild(X,Y).
grandson(X,Y) :- male(X),grandchild(X,Y).
grandparent(X,Y) :- grandchild(Y,X).
grandfather(X,Y) :- male(X),grandparent(X,Y).
grandmother(X,Y) :- female(X),grandparent(X,Y).
