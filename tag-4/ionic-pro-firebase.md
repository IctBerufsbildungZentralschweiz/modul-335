# Ionic Appflow / Firebase

## Ionic Appflow

Ionic Appflow ist ihr neues Flaggschiff und eine powervolle Sammlung von Services und Features, welche das Ionic Framework erweitert. Es bringt die App Entwicklung für Entwicklungsteams auf ein total neues Level.

Ionic Appflow hat diverse Services, welche dich durch den gesamten App Lifecycle beschäftigen:

* ****[**Builds**](https://ionicframework.com/docs/appflow/quickstart/connect): Zusammen mit einem Git-Workflow können Builds deployed oder paketiert werden
* ****[**Deploy**](https://ionicframework.com/docs/appflow/deploy/)**:** Spiele in Echzeit Remote-Updates deiner App ein, ohne über die Verzögerungen im App-Store.
* ****[**Package**](https://ionicframework.com/docs/appflow/package/)**:** Baue native App-Binaries in der Cloud für iOS und Android.
* ****[**Automation**](https://ionicframework.com/docs/appflow/automation/): Automatisierte Build mit Möglichkeiten für Webhooks

Die meistens Services basieren auf einem einfachen GIT-Workflow, welcher dir als Entwickler bekannt sein sollte.

### Du möchtest Ionic Appflow verwenden?

Um Ionic Appflow zu Nutzen, kannst du dir auf der folgenden Seite einen kostenlosen, limitierten Account erstellt:\
[https://ionicframework.com/appflow](https://ionicframework.com/appflow)

Damit Ionic ihre Kosten ebenfalls bezahlen kann, gibts dort mehrere Pro-Features welche kostenpflichtig werden.&#x20;

## Google Firebase

Wir werden die kommenden Übungen mit [Google's Firebase](https://firebase.google.com) als Backend as a Service absolvieren, schau dir dazu folgendes Video an:

{% embed url="https://www.youtube.com/watch?v=O17OWyx08Cg" %}

### Wie füge ich Firebase zu meinem Projekt hinzu?

Um Firebase zu installieren, brauchen wir `@angular/fire`. Öffne dein Terminal, geh in den Projektordner und führe folgenden Befehl aus:

```bash
# Angular Firebase
npm install @angular/fire firebase --save

# Storage, brauchen wir später auch im Kapitel Datenanbindung
npm install @ionic/storage-angular --save 
```

Wir müssen nun die Verbindung zwischen deiner App und  Firebase herstellen. Dazu kann man online im Firebase-Projekt die nötigen Verbindungsparameter kopieren. In unserem Fall verwenden wir für das Login immer das gleiche Projekt.\
Kopiere folgenden Inhalt in dein src/environments/environment.ts :

{% code title="environment.ts" %}
```javascript
export const environment = {
  production: false,
  // Neu hinzufügen
  firebaseConfig: {
    apiKey: "AIzaSyArTTnqykFNgwBRL8IldPCFn8dobVVghBI",
    authDomain: "m335-login.firebaseapp.com",
    databaseURL: "https://m335-login.firebaseio.com",
    projectId: "m335-login",
    storageBucket: "m335-login.appspot.com",
    messagingSenderId: "14955115856",
    appId: "1:14955115856:web:d53930b7c82b6d01106855"
  }
};
```
{% endcode %}

{% hint style="warning" %}
Die Datei `environment.ts` ist für die lokale Entwicklung gedacht, mit der Datei `environment.prod.ts` kannst du die Verbindungsparameter deines produktiven Firebase-Projekts eintragen. Best-Practice ist hier mind. zwei unterschiedliche Umgebungen/Projekte zu verwenden.
{% endhint %}

{% hint style="warning" %}
Seit Dezember 2021 hat Firebase eine neu Version veröffentlicht. Damit die Kursunterlagen nach altem Muster funktionieren, muss bei allen Firebase-Imports der Compatibility-Modus `compat` verwendet werden.&#x20;
{% endhint %}

Jetzt können wir Firebase initialisieren, gehe dazu in die Datei `src/app/app.module.ts` und importiere alles was du von Firebase benötigst.

```javascript
// AngularFire2 importieren
import { AngularFireModule } from '@angular/fire/compat';
import { AngularFirestoreModule } from '@angular/fire/compat/firestore';
import { AngularFireDatabaseModule } from '@angular/fire/compat/database';
import { AngularFireAuthModule } from '@angular/fire/compat/auth';

// Environments importieren
import { environment } from "../environments/environment";
```

{% hint style="info" %}
Die Verbindungsdaten der `firebaseConfig` sind für diesen Kurs hier gegeben. Du brauchst also nicht extra eine eigene App zu erfassen. Möchtest du es trotzdem tun, gehe in das [Firebase Console Dashboard](https://console.firebase.google.com). Du solltest dort direkt nach dem Erstellen einer App ein grossen violetten Knopf sehen mit _Firebase zu meiner Web-App hinzufügen_. That's it, so weiter im Kontext...
{% endhint %}

Füge noch folgende beiden Zeilen im `@NgModule`-Teil im `imports`-Array hinzu:

```javascript
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFirestoreModule,
    AngularFireDatabaseModule,
    AngularFireAuthModule
```

Deine `app.module.ts`-Datei sollte etwa so aussehen:

{% code title="app.module.ts" %}
```typescript
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';

import { IonicModule, IonicRouteStrategy } from '@ionic/angular';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
// Storage hinzufügen
import { IonicStorageModule } from '@ionic/storage-angular';

// AngularFire2 importieren
import { AngularFireModule } from '@angular/fire/compat';
import { AngularFirestoreModule } from '@angular/fire/compat/firestore';
import { AngularFireDatabaseModule } from '@angular/fire/compat/database';
import { AngularFireAuthModule } from '@angular/fire/compat/auth';


// Environments importieren
import { environment } from "../environments/environment";


@NgModule({
  declarations: [AppComponent],
  entryComponents: [],
  imports: [
    BrowserModule,
    IonicModule.forRoot(),
    AppRoutingModule,
    IonicStorageModule.forRoot(),
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFirestoreModule,
    AngularFireDatabaseModule,
    AngularFireAuthModule
  ],
  providers: [
    StatusBar,
    SplashScreen,
    { provide: RouteReuseStrategy, useClass: IonicRouteStrategy }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}

```
{% endcode %}

###
