% state(BoatPosition,FarmerPosition,SonPosition,DaughterPosition,DogPosition,HamsterPosition,RabbitPosition)


%father in boat
move(state(X,X,X,D,Dog,H,R),dadmovesson(X,Y),state(Y,Y,Y,D,Dog,H,R)) :- not(X=Y).
move(state(X,X,S,X,D,H,R),dadmovesdaughter(X,Y),state(Y,Y,S,Y,D,H,R)) :- not(X=Y).
move(state(X,X,S,D,X,H,R),dadmovesdog(X,Y),state(Y,Y,S,D,Y,H,R)) :- not(X=Y).
move(state(X,X,S,D,Dog,X,R),dadmoveshamster(X,Y),state(Y,Y,S,D,Dog,Y,R)) :- not(X=Y).
move(state(X,X,S,D,Dog,H,X),dadmovesrabbit(X,Y),state(Y,Y,S,D,Dog,H,Y)) :- not(X=Y).
move(state(X,X,S,D,Dog,H,R),dadgoesalone(X,Y),state(Y,Y,S,D,Dog,H,R)) :- not(X=Y).


%son in boa
move(state(X,F,X,X,Dog,H,R),sonmovesdaughter(X,Y),state(Y,F,Y,Y,Dog,H,R)) :- not(X=Y).
move(state(X,F,X,D,Dog,X,R),sonmoveshamsters(X,Y),state(Y,F,Y,D,Dog,Y,R)) :- not(X=Y).
move(state(X,F,X,D,Dog,H,R),songoesalone(X,Y),state(Y,F,Y,D,Dog,H,R)) :- not(X=Y).
%daughter in boat
move(state(X,F,S,X,Dog,H,X),daughtermovesrabbits(X,Y),state(Y,F,S,Y,Dog,H,Y)) :- not(X=Y).
move(state(X,F,S,X,Dog,H,R),daughtergoesalone(X,Y),state(Y,F,S,Y,Dog,H,R)) :- not(X=Y).


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


getplan(State,_,_) :- done(State).
getplan(State1,Plan,PastStates) :- move(State1,Move,State2),
			write(State2),
			canmove(State2,PastStates),
			add(State2,PastStates,NewStates),
			getplan(State2,PartialPlan,NewStates),
			add(Move,PartialPlan,Plan).

add(X,L,[X|L]).

notcontains(_,[]).
notcontains(X,[S|Y]) :- S\=X, notcontains(X,Y).
