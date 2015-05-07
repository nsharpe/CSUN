% state(MonkeyHorizontal,MonkeyVertical,BigBoxPosition,SmallBoxPosition,HasBanana)
%

move( state(middle,onbox,middle,middle,hasnot),
      grasp,
      state(middle,onbox,middle,middle,has)).

move( state(P,onfloor,P,P,H),
      climb,
      state(P,onbox,P,P,H ) ).

move( state(P1,onfloor,P1,P,H),
      pushbig(P1,P2),
      state(P2,onfloor,P2,P,H)).

move( state(P1,onfloor,middle,P1,H),
      pushsmall(P1,P2),
      state(P2,onfloor,middle,P2,H)).

move( state(P1, onfloor, B,P,H),
      walk(P1,P2),
      state(P2,onfloor,B,P,H)).

canget( state(_,_,_,_,has) ) :- write("get").
canget( State1 ) :-
	move(State1,Move,State2),
	canget(State2).

canget( state(_,_,_,_,has), []).

canget( State1, Plan ) :-
	move(State1,Move,State2),
	canget(State2,PartialPlan),
	add(Move,PartialPlan,Plan).

add(X,L,[X|L]).
