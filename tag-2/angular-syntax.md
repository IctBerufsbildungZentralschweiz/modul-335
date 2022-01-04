# Angular: Syntax

Betrachten wir uns nun den Syntax von Angular etwas genauer. Angular bindet Daten ans HTML mit sogenannten Expressions.

## Expressions

In Angular schreibt man Expressions (Ausdrücke) mit doppelt geschweiften Klammern:`{{expression}}`. Angular löst diese Expression auf und gibt das Resultat am entsprechenden Ort zurück.

### Beispiel

```markup
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

In Expressions kann man sehr einfach mit Zahlen und den gängigen Operatoren rechnen:

```javascript
// zahlen.page.ts
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-zahlen',
  templateUrl: './zahlen.page.html',
  styleUrls: ['./zahlen.page.scss'],
})
export class ZahlenPage implements OnInit {
  anzahl: number = 3;
  kosten: number = 5;
  anyVar: any = 5; // Variable mit Datentyp any

  constructor() {
  }
  ngOnInit() {
  }
}
```

```markup
<!-- zahlen.page.html -->
<p>
Total in CHF: {{ anzahl * kosten }}.-
</p>
```

_Ausgabe:_

```
Total in CHF: 15.-
```

## Strings

Strings in Angular sind wie in Javascript:

```javascript
// zeichenketten.page.ts
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-zeichenketten',
  templateUrl: './zeichenketten.page.html',
  styleUrls: ['./zeichenketten.page.scss'],
})

export class ZeichenkettenPage implements OnInit {
  vorname: string = 'Max';
  nachname: string = 'Muster';

  constructor() {
  }
  ngOnInit() {
  }
}
```

```markup
<!-- zeichenkette.page.html -->
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

```javascript
// objekte.page.ts
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-objekte',
  templateUrl: './objekte.page.html',
  styleUrls: ['./objekte.page.scss'],
})

export class ObjektePage implements OnInit {
  person: Person = { vorname: 'Max', nachname: 'Muster'};

  constructor() {
  }
  ngOnInit() {
  }
}

interface Person {
  vorname: string;
  nachname: string;
}
```

```markup
<!-- objekte.page.html -->
<p>
Sein Nachname lautet {{ person.nachname }}!
</p>
```

_Ausgabe:_

```
Sein Nachname lautet Muster!
```

## Arrays

```javascript
// arrays.page.ts
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-arrays',
  templateUrl: './arrays.page.html',
  styleUrls: ['./arrays.page.scss'],
})

export class ObjektePage implements OnInit {
  punkte: number[] = [1,15,19,2,40];

  constructor() {
  }
  ngOnInit() {
  }
}
```

```markup
<!-- arrays.page.html -->
<p>
Das Dritte Resultat ist {{ punkte[2] }}
</p>
```

_Ausgabe:_

```
Das Dritte Resultat ist 19
```

## Übung

![](../.gitbook/assets/ralph\_uebung.png)

1. Nimm dein am Tag 1 erstelltes  Projekt "GX\_NachnameVorname\_Übung"
2. Erstelle für jedes der folgenden Themen eine eigene Seite inkl. Link im Menu: Zahlen, String, Objekte, Array.  (Verwende doch gleich `ionic g` - den Generator)&#x20;
3. Auf der Seite _Zahlen_, füge einen neuen Paragraph hinzu und versuche die folgenden Rechnungen direkt mit Expressions aufzulösen:\
   5 + 7 =\
   25 / 5 =\
   100 - 1 =
4.  Auf der Seite _String_ soll das Ziel sein das du in der Ausgabe "Hallo Welt!" in einem roten H1-Titel erhältst, wobei "Welt" aus deiner Component stammt. Füge dazu folgenden Variable in deiner Klasse hinzu und versuche es mit Expressions zu lösen:

    ```
    myString: string = 'Welt!';
    ```
5.  Auf der Seite _Objekte_ wollen wir in einem Paragraph deinen Namen ausgeben. Dabei soll "Mein Name ist:" normal als Text hinzugefügt werden und dein Name mit Hilfe von Expressions aus dem Objekt "Person" von deiner Component stammen. Füge dazu in deiner Klasse folgende Zeile hinzu:

    ```javascript
    person: Person = { name : 'Muster', vorname : 'Max' };
    ```
6.  Auf der Seite _Array_ möchten wir eine Liste (List-Item) von Früchte haben, welche wir aus dem Component holen:

    ```javascript
    fruechte: Frucht = [
    {name:'Orange'},
    {name:'Banane'},
    {name:'Apfel'}
    ];
    ```

    Gibt dabei den Namen der Frucht aus.\
    Versuche es entweder statisch wie im Beispiel oben in dem du auf des n-te Element des Arrays zugreifst. Oder erweitert kannst du auch bereits `ngFor` verwenden, du findest sicher ein Bespiel im Netz.
7.  Wir kopieren nun die Liste unserer Früchte z.B. in `fruechte2` und erweitern Sie um ein Bild. Erweitere das Array um eine Element `imgURL` und suche auf [Google Bilder](https://images.google.ch/?gws\_rd=ssl) nach einem passenden Bild und kopiere die Bild-Adresse in dein Array.

    Wir möchten nun eine Liste mit "Avatar" erstellen. Konsultiere dazu die Ionic-Doku. Als Avatar-Image kannst du die URL in Form einer Expression `{{fruechte.imgURL}}` angeben.
