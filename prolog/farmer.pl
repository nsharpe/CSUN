% state(BoatPosition,FarmerPosition,SonPosition,DaughterPosition,DogPosition,HamsterPosition,RabbitPosition)


%father in boat
move(state(X,X,X,D,Dog,H,R),dadmovesson(X,Y),state(Y,Y,Y,D,Dog,H,R)) :- not(X=Y).
move(state(X,X,_,X,_,_,_),dadmovesdaughter(X,Y),state(Y,Y,_,Y,_,_,_)) :- not(X=Y).
move(state(X,X,_,_,X,_,_),dadmovesdog(X,Y),state(Y,Y,_,_,Y,_,_)) :- not(X=Y).
move(state(X,X,_,_,_,X,_),dadmoveshamster(X,Y),state(Y,Y,_,_,_,Y,_)) :- not(X=Y).
move(state(X,X,_,_,_,_,X),dadmovesrabbit(X,Y),state(Y,Y,_,_,_,_,Y)) :- not(X=Y).
move(state(X,X,_,_,_,_,_),dadgoesalone(X,Y),state(Y,Y,_,_,_,_,_)) :- not(X=Y).


%son in boa
move(state(X,_,X,X,_,_,_),sonmovesdaughter(X,Y),state(Y,_,Y,Y,_,_,_)) :- not(X=Y).
move(state(X,_,X,_,_,X,_),sonmoveshamsters(X,Y),state(Y,_,Y,_,_,Y,_)) :- not(X=Y).
move(state(X,_,X,_,_,_,_),songoesalone(X,Y),state(Y,_,Y,_,_,_,_)) :- not(X=Y).
%daughter in boat
move(state(X,_,_,X,_,_,X),daughtermovesrabbits(X,Y),state(Y,_,_,Y,_,_,Y)) :- not(X=Y).
move(state(X,_,_,X,_,_,_),daughtergoesalone(X,Y),state(Y,_,_,Y,_,_,_)) :- not(X=Y).


dogdoesnotbite(state(_,X,_,_,X,_,_)).
dogdoesnotbite(state(_,X,X,X,_,X,X)).

daughterdoesnotteases(state(_,_,X,_,_,X,_)).
daughterdoesnotteases(state(_,_,X,X,_,_,_)).

sondoesnotteases(state(_,_,_,X,_,_,X)).
sondoesnotteases(state(_,_,X,X,_,_,_)).


noteasing(State) :-  sondoesnotteases(State), daughterdoesnotteases(State).
canmove(State,PastStates) :- noteasing(State), dogdoesnotbite(State),notcontains(State,PastStates).

start(State,Plan):-getplan(State,Plan,[]).

done(state(w,w,w,w,w,w,w)).


getplan(State,_,_) :- done(State),!.
getplan(State1,Plan,PastStates) :- move(State1,Move,State2),
			canmove(State2,PastStates),
			add(State2,PastStates,NewStates),
			getplan(State2,PartialPlan,NewStates),
			add(Move,PartialPlan,Plan).

add(X,L,[X|L]).

notcontains(_,[]).
notcontains(X,[S|Y]) :- S\=X, notcontains(X,Y).
