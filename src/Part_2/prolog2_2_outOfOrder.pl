% Representation of the monkey and the state of all things in the scene

% estado(LOC_MONO, ALT_MONO, LOC_SILLA, LOC_PLANATOS)
%         puerta    suelo     puerta      abajo
%         ventana   silla     ventana     arriba
%         centro              centro


% estado_inicial(puerta, suelo, ventana, arriba).
estado_final(estado(centro, silla, centro, abajo)).

% ---------TRANSICIONES---------
transicion(mover_silla(X,Z),estado(X,suelo,X,arriba),estado(Z,suelo,Z,arriba)).
transicion(subir_silla(X),estado(X,suelo,X,arriba),estado(X,silla,X,arriba)).
transicion(mover_mono(X,Z),estado(X,suelo,Y,arriba),estado(Z,suelo,Y,arriba)).
transicion(bajar_platano,estado(centro,silla,centro,arriba),estado(centro,silla,centro,abajo)).


% ----------OPERADORES----------
soluciona(EstadoIn,[]) :- estado_final(EstadoIn).
soluciona(EstadoIN,[O|Os]) :- transicion(O,EstadoIN, EstadoOUT), soluciona(EstadoOUT,Os),!.
