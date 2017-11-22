![](/assets/Bildschirmfoto 2017-11-22 um 20.59.25.png)# AngularJS: Directives

Direktiven \(Directives\) sind ein wichtiges Konzept in einer AngularJS Applikation. Siehe dazu auch folgendes Kapitel in der [Doku](https://angular.io/guide/structural-directives). Mit Direktiven werden die Komponenten in einer App dynamisch, an Daten gebunden, es lässt Elemente wiederholen und vieles mehr.

Kurz gesagt: Mit Direktiven wird deine App zu einer voll funktionsfähigen App.

Eine Direktive erlaubt es uns nun, ein Stück HTML Code um zusätzliche Informationen / Funktionalität zu erweitern. Wenn man z.B. ein Listen-Eintrag hat:

```html
<ion-item>List Item</ion-item>
```

Wir dieser um einige mächtigen wenn wir ihn so schreiben:

```html
<ion-item *ngFor="let item in items">{{item.name}}</ion-item>.
```

Ein einfaches `*ngFor` hat es uns nun erlaubt über die komplette Liste von Elementen zu iterieren.


## Die wichtigsten Direktiven

### ngFor

Ist wohl eine der meist verwendeten Direktiven im Zusammenhang mit Listen und Objekten. Es lässt sich sehr einfach über alle Elemente in einer Liste iterieren:


```js
// ngForExample.ts
...
items: any = [{id: 1}, {id: 2}, {id: 3}, {id: 4}, {id: 5}];
...
```
```html
<!-- ngForExample.ts -->
<ion-content padding>
    <ion-list>
        <ion-item *ngFor="let item of items"r>Item {{item.id}}</ion-item>
    </ion-list>
</ion-content>
```


Nachdem wir im Component einige Daten gesetzt haben, können wir mit `*ngFor` durch die Liste gehen. Dies erlaubt uns nachher `{{item.id}}` in einem List-Item zu verwenden und den Inhalt so dynamisch auszugeben:

![](/_allgemein/ngFor.png)
 
Das Resultat ist, dass das Listen-Element 5 mal dupliziert wird und die ID zusammen mit dem Tag "Item" ausgegeben wird.

##### Sortierung

Oftmals möchte man die Elemente auch sortiert ausgeben. In diesem Fall kann man direkt in `ngFor` ein Filter setzen. Möchte man z.B. hier eine umgekehrte Ausgabe wäre dies mit Pipes zu lösen, dazu später mehr.

### (keyup) - Event

Es kann vorkommen, dass man eine Funktion aufrufen möchte wenn das `ngModel` für dein Textfeld ändert. Obwohl man es auch mit `[(ngModel)]` einem Two-Way-Binding machen könnte, bevorzugen wir hier die einfacher Variante.

Gehen wir nochmals zum Beispiel mit dem Namen-Textfeld, welches wir in Data Binding angeschaut haben. Wir können dort ein Javascript-Alert hinzufügen sofern der Name geändert wird. Klar ist ein Alert eine doofe Idee - erfüllt aber in diesem Beispiel den Zweck.

```js
// keyupExample.ts
...
  data: any = {'name': 'Ralph'}

  nameChanged(){
    alert("Mein Name wurde geändert auf: " + this.data.name);
  }
...
```

```html
<!-- keyupExample.html -->
<ion-item>
  <ion-label fixed>Name</ion-label>
  <ion-input type="text" [value]="data.name" (keyup)="nameChanged()"></ion-input>
</ion-item>

```
Achtung: hier wird `(keyup)` als Event verwendet. Das heisst nach jedem Tastaturanschlag wir ein `alert()` ausgelöst, natürlich unschön. Eine saubere Lösung würde man mit Observables implementieren, sprengt aber den aktuellen Rahmen hier. 


### (click) - Event

`(click)` wird natürlich oft im Zusammenhang mit Links resp. Buttons verwendet.

Lass uns eine einfache Funktion hinzufügen, welche eine Javascript-Alert aufruft:

```js
// clickExample.ts
...
buttonClicked(){
    alert("Yeah, ich wurde angeklickt!"); 
}
...
```
```html
<!-- clickExample.html -->
<button ion-button color="secondary" round (click)="buttonClicked()">Klick mich!</button>

```
Nun setzen wir `(click)="buttonClick()"` wiederum auf eine Button-Komponente. Wichtig: Hier darf die Klammer `()` für den Funktionsaufruf nicht fehlen.

## [hidden] / ngIf

Machmal möchte man eine Komponente anzeigen resp. verschwinden lassen je nachdem ob der Wert in einer Variable  true oder false ist \(oder auch wenn ein JavaScript-Ausdruck true/false ergibt\). Um dies mit Angular zu machen, brauchst du entweder `*ngIf` oder `[hidden]` Direktiven.

Diese Direktiven funktionieren in sich ähnlich. Als Beispiel ist der Wert  `true` in `*ngIf` wird die Komponente anzeigen, aber ein Wert `true` mit `[hidden]` wird Sie verstecken.

Lass uns ein einfaches Beispiel mit folgenden Code machen:

```js
...
showPicture: boolean = true;
...
```
Wir bauen nun ein Toggle  mit  `ngModel` so dass wir die Variable geändert wird wenn wir unsere App anschauen. Danach fügen wir bei unserem Bild die Komponente auf `ngIf` mit Wert `showPicture` hinzu.

```html
  <ion-item>
    <ion-label>Bild anzeigen</ion-label>
    <ion-toggle [(ngModel)]="showPicture"></ion-toggle>
  </ion-item>

  <img *ngIf="showPicture" src="https://jaxenter.de/wp-content/uploads/2015/05/Ionic-Logo.jpg">
```
Nachdem wir den toggle gebraucht haben sehen wir das Bild erscheinen oder verschwinden. 
![](https://image.ibb.co/dQacXm/ngIf.png)

Danach fügen wir bei unserem Bild die Komponente auf `ngIf` mit Wert `showPicture` hinzu.

## Route Parameters

Mit Route Parameters kannst du Informationen zu Seiten an welche du navigierst weitergeben. Wenn du z.B. eine Liste von Unterhaltungen hast, kannst du die \`\`ìd\`\`\` einer spezifischen Seite an eine Detailseite übergeben. Das erlaubt dir deine Liste dynamisch vom Code aufzubauen und so die gesamte Funktionalität herzustellen. 💪

#### Füge Parameter deiner Seite hinzu

 Jede Seite kann mehrere Route Parameter haben, auch default-Werte können dabei gesetzt werden. Benenne deine Variable "Code-Freundlich" \(keine Abstände, usw.\).  
Man findet die Route Parameters im Property-Panel im Ionic Creator. 

[![](https://files.readme.io/6677d0a-Ionic_Creator_2016-10-31_13-13-28.png)](https://files.readme.io/6677d0a-Ionic_Creator_2016-10-31_13-13-28.png)

Hier ist unsere Such-Resultat-Seite, wo wir die Variablen `name`,`favorite_color`, und `favorite_pizza` definiert haben. Dabei haben wir keine Standartwerte definiert, da wir alle Informationen anzeigen möchten. 

#### Informationen an eine Seite weitergeben

Es gibt zwei Varianten Informationen an eine Seite weiterzugeben, welche Route Parameters hat. 

__Variante 1__ 

Du verknüpfst die Seiten über einen "Link", wo du automatisch nach den Route Parameters gefragt wirst.
Dabei kannst du die Werte auch leer lassen, du kannst einen String aber auch einen dynamischen Tag mit doppelt-geschweiften Klammer ```{{``` mitgeben. 


[![](https://files.readme.io/c054de1-Ionic_Creator_2016-10-31_13-30-57.png)](https://files.readme.io/c054de1-Ionic_Creator_2016-10-31_13-30-57.png)


__Variante 2__ 

Du verwendest  ```$state.go``` in deinem Code und übergibst so deine Route Parameters als object. Sei dabei sicher dass du ```$state``` in  deinem Controller auch eingebunden hast. 

Wenn du eine Seite selektiert hast, siehst du unter dem Titel "State / sref". Dies brauchst du in deinem Code in ```$state.go```. Hier ein Beispiel dazu:

[![](https://files.readme.io/d6a5639-Ionic_Creator_2016-10-31_13-34-55.png)](https://files.readme.io/d6a5639-Ionic_Creator_2016-10-31_13-34-55.png)


##### Zugriff auf übermittelte Daten
Alle Informationen sind nun mit ```$stateParams``` in deinem Ziel-Controller erreichbar. ```$stateParams``` wird automatisch in jedem Controller injiziert, aber falls du Probleme hast prüfe dies nochmals.

Um nun unsere Beispiele von Oben (Name, Pizza, Farbe) zu verwenden:
```js
$stateParams.name
$stateParams.favorite_pizza
$stateParams.favorite_color
```

Falls die Parameter nicht gesetzt sind, sind Sie entweder leer oder undefiniert. 


Mehr in Englisch auf: [http://docs.usecreator.com/docs/route-parameters](http://docs.usecreator.com/docs/route-parameters)  

---

## Übung

![](/_allgemein/ralph_uebung.png)

1. Nimm dein am Tag 1 in Creator erstelltes  Projekt "GX\_NachnameVorname\_Übung" und erstelle darin eine neue Seite Namens "Rechner" 
2. Dein Auftrag wird es nun sein mit dem oben beschrieben Möglichkeiten eine Rechner-App für Ralph zu erstellen.
3. Mach vorher kurz eine Skizze \(Lo-Fi\) deiner Idee
4. Der Rechner soll folgenden Funktionsumfang haben:
   1. Nur ein Input-Feld \(Für Eingabe und auch Ausgabe des Resultats\)
   2. Dein Rechner soll die folgenden Grundfunktionen anbieten \(Buttons verwenden\)
      1. Addition \(+\) 
      2. Subtraktion \(-\)
      3. Multiplikation \(x\)
      4. Division \(÷\)
   3. Ein Button zum zurücksetzen
5. Teste dein App mittels Ionic Creator -App auf deinem Smartphone. Zufrieden?

Wir schauen uns einigen Lösungen gemeinsamen an.

##### Zusatzaufgabe:

1. Nimm dein Prototyp aus der Ionic: UI Übungen von heute Morgen. Vervollständige alle Listen mit ng-repeat und setze dazu ein paar fiktive Daten in deinem Controller.  



