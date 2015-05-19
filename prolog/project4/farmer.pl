% state(BoatPosition,FarmerPosition,SonPosition,DaughterPosition,DogPosition,HamsterPosition,RabbitPosition)


%father in boat

move(state(X,X,S,G,Dog,H,R),dadgoesalone(X,Y),state(Y,Y,S,G,Dog,H,R)).
move(state(X,X,X,G,Dog,H,R),dadmovesson(X,Y),state(Y,Y,Y,G,Dog,H,R)).
move(state(X,X,S,X,D,H,R),dadmovesdaughter(X,Y),state(Y,Y,S,Y,D,H,R)).
move(state(X,X,S,G,X,H,R),dadmovesdog(X,Y),state(Y,Y,S,G,Y,H,R)).
move(state(X,X,S,G,Dog,X,R),dadmoveshamster(X,Y),state(Y,Y,S,G,Dog,Y,R)).
move(state(X,X,S,G,Dog,H,X), dadmovesrabbit(X,Y), state(Y,Y,S,G,Dog,H,Y)).

%son in boat
move(state(X,F,X,S,Dog,H,R),songoesalone(X,Y),state(Y,F,Y,S,Dog,H,R)).
move(state(X,F,X,X,Dog,H,R),sonmovesdaughter(X,Y),state(Y,F,Y,Y,Dog,H,R)).
move(state(X,F,X,S,Dog,X,R),sonmoveshamsters(X,Y),state(Y,F,Y,S,Dog,Y,R)).
%daughter in boat
move(state(X,F,S,X,Dog,H,R),daughtergoesalone(X,Y),state(Y,F,S,Y,Dog,H,R)).
move(state(X,F,S,X,Dog,H,X),daughtermovesrabbits(X,Y),state(Y,F,S,Y,Dog,H,Y)).

dogdoesnotbite(state(_,X,_,_,X,_,_)).
dogdoesnotbite(state(_,X,X,X,_,X,X)).

daughterdoesnotteases(state(_,_,X,_,_,X,_)).
daughterdoesnotteases(state(_,_,X,X,_,_,_)).

sondoesnotteases(state(_,_,_,X,_,_,X)).
sondoesnotteases(state(_,_,X,X,_,_,_)).


noteasing(State) :-  sondoesnotteases(State), daughterdoesnotteases(State).
canmove(State,PastStates) :- noteasing(State), dogdoesnotbite(State),notcontains(State,PastStates).

start(State,Plan):-getplan(State,Plan,[State]).

done(state(w,w,w,w,w,w,w)).


getplan(State,_,_) :- done(State).
getplan(State1,Plan,PastStates) :- move(State1,Move,State2),
			canmove(State2,PastStates),
			add(State2,PastStates,NewStates),
			getplan(State2,PartialPlan,NewStates),
			add(Move,PartialPlan,Plan).

add(X,L,[X|L]).

notcontains(_,[]).
notcontains(X,[S|Y]) :- S\=X, notcontains(X,Y).
