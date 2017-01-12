# AngularJS: Data Binding

Das Data Binding mit AngularJS ist eines der Hauptvorteile des Frameworks:
![](https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-42/q1_2015_img1.png)

## One-Way Data Binding
Bei einer einfachen Applikation hat man Daten im Model (blau) und meist ein Template / HTML (rot) bei welchem die Daten einmalig zusammengeführt werden und dem User in einer View (grün) dargestellt werden. Die Verschmelzung von Daten und Code passiert meist nur einmalig. Stellen wir uns nun ein Formular auf einer Website vor und der Benutzer gibt dort ein Wert in ein Textfeld ein, so ist es mit dieser Methode nicht so einfach Daten im gleiche HTML-DOM zu ändern. Meist wird hier dann mit Javascript ein sehr unschöner Code geschrieben. 


## Two-Way Data Binding
Genau hier hat AngularJS seinen Vorteil. Das Data Binding in AngularJS synchronisiert das Model mit der View und umgekehrt. So kann ein Wert in der View geändert werden und gleichzeitig wird der Wert im Model auch angepasst. Umgekehrt natürlich auch, siehe Grafik rechts. Diese ständige Zweiweg-Synchronisation nennt man Two-Way Data Binding. 

```HTML
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
