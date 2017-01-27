# AngularJS: Directives

_Übersetzer und Ergänzter Text aus: _[http://docs.usecreator.com/docs/directives](http://docs.usecreator.com/docs/directives)

Direktiven \(Directives\) sind ein wichtiges Konzept in einer AngularJS Applikation. Siehe dazu auch folgendes Kapitel in der [Doku](https://docs.angularjs.org/guide/directive). Mit Direktiven werden die Komponenten in einer App dynamisch, an Daten gebunden, es lässt Elemente wiederholen und vieles mehr.

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

##### Sortierung

Oftmals möchte man die Elemente auch sortiert ausgeben. In diesem Fall kann man direkt in `ng-repeat` ein Filter setzen. Möchte man hier eine umgekehrte Ausgabe wäre dies mit `item in items | orderBy: '-id'` zu erreichen. Mehr zu Filter aber später.

### ng-change

Es kann vorkommen, dass man eine Funktion aufrufen möchte wenn das `ng-model` für dein Textfeld ändert. Obwohl man es auch mit `$scope.watch` machen könnte, bevorzugen wir mit Creator eine `ng-change` Direktive.

Gehen wir nochmals zum Beispiel mit dem Namen-Textfeld, welches wir in Data Binding angeschaut haben. Wir können dort ein Javascript-Alert hinzufügen sofern der Name geändert wird. Klar ist ein Alert eine doofe Idee - erfüllt aber in diesem Beispiel den Zweck.

```js
$scope.data = {
  'name': 'Ralph'
}

$scope.nameChanged = function(){
    alert("Mein Name wurde geändert auf: "+$scope.data.name);
}
```

Setze dann `ng-change`:`nameChanged()` auf deiner Komponente.  **Info: Vergiss die Klammer \(\) für den Funktionsaufruf nicht!**

[![](https://files.readme.io/f2a0bc9-Ionic_Creator_2016-10-31_20-02-36.png)](https://files.readme.io/f2a0bc9-Ionic_Creator_2016-10-31_20-02-36.png)

Dann erhalten wir den folgenden Output: 🙃

[![](https://files.readme.io/d180402-Screenshot_2016-10-31_20.01.21.png)](https://files.readme.io/d180402-Screenshot_2016-10-31_20.01.21.png)

### ng-click

`ng-click` wird natürlich oft im Zusammenhang mit Links resp. Buttons verwendet.

Lass uns eine einfache `$scope` Funktion hinzufügen, welche eine Javascript-Alert aufruft:

```js
$scope.buttonClick = function(){
    alert("Yeah, ich wurde angeklickt!"); 
}
```

Nun setzen wir `ng-click`:`buttonClick()` wiederum auf der Button-Komponente. Auch hier dürfen die Klammer `()` für den Funktionsaufruf nicht fehlen.

[![](https://files.readme.io/fd50abb-Ionic_Creator_2016-10-31_21-22-48.png)](https://files.readme.io/fd50abb-Ionic_Creator_2016-10-31_21-22-48.png)

Das Result ist hier zu sehen:

[![](https://files.readme.io/dc993b7-Screenshot_2016-10-31_21.22.15.png)](https://files.readme.io/dc993b7-Screenshot_2016-10-31_21.22.15.png)

## ng-show and ng-hide

Machmal möchte man eine Komponente anzeigen resp. verschwinden lassen je nachdem ob der Wert in der `$scope` Variable  true oder false ist \(oder auch wenn ein JavaScript-Ausdruck true/false ergibt\). Um dies mit Ionic zu machen, brauchst du entweder `ng-show` oder `ng-hide` Direktiven.

Diese Direktiven funktioniert in sich genau gleich, Sie invertieren einfach den Ausgang. Als Beispiel der Wert  `true` in `ng-show` wird die Komponente anzeigen, aber ein Wert `true` mit `ng-hide` wird Sie verstecken.

Lass uns ein einfaches Beispiel mit folgenden Controller-Code machen:

```js
$scope.showPicture = true;
```

Wir bauen nun ein Toggle  mit  `ng-model` so dass wir die Variable geändert wird wenn wir unsere App anschauen:

[![](https://files.readme.io/5de5a75-Ionic_Creator_2016-10-31_21-28-49.png)](https://files.readme.io/5de5a75-Ionic_Creator_2016-10-31_21-28-49.png)

Danach fügen wir bei unserem Bild die Komponente auf `ng-show` mit Wert `showPicture` hinzu.

[![](https://files.readme.io/e00e9d1-Ionic_Creator_2016-10-31_21-30-15.png)](https://files.readme.io/e00e9d1-Ionic_Creator_2016-10-31_21-30-15.png)

Nachdem wir den toggle gebraucht haben sehen wir das Bild erscheinen oder verschwinden. [![](https://files.readme.io/de07e98-Screenshot_2016-10-31_21.30.54.png)](https://files.readme.io/de07e98-Screenshot_2016-10-31_21.30.54.png)

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



Mehr in Englisch auf: [http://docs.usecreator.com/docs/route-parameters](https://www.gitbook.com/book/motzne/ict-bz-modul-335/edit#)  

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



