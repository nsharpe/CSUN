% state(MonkeyHorizontal,MonkeyVertical,BigBoxPosition,SmallBoxHorizontal,HasBanana,SmallBoxVertical)


move( state(middle,onbox,middle,middle,hasnot,onbox),
      grasp,
      state(middle,onbox,middle,middle,has,onbox)).

move( state( P,onfloor,P,P,H,onfloor),
      stack,
      state( P,onfloor,P,P,H,onbox ) ).

move( state(P,onfloor,P,P,H,onbox),
      climb,
      state(P,onbox,P,P,H,onbox ) ).

move( state(P1,onfloor,P,P1,H,onfloor),
      pushsmall(P1,P2),
      state(P2,onfloor,P,P2,H,onfloor)).

move( state(P1,onfloor,P1,P,H,onfloor),
      pushbig(P1,P2),
      state(P2,onfloor,P2,P,H,onfloor)).

move( state(P1, onfloor, B1,B2,H,onfloor),
      walk(P1,P2),
      state(P2,onfloor,B1,B2,H,onfloor)).

canget( state(_,_,_,_,has,_) ).

canget( State1 ) :-
	move(State1,Move,State2),
	canget(State2),write(Move).

canget( state(_,_,_,_,has,_), []).

canget( State1, Plan ) :-
	move(State1,Move,State2),
	canget(State2,PartialPlan),
	add(Move,PartialPlan,Plan).

add(X,L,[X|L]).

creep.
