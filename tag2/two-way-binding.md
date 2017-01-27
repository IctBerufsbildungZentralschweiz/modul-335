# AngularJS: Data Binding

Das Data Binding mit AngularJS ist eines der Hauptvorteile des Frameworks:  
![](https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-42/q1_2015_img1.png)

## One-Way Data Binding

Bei einer einfachen Applikation hat man Daten im Model \(blau\) und meist ein Template / HTML \(rot\) bei welchem die Daten einmalig zusammengeführt werden und dem User in einer View \(grün\) dargestellt werden. Die Verschmelzung von Daten und Code passiert meist nur einmalig. Stellen wir uns nun ein Formular auf einer Website vor und der Benutzer gibt dort ein Wert in ein Textfeld ein, so ist es mit dieser Methode nicht so einfach Daten im gleiche HTML-DOM zu ändern. Meist wird hier dann mit Javascript ein sehr unschöner Code geschrieben.

## Two-Way Data Binding

Genau hier hat AngularJS seinen Vorteil. Das Data Binding in AngularJS synchronisiert das Model mit der View und umgekehrt. So kann ein Wert in der View geändert werden und gleichzeitig wird der Wert im Model auch angepasst. Umgekehrt natürlich auch, siehe Grafik rechts. Diese ständige Zweiweg-Synchronisation nennt man Two-Way Data Binding.

```html
<div ng-app="myApp" ng-controller="myCtrl">
    Name: <input ng-model="firstname">
    <h1>{{firstname}}</h1>
</div>

<script>
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope) {
    $scope.firstname = "John";
    $scope.lastname = "Doe";
});
</script>
```

{% youtube %} https://www.youtube.com/watch?v=21sFeFlvzks{% endyoutube %}




## Data binding in Creator mit ng-model

`ng-model` erlaubt es einem eine `$scope` Variable an ein Input-Feld in der App zu binden. Dies funktioniert nicht nur mit Textfelder \(Inputs\) sondern auch mit Radios, Selects, usw.

Mit dem folgenden Controller code:

```js
$scope.data = {
  'name': 'Ralph'
}
```

Setze `ng-model`: `data.name` unter "Angular Directives" auf der Komponente. Dies verbindet den im Textfeld eingegeben Text mit der effektiven `$scope` Variable.

First, put an ng-model on a Text Input, and then add a Paragraph component that displays the value `{{data.name}}`:

Setze zuerst ein `ng-model` auf den Text-Input und dann füge der Paragraph-Komponente den Ausdruck `{{data.name}}` zum Anzeigen des Werts hinzu.

![](https://files.readme.io/ceef229-Ionic_Creator_2016-10-31_19-54-57.png)

Hier ist das Resultat welches angezeigt wird wenn man den Text ändert:  
![](https://files.readme.io/8887f44-Screenshot_2016-10-31_19.52.20.png)

---

## Übungen

![](/_allgemein/ralph_uebung.png)

1. Nimm dein am Tag 1 in Creator erstelltes  Projekt "GX\_NachnameVorname\_Übung"
2. Füge eine neue Seite "Data Binding" mit folgenden Felder hinzu:
   1. Input: Name - Text
   2. Input: Vorname - Text
   3. Input: Alter - Number
3. Verknüpfe nun die jeweiligen Input-Felder mit deinem Controller mit Hilfe der oben beschriebene Methode ```ng-model```.
4. Füge nun unter deine Inputs ein Paragraph hinzu und gib einen Satz in folgendem Stil \(je nach Eingaben\) aus:  
```Mein Name ist Max Muster und ich bin 23 Jahre alt!```
5. Teste deine App  
   1. Funktioniert Sie wie erwartet?  
   2. Hast du die richtigen Input-Typen gewählt? Kannst du bei deinem Alter auch wirklich nur eine Zahl eingeben?



