# Angular / Ionic: Navigation
NavController ist die Basisklasse für Navigation Controller Komponenten wie _Nav_ und _Tab_. Wir brauchen den Navigation Controller um in Seiten deiner App zu navigieren.
Auf eine Art ist der Navigation Controller eine Art _"Array von Seiten"_, welche ein bestimmte Reihenfolge (so wie auch History) darstellt. 
Die Navigation erfolgt meistens über `push` und `pop` von Seiten und hinzufügen resp. entfernen in der History.

Die aktuelle Seite ist die letzte im Array, oder zuoberst im Stapel (wenn du so denkst). Eine neue Seite kann mittels `push` nun auf den Stapel hinzugefügt werden. Eine Seite wird mittels `pop` vom Stapel entfernt und die letzte Seite wird wieder angezeigt. Beide Vorgänge können animiert passieren.
![](http://mcgivery.com/wp-content/uploads/2015/12/stack.png)




## Wie kann ich zu einer Seite resp. zurück navigieren?
Wir möchten von unserer Hauptseite zu den Einstellungen navigieren:

```js
// home.ts
import { Component } from '@angular/core';
import { LoadingController, NavController } from 'ionic-angular';
import { SettingsPage } from '../../pages/settings/settings';


@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  constructor(public navCtrl: NavController) {
  
  }

  goToSettings() {
    this.navCtrl.push(SettingsPage);
  }

}

```
Die Funktion `goToSettings()` wird bei einem Klick auf einen Icon aufgerufen. Diese pusht dann _SettingsPage_ via NavController auf den Stack.

Möchten wir nun von den Einstellungen zurück auf die Hauptseite, können wir mit `pop`

```js 
//settings.ts
import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

@IonicPage()
@Component({
  selector: 'page-settings',
  templateUrl: 'settings.html',
})
export class SettingsPage {

  constructor(public navCtrl: NavController, public navParams: NavParams) {

  }
  goBack() {
    this.navCtrl.pop();
  }
}
```

## Wie übergebe ich Werte zwischen zwei Seiten?
In vielen Szenarien haben wir Daten in einer View und möchten diese an eine andere übergeben. Glücklicherweise bietet `push` einen weiteren Parameter an um Data zu übergeben:
```js
this.nav.push(PersonPage,{
	vorname: "Max",
	name: "Muster",
	spielMusik: true
});
```
Die Daten sind in der Personen-Seite nun über die `NavParams` zu holen:
```js
import {Page, NavParams} from 'ionic-angular';

@Page({
	templateUrl: 'build/pages/Person/Person.html',
})
export class PersonPage {
	constructor(navParams: NavParams){
		this.vorname = navParams.get("vorname"); // "Max"
		this.name = navParams.get("name"); // "Muster"
		this.spieltMusik = navParams.get("spielMusik"); // true
	}
}
```

Bitte lies folgende Doku nochmals durch und stelle wenn nötig im Plenum fragen:
https://ionicframework.com/docs/api/navigation/NavController/ 


---

## Übung

![](/_allgemein/ralph_uebung.png)

1. Nimm dein am Tag 1 in Creator erstelltes  Projekt "GX\_NachnameVorname\_Übung" und erstelle darin eine neue Seite Namens "Rechner" 
2. Dein Auftrag wird es nun sein mit dem oben beschrieben Möglichkeiten eine Rechner-App für Ralph zu erstellen.
3. Mach vorher kurz eine Skizze \(Lo-Fi\) deiner Idee
4. Der Rechner soll folgenden Funktionsumfang haben:
   1. Nur ein Input-Feld \(Für Eingabe und auch Ausgabe des Resultats\)
   2. Dein Rechner soll die folgenden Grundfunktionen anbieten \(Buttons verwenden\)
      1. Addition \(+\) 
      2. Subtraktion \(-\)

