# AngularJS: Filters / Pipes

Filter resp. auch Pipes genannt können in AngularJS hinzugefügt werden um Daten zu formatieren oder sortieren. Anbei eine Auflistung der wichtigsten Filtermöglichkeiten welche Daten verändern können:

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

---

# Übung

![](/_allgemein/ralph_uebung.png)

1. Nimm dein am Tag 1 erstelltes  Projekt "GX\_NachnameVorname\_Übung" und erstelle darin eine neue Seite Namens "Filters" 
2. Deine Aufgabe soll es nun sein die folgenden Filter/Pipes in einem Beispiel auf deiner Seite zu integrieren. Als Hilfestellung soll dir die [AngularJS Dokumentation](https://angular.io/guide/pipes) dienen.
   1. `lowercase`
   2. `uppercase`
   3. `limitTo` \(Hier kannst du das Früchte-Array nehmen und damit etwas spielen\)
   4. `orderBy` \(Nimm auch hier das Früchte-Array aus der Syntax-Übung\)
   5. `currency` \(Hier wäre schön wenn du eine Formatierung für CHF findest\)

   



