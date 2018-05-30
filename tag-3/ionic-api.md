# Ionic: API

Ionic ist beides, ein CSS-Framework und eine Javascript UI Bibliothek. Um die App etwas dynamischer zu machen gibt es einige sehr zentrale Funktionen, welche in den folgenden Dokumentationen beschrieben werden:  
Ionic 2: [http://ionicframework.com/docs/api/ ](http://ionicframework.com/docs/api/)

Hier einige Beispiele:

### Action Sheet

_The Action Sheet is a slide-up panel that lets the user choose from a set of options. Dangerous options are highlighted in red and made obvious._

![](http://ionicframework.com.s3.amazonaws.com/docs/controllers/actionSheet.gif)

### Spinner

![](../.gitbook/assets/ion-spinner.png)

### Alerts

![](../.gitbook/assets/ion-popup.png)

## Übung

![](../.gitbook/assets/ralph_uebung.png)

1. Nimm dein am Tag 1 erstelltes  Projekt "GX\_NachnameVorname\_Übung" und erstelle darin eine neue Seite namens "Alerts"
2. Lies dir die Dokumentation zu Alerts durch.
3. Wir wollen nun ein Alert anzeigen:
   1. Durch einen Klick auf den einen Button "Nickname erfassen" wird das Popup angezeigt
   2. Ich kann in diesem Popup in ein Textfeld mein Spitznamen eintragen
   3. Wird das Popup geschlossen, wird auf der Ansicht ein Text "Ich liebe es XXX genannt zu werden!" angezeigt, wobei XXX der zuvor im Popup eingegebene Nickname ist. 
4. Ein einfacher Klick reicht nicht immer aus. Manchmal muss man etwas fester drücken. Füge nun ein Button \(150x150 Pixel, schwarz\) hinzu und gib ihm die `press` Geste \(siehe API Docs\). Ein Paragraph darunter soll dabei wie ein Log dienen und pro Geste den Counter hochzählen und folgenden Text ausgeben "Er wurde X mal gedrückt!".

#### Zusatzaufgabe:

Ergänze unsere Früchte-Liste aus Tag 2 mit neuen Früchten, dabei soll ein Popup erscheinen, in dem ich eine neue Frucht erfassen kann. Die Liste soll auch sortierbar sein, resp. ich möchte einzelne Einträge wieder löschen können. \(Hinweis: Auch hier gibt es in der Doku ein Beispiel\).

