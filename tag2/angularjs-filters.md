# AngularJS: Filters / Pipes

Filter resp. auch Pipes genannt können in AngularJS hinzugefügt werden um Daten zu formatieren oder sortieren. Anbei eine Auflistung der wichtigsten Filtermöglichkeiten welche Euch Angular bereits mitbringt:

* `currency` Formatiert eine Nummer zu einem Währungs-Format
* `date` Formatiert ein Datum zu ein speziellen Format
* `json` Formatiert ein Objekt zu einem JSON string.
* `lowercase` Format a string to lower case.
* `uppercase` Formatiert ein String zu GROSSBUCHSTABEN.
* `number` Formatiert eine Nummer zu einem String



Beispiel:
```js
{{ ichBinEinCamelCaseText | uppercase }} 
```
Output:
`ICHBINEINCAMELCASETEXT`

---
## Kann ich auch eigene Pipes erstellen?
Klar, genau das ist die Idee hinter Pipes. Z.B. wenn du ein Array speziell sortieren oder ein JSON-Objekt nach filtern möchtest.

Wie sicher bereits erahnen kannst, kann man mit dem Ionic CLI Generator nicht nur Seiten anlegen, sondern eben auch eigene Pipes.

`ionic g pipe <PIPENAME>`




# Übung

![](/_allgemein/ralph_uebung.png)

1. Nimm dein am Tag 1 erstelltes  Projekt "GX\_NachnameVorname\_Übung" und erstelle darin eine neue Seite Namens "Filters" 
2. Deine Aufgabe soll es nun sein die folgenden Filter/Pipes in einem Beispiel auf deiner Seite zu integrieren. Als Hilfestellung soll dir die [AngularJS Dokumentation](https://angular.io/guide/pipes) dienen.
   1. `lowercase`
   2. `uppercase`
   3. `date` \(Formatiere doch ein Datum um\)

Zusatzaufgabe:
1. Erstell einen eigenen Pipe mit Ionic Generator. Sortiere dabei das Früchte-Array aus der Übungen "Array" umgekehrt nach Alphabet (also: Z-A)



   



