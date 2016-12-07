% Representation of the monkey and the state of all things in the scene

% estado(LOC_MONO, ALT_MONO, LOC_SILLA, LOC_PLANATOS)
%         puerta    suelo     puerta      abajo
%         ventana   silla     ventana     arriba
%         centro              centro

% estado(puerta, suelo, ventana, arriba).
% estadoFinal(centro,silla,centro,abajo).

% estado_inicial(puerta, suelo, ventana, arriba).
estado_final(centro, silla, centro, abajo).
transicion(bajar_platano,estado(centro,silla,centro,arriba),estado(centro,silla,centro,abajo)).
transicion(subir_silla,estado(X,suelo,X,arriba),estado(X,silla,X,arriba)).
transicion(mover_silla(Y,X),estado(Y,suelo,Y,arriba),estado(X,suelo,X,arriba)).
transicion(mover_mono(Y,X),estado(Y,suelo,_,arriba),estado(X,suelo,_,arriba)).



% ----------OPERADORES----------
soluciona(estado(X,Y,Z,W),_) :- estado_final(X,Y,Z,W).
soluciona(estado(Q,W,E,R),Operador) :- transicion(Operador,estado(Q,W,E,R), estado(A,S,D,F)),soluciona(estado(A,S,D,F),_).






% estado(centro,silla,centro,abajo):- estado(centro,silla,centro,arriba).
% estado(X,silla,X,arriba):- estado(X,suelo,X,arriba).
% estado(X,suelo,_,arriba):- estado(Y,suelo,_,arriba), X\=Y.
% estado(Y,suelo,Y,arriba):- estado(X,suelo,X,arriba), X\=Y.
