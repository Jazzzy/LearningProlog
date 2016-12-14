#Prolog 1

[toc]

##1.- Determina las posibles parejas que vendrán al baile

```Prolog
chica(rosa).
chica(laura).
chica(ana).
chico(pedro).
chico(juan).
chico(pablo).
pareja(X,Y):- chico(X),chica(Y).
```

###Qué respuesta se obtendrá para las siguientes consultas:


####?-pareja(X,Y).
Podremos obtener las siguientes combinaciones de X e Y:
```Prolog
X = pedro,
Y = rosa ;
X = pedro,
Y = laura ;
X = pedro,
Y = ana ;
X = juan,
Y = rosa ;
X = juan,
Y = laura ;
X = juan,
Y = ana ;
X = pablo,
Y = rosa ;
X = pablo,
Y = laura ;
X = pablo,
Y = ana.
```

####?-pareja(X,ana).
Las tres combinaciones de hombres para Ana:
```Prolog
X = pedro ;
X = juan ;
X = pablo.
```
####?-pareja(X,juan).
No dará salida pues el hombre esta a la derecha y no se hacen combinaciones (hombre,hombre).

####?-pareja(luis,Y).
Tampoco da salida pues no existe el nombre "Luis" entre los hechos introducidos.






##2.- Relaciones familiares
```Prolog
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

//Introducimos nosotros las reglas:
hijo(X,Y):- progenitor(Y,X), hombre(X).
abuelo(X,Y):- progenitor(X,Z),progenitor(Z,Y), hombre(X).
hermano(X,Y):- padre(Z,X),padre(Z,Y),madre(K,X),madre(K,Y),X\=Y, hombre(X).
tio(X,Y):- hermano(X,Z),progenitor(Z,Y), hombre(X).
descendiente(X,Y):- progenitor(Y,X).
descendiente(X,Y):- progenitor(Y,Z),descendiente(X,Z).
```

####?- hijo(juan,pedro).
```Prolog
true
```
####?- abuelo(javier,teresa).
```Prolog
false
```
####?- hijo(javier,X).
```Prolog
false
```
####?- hijo(X,pedro).
```Prolog
X = alfonso ;
X = juan.
```
####?- descendiente(X,javier).
```Prolog
X = alfonso ;
X = juan ;
X = alicia ;
X = pedro ;
X = teresa.
```
####?- hijo(pedro,X).
```Prolog
X = javier ;
X = maria.
```
####?- hermano(pedro,X).
```Prolog
X = teresa ;
false.
```
