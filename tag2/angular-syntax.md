# AngularJS: Syntax

Betrachten wir uns nun den Syntax von AngularJS etwas genauer. AngularJS bindet Daten ans HTML mit sogenannten Expressions.

## Expressions

In AngularJS schreibt man Expressions \(Ausdrücke\) mit doppelt geschweiten klammern:`{{expression}}`. 
AngularJS löst diese Expression auf und gibt das Resultat am entsprechenden Ort zurück.

### Beispiel

```html
// expressions.html

<p>
  Mein erster Ausdruck: {{ 7 + 5 }}
</p>
```

_Ausgabe:_

```
Mein erster Ausdruck: 12
```

## Zahlen

In Expressions kann man sehr eifach mit Zahlen und den gängigen Operatoren rechnen:

```js
// zahlen.ts
import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

@Component({
  selector: 'page-zahlen',
  templateUrl: 'zahlen.html'
})

export class ZahlenPage {
  anzahl: any = 3;
  kosten: any = 5;

  constructor(public navCtrl: NavController) {

  }
}
```

```html
<!-- zahlen.html -->
<p>
Total in CHF: {{ anzahl * kosten }}.-
</p>
```

_Ausgabe:_

```
Total in CHF: 15.-
```

## Strings

Strings in AngularJS sind wie in Javascript:

```js
// zeichenketten.ts
import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

@Component({
  selector: 'page-zeichenketten',
  templateUrl: 'zeichenketten.html'
})

export class ZeichenkettenPage {
  vorname: string = 'Max';
  nachname: string = 'Muster';

  constructor(public navCtrl: NavController) {

  }
}
```

```html
<!-- zeichenkette.html -->
<p>
Mein Name ist {{ vorname + " " + nachname }}.
</p>
```

_Ausgabe:_

```
Mein Name ist Max Muster.
```

## Objekte

Auch Objekte funktionieren wie in JS:

```js
// objekte.ts
import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

@Component({
  selector: 'page-objekte',
  templateUrl: 'objekte.html'
})

export class ObjektePage {
  person: any = { vorname: 'Max', nachname: 'Muster'};

  constructor(public navCtrl: NavController) {

  }
}
```

```html
<!-- objekte.html -->
<p>
Sein Nachname lautet {{ person.nachname }}!
</p>
```

_Ausgabe:_

```
Sein Nachname lautet Muster!
```

## Arrays

```js
// arrays.ts
import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

@Component({
  selector: 'page-arrays',
  templateUrl: 'arrays.html'
})

export class ArraysPage {
  punkte: any = [1,15,19,2,40];

  constructor(public navCtrl: NavController) {

  }
}
```

```html
<!-- arrays.html -->
<p>
Das Dritte Resultat ist {{ punkte[2] }}
</p>
```

_Ausgabe:_

```
Das Dritte Resultat ist 19
```

---

## Übung

![](/_allgemein/ralph_uebung.png)

1. Nimm dein am Tag 1 erstelltes  Projekt "GX\_NachnameVorname\_Übung"
2. Erstelle für jedes der folgenden Themen eine eigene Seite inkl. Link im Menu: Zahlen, String, Objekte, Array.  \(Verwende doch gleich `ionic g` - den Generator\)
3. Auf der Seite _Zahlen_, füge einen neuen Paragraph hinzu und versuche die folgenden Rechnungen direkt mit Expressions aufzulösen:  
   5 + 7 =  
   25 / 5 =  
   100 - 1 =

4. Auf der Seite _String_ soll das Ziel sein das du in der Ausgabe "Hallo Welt!" in einem roten H1-Titel erhältst, wobei "Welt" aus deiner Component stammt. Füge dazu folgenden Variable in deiner Klasse hinzu und versuche es mit Expressions zu lösen:

   ```
   myString: string = 'Welt!';
   ``` 
   

5. Auf der Seite _Objekte_ wollen wir in einem Paragraph deinen Namen ausgeben. Dabei soll "Mein Name ist:" normal als Text hinzugefügt werden und dein Name mit Hilfe von Expressions aus dem Objekt "Person" von deiner Component stammen. Füge dazu in deiner Klasse folgende Zeile hinzu:  
   ```js   
   person: any = { 'name' : 'Muster', 'vorname' : 'Max' };  
   ```

6. Auf der Seite _Array_ möchten wir eine Liste \(List-Item\) von Früchte haben, welche wir aus dem Component holen:

   ```js
   fruechte: any = [
   {name:'Orange'},
   {name:'Banane'},
   {name:'Apfel'}
   ];
   ```

   Gibt dabei den Namen der Frucht aus.  
   Versuche es entweder statisch wie im Beispiel oben in dem du auf des n-te Element des Arrays zugreifst. Oder erweitert kannst du auch bereits `ngFor` verwenden, du findest sicher ein Bespiel im Netz.

7. Wir kopieren nun die Liste unserer Früchte z.B. in ```fruechte2``` und erweitern Sie um ein Bild. Erweitere das Array um eine Element `imgURL` und suche auf [Google Bilder](https://images.google.ch/?gws_rd=ssl) nach einem passenden Bild und kopiere die Bild-Adresse in dein Array.

   Wir möchten nun eine Liste mit "Avatar" erstellen. Konsultiere dazu die Ionic-Doku. Als Avatar-Image kannst du die URL in Form einer Expression `{{fruechte.imgURL}}` angeben.



