# Ionic Architektur

![](https://blog.codecentric.de/files/2014/11/architecture.png)

Wie bereits erwähnt ist Ionic ein Framework welches sich die folgenden Technologien zu Nutze macht:

* HTML
* CSS
* JS

Dabei übernimmt Ionic auch die Kommunikation als JavaScript-Bridge mit Cordova dem eigentlichen Hybriden App Framework. Cordova wiederum greift auf die nativen API's des darunterliegenden Betriebssystems \(iOS / Android\) zu.

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

