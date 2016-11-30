% Representation of the monkey and the state of all things in the scene

% estado(LOC_MONO, ALT_MONO, LOC_SILLA, LOC_PLANATOS)
%         puerta    suelo     puerta      abajo
%         ventana   silla     ventana     arriba
%         centro              centro

estado(puerta, suelo, ventana, arriba).
% estadoFinal(centro,silla,centro,abajo).

% ----------OPERADORES----------

% We have to (build a wall) finish this.

estado(centro,silla,centro,abajo):- estado(centro,silla,centro,arriba).
estado(X,silla,X,arriba):- estado(X,suelo,X,arriba), (X=puerta;X=ventana;X=centro).
estado(Y,suelo,Y,arriba):- estado(X,suelo,X,arriba), X\=Y , (Y=puerta;Y=ventana;Y=centro).
estado(X,suelo,_,arriba):- estado(Y,suelo,_,arriba), X\=Y , (X=puerta;X=ventana;X=centro).
