:-  [airlines].

tripk(Start,Dest,A,Path) :-
    visit(Start,Dest,[Start],Price,Time,Route,Plane),
    length(Plane,AirlineNo),
    Time < A,
    Path = [Price,Time,AirlineNo,Route].

trip(Start,Dest,Path):-
    visit(Start, Dest, [Start], Price,Time,Route, Plane),
    length(Plane,AirlineNo),
    Path = [Price,Time,AirlineNo, Route].

visit(X, Y, VisitDone, Price, Time, Route, Plane) :-
    (flight(Z, X, Y, Price1, Duration); flight(Z, Y, X, Price1, Duration)),
     airport(X, Money, Sec),
     not(member(Y, VisitDone)),
     Price is Price1 + Money,
     Time is Duration + Sec,
     Route = [[X,Z,Y]],
     Plane = [Z].

visit(X, Y, VisitDone, Price, Time, Route, Plane) :-
    (flight(Z, X, Y1, Price1, Duration1); flight(Z, Y1, X, Price1, Duration1)),
      not(member(Y1, VisitDone)),
      airport(X, Money1, Sec1),
      visit(Y1, Y, [Y1|VisitDone], RestCost, DurationLeft, Pathleft, AirlinesLeft),
      Price is Price1 + RestCost + Money1,
      Time is Duration1 + Sec1 + DurationLeft,
      Route = [[X,Z,Y1] |Pathleft],
      newAir(Z, AirlinesLeft, Plane).

newAir(AL,PlaneList,Grade) :-
    member(AL,PlaneList),
    Grade = PlaneList, !.

newAir(AL,PlaneList,Grade) :-
    Grade = [AL|PlaneList].

multicitytrip(Start,Dest,Fast,Path) :-
    moreReach(Start, Dest, [Start], FastList, Price, Time, Route, Plane),
    Fast \= Dest,
    length(Plane,AirlineNo),
    member(Fast,FastList),
    Path = [Price,Time,AirlineNo, Route]. 

moreReach(X, Y, VisitDone, Fast, Price, Time, Route, Plane) :-
    (flight(Z,X,Y,Price1,Duration); flight(Z,Y,X,Price1,Duration)),
    airport(X,Money,Sec),
    not(member(Y,VisitDone)),
    Price is Price1 + Money,
    Time is Duration + Sec,
    Fast = [Y],
    Route = [[X,Z,Y]],
    Plane = [Z].

moreReach(X, Y, VisitDone, Fast, Price, Time, Route, Plane) :-
    (flight(Z,X,Y1,Price1,Duration1); flight(Z,Y1,X,Price1,Duration1)),
    not(member(Y1,VisitDone)),
    airport(X,Money1,Sec1),
    moreReach(Y1,Y,[Y1|VisitDone],FastRest, RestCost, DurationRest, PathRest, AirlinesRest),
    Price is Price1 + RestCost + Money1,
    Time is Duration1 + Sec1 + DurationRest,
    Fast = [Y1|FastRest],
    Route = [[X,Z,Y1]|PathRest],
    newAir(Z,AirlinesRest,Plane).


