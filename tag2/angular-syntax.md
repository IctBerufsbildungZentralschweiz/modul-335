# Angular: Syntax

Betrachten wir uns nun den Syntax von AngularJS etwas genauer. AngularJS bindet Daten ans HTML mit sogenannten Expressions.


## Expressions

In AngularJS schreibt man Expressions (Ausdrücke) mit doppelt geschweiten klammern:`{{`_`expression`_`}}`. Eine AngularJS Expression kann auch innerhalb einer direktive geschrieben werden mit:`ng-bind="`_`expression`_`"`
AngularJS löst diese Expression auf und gibt das Resultat am entsprechenden Ort zurück.

### Beispiel  


```html
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<body>

<div ng-app="">
  <p>Mein erster Ausdruck: {{ 7 + 5 }}</p>
</div>

</body>
</html>
```
_Ausgabe:_
```
Mein erster Ausdruck: 12
```


## Zahlen
In Expressions kann man sehr eifach mit Zahlen und den gängigen Operatoren rechnen:
```html
<div ng-app="" ng-init="anzahl=3;kosten=5">
<p>Total in CHF: {{ anzahl * kosten }}.-</p>
</div>
```
_Ausgabe:_
```
Total in CHF: 15.-
```

## Strings
Strings in AngularJS sind wie in Javascript:
```html
<div ng-app="" ng-init="vorname='Max';nachname='Muster'">
<p>Mein Name ist {{ vorname + " " + nachname }}.</p>
</div>
```
_Ausgabe:_
```
Mein Name ist Max Muster.
```


## Objekte
Auch Objekte funktionieren wie in JS:
```html
<div ng-app="" ng-init="person={vorname:'Max',nachname:'Muster'}">
<p>Sein Nachname lautet {{ person.nachname }}!</p>
</div>
```
_Ausgabe:_
```
Sein Nachname lautet Muster!
```





## Arrays
```html
<div ng-app="" ng-init="punkte=[1,15,19,2,40]">

<p>Das Dritte Resultat ist {{ punkte[2] }}</p>

</div>
```
_Ausgabe:_
```
Das Dritte Resultat ist 19
```






