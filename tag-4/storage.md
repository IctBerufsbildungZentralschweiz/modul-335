# Datenanbindung: Offline

## Offline-Persistenz

Die Speicherung von Daten Offline hat Vor- / Nachteile. Anbei einige Argumente:

| Vorteile                        | Nachteile                             |
| ------------------------------- | ------------------------------------- |
| lokale Daten                    | keine resp. nur schlechte Teilbarkeit |
| Keine Internet-Verbindung nötig | Limitierung bei Multi-User            |
| Für kleine Daten optimal        | Mühsame Verwaltung (Release-Upgrades) |

Es gibt online sehr viele Tutorials welche z.B. ein [Offline-Modus mit SQLite](http://blog.ionic.io/building-an-ionic-app-with-offline-support-part-1/) oder native Lösungen mit [Ionics Native Storage ](https://ionicframework.com/docs/v2/native/nativestorage/)resp. wiederum [SQLite](https://ionicframework.com/docs/v2/native/sqlite/) als Native Komponente beschreiben. Oft macht deren Einsatz Sinn, wenn man grosse Daten resp. Objekte (z.B. in JSON) speichern möchte.\
Für kleinere Daten funktioniert in Ionic resp. Cordova auch der [HTML 5 local Storage](http://www.w3schools.com/html/html5\_webstorage.asp).

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

Ionic hat auch fürs Persistieren von einfachen Daten eine Lösung bereit: \\

{% embed url="https://github.com/ionic-team/ionic-storage" %}

#### API

Mit den asynchronen Methoden `storage.set(..)` `storage.get(..)` kannst du einfache Key/Value-Paare oder JSON Objekte speichern. Beachte das hier `await` verwendet wird und die Methode somit mit `async` deklariert werden muss.

```javascript
import { Storage } from '@ionic/storage-angular';

export class MyApp {
  constructor(private storage: Storage) { }
  
  async saveNameToStorage() {
    // set a key/value
    await storage.set('name', 'Max');
  }
  
  async loadAgeFromStorage() {
    // Or to get a key/value pair
    const age = await storage.get('age');
  }


}
```

#### @ionic/storage-angular im Projekt verwenden

Damit du `@ionic/storage-angular` in deinem Projekt verwenden kannst. Empfehlen sich folgende Schritt:

1.  Installiere `@ionic/storage-angular` mittels NPM in deinem Projekt

    ```bash
    npm install @ionic/storage-angular --save
    ```


2.  Füge  `IonicStorageModule.forRoot()` unter `imports` im `ngModule` in der Datei `app.module.ts` hinzu.  Beispiel:\


    ```bash
    // Importieren
    import { IonicStorageModule } from '@ionic/storage-angular';

    @NgModule({
      declarations: [AppComponent],
      entryComponents: [],
      imports: [
        BrowserModule,
        IonicModule.forRoot(),
        AppRoutingModule,
        // Neu hinzufügen
        IonicStorageModule.forRoot(),
      ],
      providers: [
        { provide: RouteReuseStrategy, useClass: IonicRouteStrategy },
        { provide: HAMMER_GESTURE_CONFIG, useClass: HammerConfig } 
      ],
      bootstrap: [AppComponent]
    })
    export class AppModule {}

    ```


3.  Erstelle für den Storage eine eigenen, neuen Service welcher dir hilft Daten zu speichern/lesen:

    ```bash
    ionic generate service _services/storage
    ```


4.  Ergänze bei dein Imports im App Module (`app.module.ts`) folgendes:

    ```bash
      imports: [
        ...
        IonicStorageModule.forRoot()
        ...
      ]
    ```

    \

5.  Der Service sollte in etwa so aussehen:

    ```typescript
    import { Injectable } from '@angular/core';

    import { Storage } from '@ionic/storage-angular';

    @Injectable({
      providedIn: 'root'
    })
    export class StorageService {
      private _storage$: Promise<Storage>;

      constructor(private storage: Storage) {
        this.init();
      }

      init() {
        this._storage$ = this.storage.create();
      }

      public async set(key: string, value: any) {
        (await this._storage$).set(key, value);
      }

      public async get(key: string): Promise<any> {
        return (await this._storage$).get(key)
      }

    }
    ```
6.  Verwende nun den Service in deiner erstellten Page, indem du ihn über den Konstruktor einfügst und importierst:

    ```typescript
    import { Component, OnInit } from '@angular/core';
    // Importieren
    import { StorageService } from '../_services/storage.service';


    @Component({
      selector: 'app-local-storage',
      templateUrl: './storage.page.html',
      styleUrls: ['./storage.page.scss'],
    })
    export class StoragePage implements OnInit {
      name: string;
      pushToggle: boolean;
      newsletterToggle:boolean;

      constructor(private storageService: StorageService) {}
      
     // TODO: ...
     
    } 
    ```

## Übung - Ionic Storage

![](../.gitbook/assets/ralph\_uebung.png)

1. Lass uns nun einige Übungen mit dem Ionic Storage machen
2. Schnapp dir deine Übungsprojekt "GX\_NachnameVorname\_Übung" und erstelle darin mit dem Generator eine neue Seite Namens "Storage"
3. Sind dir die Ideen ausgegangen? Frag deinen Nachbar oder den Instruktor mit deinem Beispiel
4. Nun kannst du endlich deine Einstellungen realisieren, resp. dort auch was speichern
5. Zusatz: Erstelle eine Willkommens-Seite, die nur Einmalig beim App-Start angezeigt wird. Öffnet der Benutzer die App zum zweiten mal, soll die Seite nicht mehr angezeigt werden
