% state(MonkeyHorizontal,MonkeyVertical,BigBoxPosition,HasBanana,SmallBoxHorizontal,SmallBoxVertical)


move( state(middle,onbox,middle,_,middle,onbox),
      grasp,
      state(middle,onbox,middle,has,middle,onbox)).

move( state(middle,onfloor,middle,H,middle,onbox),
      climb,
      state(middle,onbox,middle,H,middle,onbox ) ).

move( state( P,onfloor,P,H,P,onfloor),
      stack,
      state( P,onfloor,P,H,P,onbox ) ).

move( state(P1,onfloor,P,H,P1,onfloor),
      pushsmall(P1,middle),
      state(middle,onfloor,P,H,middle,onfloor)).
% Neil Sharpe

move( state(P1,onfloor,P1,H,P,onfloor),
      pushbig(P1,P2),
      state(P2,onfloor,P2,H,P,onfloor)).

move( state(P1, onfloor, B1,H,B2,onfloor),
      walk(P1,P2),
      state(P2,onfloor,B1,H,B2,onfloor)).

canget( state(_,_,_,has,_,_) ).

canget( State1 ) :-
	move(State1,Move,State2),
	State1\==State2,
        canget(State2).

canget( state(_,_,_,has,_,_), []).

canget( State1, Plan ) :-
       move(State1,Move,State2),
       State1\==State2,
       canget(State2,PartialPlan),
       add(Move,PartialPlan,Plan).

add(X,L,[X|L]).
