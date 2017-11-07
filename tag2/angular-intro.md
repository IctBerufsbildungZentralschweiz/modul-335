# AngularJS: Intro

## Was ist AngularJS?

![](http://html5-mobile.de/wp-content/uploads/2012/05/angular-js-mvc-framework.png)

[AngularJS](https://angularjs.org/) ist ein Open-Source-Framework welches von Google gesponsert und verwendet wird.

In AngularJS werden mit HTML-Code deklarativ die Oberflächen gestaltet. Ein wichtiger Aspekt ist, dass Anwendungslogik nur in den JavaScript-Dateien definiert wird. Dieser sollte weitmöglichst unabhängig von der Oberfläche sein. Im Gegensatz zu manch anderen MVC-Frameworks erweitert AngularJS den HTML-Code aber nur, anstatt ihn zu abstrahieren.  
Schon an diesem simplen Beispiel zeigt sich die Leichtigkeit von AngularJS. Der HTML Code ist einfach zu verstehen, enthält jedoch keine Logik. Durch das von AngularJS kontrollierte Binding ändert sich die Anzeige in Zeile 6, sobald in Zeile 5 ein Wert geändert wird. Der vergleichbare jQuery Code wäre deutlich länger!

```html
<body ng-app="myModule" ng-controller="MyCtrl">
  <span>Anzahl Elemente: {{list.length}} </span>
  <ul>
    <li ng-repeat="element in list">
      <input type="text" ng-model="element.text">
      <span>{{element.text}}</span>
    </li>
  </ul>
</body>
```

Und hier noch der dazugehörige Controller:

```js
angular.module('myModule', [])
.controller("MyCtrl", function($scope) {
  $scope.list = [
    {text:'angluarjs'},
    {text:'jQuery'}];
});
```

## Ablauf einer Anfrage

![](http://www.innotix.com/files/2914/5631/4175/SinglePage_Lifecycle.png)

### Vorteil einer Single Page Applikation

* Gesamte Applikations-Logik im Browser
* Hohe Geschwindigkeit durch Wegfall langer Ladezyklen
* App-Feeling durch schnelle dynamische Inhaltsanpassungen
* Tiefes zu übertragendes Datenvolumen, mit einhergehendem Performance-Vorteil bei Mobile-Webapplikationen.

## Kurze Geschichte von Angular

Angular 1.x wurde nicht für den mobilen Einsatz gebaut, Angular 2.0 hingegen schon. Angular 2 ist durch eine hirarchische Dependency Injection um einiges schneller als Angular 1.x. und ist grosses Update.  
Hier weitere wichtige Vorteile von 2.0:

| Vorteile Angular 2.0 |
| :--- |
| Komponenten basierte Programmierung |
| Ist ein Framework |
| Verwendet TypeScript |
| Verwendetet component und directives |
| Etwas kompliziertes mit Aufwand verbundenes Setup, da Abhängigkeiten zu Bibliotheken bestehen |
| Verwendet camelCase, z.B. ngModel |

### Codebeispiel Angular 2.0

```js
import { Component } from '@angular/core';

@Component({
    selector: 'prodsdata',
    template: '<h3>{{prods.name}}</h3>'
})

export class ProductComponent {
    prods = {name: 'Prod1', quantity: 1 };
}
```

---

## Gruppenübung

![](/_allgemein/ralph_uebung.png)

Lass uns in ein paar Google Slides einige AngularJS Applikationen zusammentragen:

1. Geh via [Moodle](https://kurse.ict-bz.ch/) -&gt; Nützliche Links auf den entsprechenden Ordner_ "Tag2/Teil22\_AngularApps"_ und öffne die Datei online.
2. Erstelle dort einen oder mehrere neue Slides und suche im Internet nach Applikation \(auch Beispiel Apps\) welche mit Angular 2 erstellt werden. \(Alternativ auch mit Angular 1\) 
3. Ergänze deine Slides mit Bildern oder Code-Beispielen.

Wir besprechen die Ergebnisse in Rund 15min gemeinsam gemeinsam.

