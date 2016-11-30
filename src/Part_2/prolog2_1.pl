inicio(e1).
fin(e3).
transicion(e1,a,e1).
transicion(e1,a,e2).
transicion(e1,b,e1).
transicion(e2,b,e3).
transicion(e2,_,e4).
transicion(e3,_,e1).
transicion(e3,b,e4).


aceptacadena([X|R]) :- inicio(I), transicion(I, X, Y), aceptacadenaactual(R, Y).
aceptacadenaactual([X|[]], E) :- fin(F), transicion(E,X,F).
aceptacadenaactual([X|R], E) :- transicion(E, X, Y), aceptacadenaactual(R, Y).


aceptacadenalg([],N):- N=0.
aceptacadenalg([X|Tail],N):- aceptacadenalg(Tail,Prev), N=Prev+1.
% Mirar esto a ver
