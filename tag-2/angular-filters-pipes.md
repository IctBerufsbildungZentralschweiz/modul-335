# Angular: Filters / Pipes

## Angular: Filters / Pipes

Filter resp. auch Pipes genannt können in Angular hinzugefügt werden um Daten zu formatieren oder sortieren. Anbei eine Auflistung der wichtigsten Filtermöglichkeiten welche Euch Angular bereits mitbringt:

* `currency` Formatiert eine Nummer zu einem Währungs-Format
* `date` Formatiert ein Datum zu ein speziellen Format
* `json` Formatiert ein Objekt zu einem JSON string.
* `lowercase` Format a string to lower case.
* `uppercase` Formatiert ein String zu GROSSBUCHSTABEN.
* `number` Formatiert eine Nummer zu einem String

Beispiel:

```javascript
{{ ichBinEinCamelCaseText | uppercase }}
```

Output: `ICHBINEINCAMELCASETEXT`

### Kann ich auch eigene Pipes erstellen?

Klar, genau das ist die Idee hinter Pipes. Z.B. wenn du ein Array speziell sortieren oder ein JSON-Objekt nach etwas filtern möchtest.

Wie du sicher bereits erahnen kannst, kann man mit dem Ionic CLI Generator nicht nur Seiten anlegen, sondern eben auch eigene Pipes.

`ionic g pipe <PIPENAME>`

{% embed data="{\"url\":\"https://www.youtube.com/watch?time\_continue=7&v=Z1g1iroNHK0\",\"type\":\"video\",\"title\":\"\",\"icon\":{\"type\":\"icon\",\"url\":\"https://www.youtube.com/yts/img/favicon\_144-vfliLAfaB.png\",\"width\":144,\"height\":144,\"aspectRatio\":1},\"thumbnail\":{\"type\":\"thumbnail\",\"url\":\"https://i.ytimg.com/vi/Z1g1iroNHK0/maxresdefault.jpg\",\"width\":1280,\"height\":720,\"aspectRatio\":0.5625},\"embed\":{\"type\":\"player\",\"url\":\"https://www.youtube.com/embed/Z1g1iroNHK0?rel=0&showinfo=0\",\"html\":\"<div style=\\\"left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.2493%;\\\"><iframe src=\\\"https://www.youtube.com/embed/Z1g1iroNHK0?rel=0&amp;showinfo=0\\\" style=\\\"border: 0; top: 0; left: 0; width: 100%; height: 100%; position: absolute;\\\" allowfullscreen scrolling=\\\"no\\\"></iframe></div>\",\"aspectRatio\":1.7778}}" %}

## Übung

![](../.gitbook/assets/ralph_uebung.png)

1. Nimm dein am Tag 1 erstelltes  Projekt "GX\_NachnameVorname\_Übung" und erstelle darin eine neue Seite Namens "Filters" 
2. Deine Aufgabe soll es nun sein die folgenden Filter/Pipes in einem Beispiel auf deiner Seite zu integrieren. Als Hilfestellung soll dir die [Angular Dokumentation](https://angular.io/guide/pipes) dienen.
   1. `lowercase`
   2. `uppercase`
   3. `date` \(Formatiere doch ein Datum um\)

