# Datenanbindung: Offline

## Offline-Persistenz

Die Speicherung von Daten Offline hat Vor- / Nachteile. Anbei einige Argumente:

| Vorteile | Nachteile |
| :--- | :--- |
| lokale Daten | keine resp. nur schlechte Teilbarkeit |
| Keine Internet-Verbindung nötig | Limitierung bei Multi-User |
| Für kleine Daten optimal | Mühsame Verwaltung \(Release-Upgrades\) |

Es gibt online sehr viele Tutorials welche z.B. ein [Offline-Modus mit SQLite](http://blog.ionic.io/building-an-ionic-app-with-offline-support-part-1/) oder native Lösungen mit [Ionics Native Storage ](https://ionicframework.com/docs/v2/native/nativestorage/)resp. wiederum [SQLite](https://ionicframework.com/docs/v2/native/sqlite/) als Native Komponente beschreiben. Oft macht deren Einsatz Sinn, wenn man grosse Daten resp. Objekte \(z.B. in JSON\) speichern möchte.  
Für kleinere Daten funktioniert in Ionic resp. Cordova auch der [HTML 5 local Storage](http://www.w3schools.com/html/html5_webstorage.asp).

### HTML5 - lokaler Storage

Normalerweise kann man den HTML5 Local Storage in etwa so einsetzen:

```javascript
if(typeof(Storage) != "undefined") {
    localStorage.setItem("vorname", "Max");
    localStorage.setItem("nachname", "Muster");
    alert(localStorage.getItem("vorname") + " " + localStorage.getItem("nachname"));
} else {
    alert("Sorry, dein Browser unterstützt kein Web Storage...");
}
```

### Ionic Storage

Ionic hat auch fürs Persistieren von einfachen Daten eine Lösung bereit:   
[https://ionicframework.com/docs/angular/storage](https://ionicframework.com/docs/angular/storage)

Mit den Methoden `storage.set(..)` `storage.get(..)` kannst du einfache Key/Value-Paare oder JSON Objekte speichern:

```javascript
import { Storage } from '@ionic/storage';

export class MyApp {
  constructor(private storage: Storage) { }

  ...

  // set a key/value
  storage.set('name', 'Max');

  // Or to get a key/value pair
  storage.get('age').then((val) => {
    console.log('Your age is', val);
  });
}
```

## Übung - Ionic Storage

![](../.gitbook/assets/ralph_uebung.png)

1. Lass uns nun einige Übungen mit dem Ionic Storage machen
2. Schnapp dir deine Übungsprojekt "GX\_NachnameVorname\_Übung" und erstelle darin eine neue Seite Namens "Storage"
3. Sind dir die Ideen ausgegangen? Frag deinen Nachbar oder den Instruktor mit deinem Beispiel
4. Nun kannst du endlich deine Einstellungen realisieren, resp. dort auch was speichern
5. Zusatz: Erstelle eine Willkommens-Seite, die nur Einmalig beim App-Start angezeigt wird. Öffnet der Benutzer die App zum zweiten mal, soll die Seite nicht mehr angezeigt werden

