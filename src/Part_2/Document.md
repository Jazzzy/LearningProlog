#Prolog 2

[toc]

##1.- T1. Implementación de un autómata no determinista

Dado el autómata finito no determinista definido en el boletín de prácticas, donde cada posible transición viene etiquetada por la letra que acepta y la transición lambda (vacía) está sin etiquetar. El estado final es el estado e3.

###a) Represente el autómata por los siguientes hechos (Esto sería la base de hechos inicial o conjunto
de predicados iniciales):

- e1 es el estado inicial.
- e3 es un estado final.
- hay 7 transiciones en el autómata, cinco que están etiquetadas y dos que no (transiciones
lambda). Representa cada transición, mediante un predicado con tres argumentos: estado de
partida, etiqueta de la transición y estado resultante.

La base de hechos sería la siguiente:

```prolog
inicio(e1).
fin(e3).
transicion(e1,a,e1).
transicion(e1,a,e2).
transicion(e1,b,e1).
transicion(e2,b,e3).
transicion(e2,_,e4).
transicion(e3,_,e1).
transicion(e3,b,e4).
```

###b) Implemente las reglas necesarias que verifiquen si el autómata acepta o no una determinada lista de caracteres de entrada.
Por ejemplo:

- ? - aceptacadena([b,a,b,a,b]).
true .
- ? - aceptacadena([a,a,a]).
False .

La implementación de estas reglas podría ser la siguiente:

```prolog
aceptacadena([X|R]) :- inicio(I), transicion(I, X, Y), aceptacadenaactual(R, Y).
aceptacadenaactual([X|[]], E) :- fin(F), transicion(E,X,F).
aceptacadenaactual([X|R], E) :- transicion(E, X, Y), aceptacadenaactual(R, Y).
```

###c) ¿Cómo realizaría la consulta para saber qué cadena de longitud 3 acepta el autómata?

Una consulta como la siguiente nos diría las combinaciones de cadenas de longitud 3 que se aceptarían por el automata:

```prolog
?- aceptacadena([X,Y,Z]).
X = Y, Y = a,
Z = b ;
X = Z, Z = b,
Y = a ;
false.
```

###d) Implemente una regla que permita consultar si el autómata acepta una cadena de longitud determinada.

Una posible implementación de dicha regla podría ser:

```prolog
aceptacadenalg(Arr,N):- length(Arr,N), aceptacadena(Arr).
```

La cual podremos llamar de la siguiente forma para obtener:

```prolog
?- aceptacadenalg(C,4).
C = [a, a, a, b] ;
C = [a, b, a, b] ;
C = [b, a, a, b] ;
C = [b, b, a, b] ;
false.
```

###e) Implemente una regla que permita consultar las cadenas de longitud menor o igual que una dada que acepta el autómata. Nota: chequee el predicado predefinido between.

Para obtener dicha regla podríamos añadir a nuestro archivo fuente lo siguiente:

```prolog
aceptacadenabet(Arr,N):- between(0,N,L), aceptacadenalg(Arr,L).
```

Obteniendo la siguiente salida para el comando mostrado:

```prolog
?- aceptacadenabet(C,4).
C = [a, b] ;
C = [a, a, b] ;
C = [b, a, b] ;
C = [a, a, a, b] ;
C = [a, b, a, b] ;
C = [b, a, a, b] ;
C = [b, b, a, b] ;
false.
```

##2. Implementación de un problema de búsqueda en un espacio de estados




















