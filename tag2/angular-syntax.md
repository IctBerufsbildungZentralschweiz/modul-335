# AngularJS: Syntax

Betrachten wir uns nun den Syntax von AngularJS etwas genauer. AngularJS bindet Daten ans HTML mit sogenannten Expressions.

## Expressions

In AngularJS schreibt man Expressions \(Ausdrücke\) mit doppelt geschweiten klammern:`{{expression}}`. Eine AngularJS Expression kann auch innerhalb einer direktive geschrieben werden mit:`ng-bind="expression"`  
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

---

## Übung

![](/_allgemein/ralph_uebung.png)

1. Nimm dein am Tag 1 in Creator erstelltes  Projekt "GX\_NachnameVorname\_Übung"
2. Erstelle für jedes der folgenden Themen eine eigene Seite inkl. Link im Menu: Zahlen, String, Objekte, Array
3. Auf der Seite _Zahlen_, füge einen neuen Paragraph hinzu und versuche die folgenden Rechnungen direkt mit Expressions aufzulösen:  
   5 + 7 =  
   25 / 5 =  
   100 - 1 =

4. Auf der Seite _String_ soll das Ziel sein das du in der Ausgabe "Hallo Welt!" in einem roten H1-Titel erhältst, wobei "Welt" aus deinem Controller stammt. Füge dazu folgenden Wert im Controller hinzu und versuche es mit Expressions zu lösen:  
   `$scope.myString = 'Welt!';`

5. Auf der Seite _Objekte_ wollen wir in einem Paragraph deinen Namen ausgeben. Dabei soll "Mein Name ist:" normal als Text hinzugefügt werden und dein Name mit Hilfe von Expressions aus dem Objekt "Person" von dem Controller stammen. Füge dazu im Controller folgende Zeile hinzu:  
   `$scope.person = {    
    'name' : 'Muster',    
    'vorname' : 'Max'    
   }`

6. Auf der Seite _Array_ möchten wir eine Liste \(List-Item\) von Früchte haben, welche wir aus dem Controller holen:

   ```js
   $scope.fruechte = [
   {name:'Orange'},
   {name:'Banane'},
   {name:'Apfel'}
   ];
   ```

   Gibt dabei den Namen der Frucht aus.
   Versuche es entweder statisch wie im Beispiel oben in dem du auf des n-te Element des Arrays zugreifst. Oder erweitert kannst du auch bereits ```ng-repeat``` verwenden.

7. Wir wollen nun noch die Liste unserer Früchte um ein Bild erweitern. Erweitere das Array um eine Element ```imgURL``` und suche auf [Google Bilder](https://images.google.ch/?gws_rd=ssl) nach einem passenden Bild und kopiere die Bild-Adresse in dein Array. 
   
   Wähle das Listen-Element an und ändere rechts in den Einstellungen den Style-Type auf "Avatar". Jetzt kannst du dort als Avatar-Image die URL in Form einer Expression ``` {{fruechte.imgURL}} ``` angeben.



