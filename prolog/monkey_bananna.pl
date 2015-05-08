% state(MonkeyHorizontal,MonkeyVertical,BigBoxPosition,SmallBoxHorizontal,HasBanana,SmallBoxVertical)


move( state(middle,onbox,middle,middle,hasnot,onbox),
      grasp,
      state(middle,onbox,middle,middle,has,onbox)).

move( state(middle,onfloor,middle,middle,H,onbox),
      climb,
      state(middle,onbox,middle,middle,H,onbox ) ).

move( state( middle,onfloor,middle,middle,H,onfloor),
      stack,
      state( middle,onfloor,middle,middle,H,onbox ) ).

move( state(P1,onfloor,middle,P1,H,onfloor),
      pushsmall(P1,middle),
      state(middle,onfloor,middle,middle,H,onfloor)).

move( state(P1,onfloor,P1,P,H,onfloor),
      pushbig(P1,middle),
      state(middle,onfloor,middle,P,H,onfloor)).

move( state(P1, onfloor, B1,B2,H,onfloor),
      walk(P1,P2),
      state(P2,onfloor,B1,B2,H,onfloor)).

canget( state(_,_,_,_,has,_) ).

canget( State1 ) :-
	move(State1,Move,State2),
	canget(State2).

canget( state(_,_,_,_,has,_), []).

canget( State1, Plan ) :-
       move(State1,Move,State2),
       canget(State2,PartialPlan),
       add(Move,PartialPlan,Plan).

add(X,L,[X|L]).


creep.
