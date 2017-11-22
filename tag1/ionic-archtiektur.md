# Ionic Architektur

![](https://blog.codecentric.de/files/2014/11/architecture.png)

Wie bereits erwähnt ist Ionic ein Framework welches sich die folgenden Technologien zu Nutze macht:

* HTML
* CSS
* JS

Dabei übernimmt Ionic auch die Kommunikation als JavaScript-Bridge mit Cordova dem eigentlichen Hybriden App Framework. Cordova wiederum greift auf die nativen API's des darunterliegenden Betriebssysteme \(iOS / Android\) zu.

Die Architektur von Ionic kann sogar noch etwas detailierter aufgeteilt werden:  
![](https://blog.codecentric.de/files/2014/11/overview.png)

## Wichtige Dateien in der Projektstruktur

Um die richtigen Dateien in einer Projektstruktur zu finden hilft dir folgende Aufstellung:  
![](https://www.techiediaries.com/images/content/understanding-ionic2-first-steps-with-ionic2/ionic2-anatomy.png)


## Ionic Generator
Ionic hat seit CLI-Version 3.x den Generator eingeführt. Ein super Hilfsmittel um die wichtigsten Dinge per CLI generieren zu lassen. In der Struktur oben kann du sehen, dass es z.B. im Verzeichnis _/app/pages/home_ immer 3 Dateien hat:
* HTML
* Typescript
* Styling (SCSS)

Möchten wir nun eine ein neue Seite z.B. Einstellungen (settings) zu unseren Projekt hinzufügen, könnten wir den Ordner _home_ duplizieren und ein mühsames Refactoring starten, oder die einfache Variante wählen und mit
```bash
ionic g pages Settings 
``
uns das ganze generieren lassen. Praktisch nicht?

Verschaff dir doch bitte in folgender Doku einen Überblick:
https://ionicframework.com/docs/cli/generate/ 


## Ionic DevApp
![](http://blog.ionic.io/wp-content/uploads/2017/10/devapp-image.jpg)
DevApp ist eine 100% gratis App für iOS und Android, welche es dir ermöglicht deine Apps direkt auf deinem Mobiltelefon zu testen. Sie bietet eine perfekte Live-Ansicht deiner Änderungen und hat auch sehr vielen nativen Plugins bereits vorinstalliert.

## Wie debugge ich meine App?
HTML, CSS & JS sind cool oder? Ja, das denkt wohl jeder Entwickler bis er vor dem ersten wirklichen Problem steht.
Hast du ein Fehler in deinem Typescript-Code, wird dich Ionic ziemlich nett darauf hinweisen. Manchmal passieren aber auch komische Dinge, dann heisst es analysieren. Hier einige Tipps von Ralph.

### HTML, CSS: Der Entwickler-Bereich deines Browsers
Alle grossen Browser verfügen heute über super Analyse-Tools und Console. Du findest Sie hier:
* Google Chrome: Entwickler Tools über Menu oder "Untersuchen" mit Rechtsklick auf der Seite
* Firefox: Inspector über Menu -> Web-Entwickler oder "Element untersuchen" mit Rechtsklick auf der Seite
* Safari: Via Einstellungen -> Erweitert -> Entwickler-Modus

![](_allgemein/chrome_entwicklertools.png)
Du siehst deinen kompletten HTML DOM, also alles was ausgegeben wurde. Z.B. Wichtig um zu sehen ob deine Schleife funktioniert hat. Und auch das effektive Styling eines Elements, ob das richtige CSS zieht und woher die effektiven Werte kommen. 


### Javascript: Der einfache Weg


### Javascript: Der einfache Weg













---

## Übung
![](/_allgemein/ralph_uebung.png)

1. Lade dir die DevApp auf dein Android oder iOS Gerät runter
2. Logge dich mit deinem Ionic Account ein
3. Folge den Anweisungen auf deinem Handy und probiere DevApp aus

