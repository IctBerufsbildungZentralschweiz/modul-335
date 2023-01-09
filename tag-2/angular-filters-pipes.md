# Angular: Filters / Pipes

## Angular: Filters / Pipes

Filter resp. auch Pipes genannt können in Angular hinzugefügt werden um Daten zu formatieren oder sortieren. Anbei eine Auflistung der wichtigsten Filtermöglichkeiten welche Euch Angular bereits mitbringt:

* `currency` Formatiert eine Nummer zu einem Währungs-Format
* `date` Formatiert ein Datum zu einem speziellen Format
* `json` Formatiert ein Objekt zu einem JSON string.
* `lowercase` Formatiert ein String zu kleinbuchstaben
* `uppercase` Formatiert ein String zu GROSSBUCHSTABEN.
* `number` Formatiert einen String in eine Zahl
* `async`  Abonniert einen Observable oder ein Promise und gibt den letzten Wert zurück, den es ausgegeben hat. Sie dazu mehr unter:  [https://angular.io/api/common/AsyncPipe](https://angular.io/api/common/AsyncPipe)&#x20;

Beispiel:

```javascript
{{ ichBinEinCamelCaseText | uppercase }}
```

Output: `ICHBINEINCAMELCASETEXT`

### Kann ich auch eigene Pipes erstellen?

Klar, genau das ist die Idee hinter Pipes. Z.B. wenn du ein Array speziell sortieren oder ein JSON-Objekt nach etwas filtern möchtest.

Wie du sicher bereits erahnen kannst, kann man mit dem Ionic CLI Generator nicht nur Seiten anlegen, sondern eben auch eigene Pipes.

`ionic g pipe <PIPENAME>`

{% embed url="https://www.youtube.com/watch?time_continue=7&v=Z1g1iroNHK0" %}

## Übung

![](../.gitbook/assets/ralph\_uebung.png)

1. Nimm dein am Tag 1 erstelltes  Projekt "GX\_NachnameVorname\_Übung" und erstelle darin eine neue Seite Namens "Filters"&#x20;
2. Deine Aufgabe soll es nun sein die folgenden Filter/Pipes in einem Beispiel auf deiner Seite zu integrieren. Als Hilfestellung soll dir die [Angular Dokumentation](https://angular.io/guide/pipes) dienen.
   1. `lowercase`
   2. `uppercase`
   3. `date` (Formatiere doch ein Datum um)
