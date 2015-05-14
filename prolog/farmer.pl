% State(BoatPosition,FarmerPosition,SonPosition,DaughterPosition,DogPosition,HamsterPosition,RabbitPosition)

move([e,e,e,e,e,e,e],[w,w,e,e,w,w,e]).%complete
move([e,e,e,e,e,e,e],[w,w,e,e,w,e,w]).%complete
move([e,e,e,e,e,e,e],[w,w,e,e,w,e,e]).%complete
move([w,w,e,e,w,w,e],[e,e,e,e,e,w,e]).
move([w,w,e,e,w,w,e],[e,e,e,e,w,e,e]).
move([w,w,e,e,w,w,e],[e,e,e,e,e,e,e]).%complete
move([w,w,e,e,w,e,w],[e,e,e,e,w,e,e]).
move([w,w,e,e,w,e,w],[e,e,e,e,e,e,w]).
move([w,w,e,e,w,e,w],[e,e,e,e,e,e,e]).%complete
move([e,e,e,e,e,w,e],[w,w,e,w,w,w,e]).
move([e,e,e,e,e,w,e],[w,w,e,e,w,w,e]).%complete





dogbites(state(X,S,D,Y,H,R),Out) :- not(X=Y), Out = (S=Y;D=Y;H=Y;R=Y).
%daughterteases(state(_,X,Y,_,Y,_),Out) :- Out = not(X=Y).
%sonteases( state( _,X,Y,_,_,X ),Out) :- not(X=Y).
