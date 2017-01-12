# AngularJS: Directives

_Übersetzer Text aus: _[http://docs.usecreator.com/docs/directives](http://docs.usecreator.com/docs/directives)

Direktiven \(Directives\) sind ein wichtiges Konzept in einer AngularJS Applikation. Siehe dazu auch folgendes Kapitel in der [Doku](https://docs.angularjs.org/guide/directive). Mit Direktiven werden die Komponenten in einer App dynmaisch, an Daten gebunden, es lässt Elemente wiederholen und vieles mehr.

Kurz gesagt: Mit Direktiven wird deine App zu einer voll funktionsfähigen App.

Eine Direktive erlaubt es uns nun, ein Stück HTML Code um zusätzliche Informationen / Funktionalität zu erweitern. Wenn man z.B. ein Listen-Eintrag hat:

```html
<ion-item>List Item</ion-item>
```

Wir dieser um einige mächtigen wenn wir ihn so schreiben:

```html
<ion-item ng-repeat="item in items">{{item.name}}</ion-item>.
```

Ein einfaches **ng-repeat** hat es uns nun erlaubt über die komplette Liste von Elementen zu iterieren.

## Direktiven in Creator

Eine Direktive zu einer Komponente in Creator hinzuzufügen ist sehr einfach. Klicke auf der rechten Seite im Einstellungs-Fenster auf einen Komponente, dann füge mit dem "+ Add" ein neuen Eintrag hinzu. Gibt den Namen der Direktive inkl. zugehörigen Wert ein.  
![](https://files.readme.io/fdf45a0-Ionic_Creator_2016-10-28_14-54-16.png)  
Jede Komponente in Creator hat ihre eigene Angular Direktiven welche du bearbeiten kannst.

Um eine Direktive zu entfernen, klicke au das rote "-" Minus.

## Die wichtigsten Direktiven

### ng-repeat

Ist wohl eine der meist verwendeten Direktiven im Zusammenhang mit Listen und Objekten. Es lässt sich sehr einfach über alle Elemente in einer Liste iterieren:

Controller JavaScript:

```JS
$scope.items = [{id: 1}, {id: 2}, {id: 3}, {id: 4}, {id: 5}];
```

Nachdem wir in `$scope` einige Daten gesetzt haben, können wir mit `ng-repeat` durch die Liste gehen. Dies erlaubt uns nachher `{{item.id}}` in einem List-Item zu verwenden und den Inhalt so dynamisch auszugeben:

![](https://files.readme.io/11de288-Ionic_Creator_2016-10-31_21-15-47.png)

This results in the List Item being duplicated 5 times, with the ID being placed in the text of each List Item:  
Das Resultat ist, dass das Listen-Element 5 mal dupliziert wird und die ID zusammen mit dem Tag "Item" ausgegeben wird.

#### Sortierung

Oftmals möchte man die Elemente auch sortiert ausgeben. In diesem Fall kann man direkt in `ng-repeat` ein Filter setzen. Möchte man hier eine umgekehrte Ausgabe wäre dies mit `item in items | orderBy: '-id'` zu erreichen. Mehr zu Filter aber später.




