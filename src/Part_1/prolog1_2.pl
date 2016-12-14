hombre(javier).
hombre(pedro).
hombre(jorge).
hombre(alfonso).
hombre(juan).
mujer(maria).
mujer(carmen).
mujer(teresa).
mujer(alicia).
progenitor(javier,pedro).
progenitor(javier,teresa).
progenitor(jorge,alicia).
progenitor(maria,pedro).
progenitor(maria,teresa).
progenitor(pedro,alfonso).
progenitor(pedro,juan).
progenitor(carmen,juan).
progenitor(carmen,alfonso).
progenitor(teresa,alicia).

padre(X,Y):- progenitor(X,Y), hombre(X).
madre(X,Y):- progenitor(X,Y), mujer(X).
hijo(X,Y):- progenitor(Y,X), hombre(X).
abuelo(X,Y):- progenitor(X,Z),progenitor(Z,Y), hombre(X).
hermano(X,Y):- padre(Z,X),padre(Z,Y),madre(K,X),madre(K,Y),X\=Y, hombre(X).
tio(X,Y):- hermano(X,Z),progenitor(Z,Y), hombre(X).
descendiente(X,Y):- progenitor(Y,Z),descendiente(X,Z).
descendiente(X,Y):- progenitor(Y,X).
