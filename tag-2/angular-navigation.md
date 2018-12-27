# Angular: Navigation

NavController ist die Basisklasse für Navigation Controller Komponenten wie _Nav_ und _Tab_. Wir brauchen den Navigation Controller um in Seiten deiner App zu navigieren.  
Auf eine Art ist der Navigation Controller eine Art _"Array von Seiten"_, welche ein bestimmte Reihenfolge \(so wie auch History\) darstellt.  
Die Navigation erfolgt meistens über `push` und `pop` von Seiten und hinzufügen resp. entfernen in der History.

Die aktuelle Seite ist die letzte im Array, oder zuoberst im Stapel \(wenn du so denkst\). Eine neue Seite kann mittels `push` nun auf den Stapel hinzugefügt werden. Eine Seite wird mittels `pop` vom Stapel entfernt und die letzte Seite wird wieder angezeigt. Beide Vorgänge können animiert passieren.  
![](../.gitbook/assets/stack.png)

## Wie kann ich zu einer Seite resp. zurück navigieren?

Wir möchten von unserer Hauptseite zu den Einstellungen navigieren:

```javascript
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

```javascript
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

In vielen Szenarien haben wir Daten in einer View und möchten diese an eine andere übergeben. Glücklicherweise bietet `push` einen weiteren Parameter an um Daten zu übergeben:

```javascript
this.nav.push(PersonPage,{
    vorname: "Max",
    name: "Muster",
    spielMusik: true
});
```

Die Daten sind in der Personen-Seite nun über die `NavParams` zu holen:

```javascript
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
[https://ionicframework.com/docs/api/navigation/NavController/](https://ionicframework.com/docs/api/navigation/NavController/)

Mit Ionic 4 wird empfohlen das Routing über den Angular-Router zu machen: [https://www.joshmorony.com/converting-ionic-3-push-pop-navigation-to-angular-routing-in-ionic-4/](https://www.joshmorony.com/converting-ionic-3-push-pop-navigation-to-angular-routing-in-ionic-4/)

