% Representation of the monkey and the state of all things in the scene

% estado(LOC_MONO, ALT_MONO, LOC_SILLA, LOC_PLANATOS)
%         puerta    suelo     puerta      abajo
%         ventana   silla     ventana     arriba
%         centro              centro

estadoInicial(puerta, suelo, ventana, arriba).
estadoFinal(centro,silla,centro,abajo).

% ----------OPERADORES----------

% We have to (build a wall) finish this.

bajarPlatanos(centro,silla,centro,arriba):- (centro,silla,centro,abajo)
subeASilla(X,suelo,X,_):- (X,silla,X,_).
empujarSilla(Y,suelo,Y,_):- (X,suelo,X,_), X\=Y .
moverMono(X,suelo,_,_):- (Y,suelo,_,_), X\=Y .
