# Google Firebase

Wir werden die kommenden Übungen mit [Google's Firebase](https://firebase.google.com/) als Backend as a Service absolvieren, schau dir dazu folgendes Video an:

{% embed url="https://www.youtube.com/watch?v=vAoB4VbhRzM" %}
Firebase in 100 Sekunden / Youtube - Fireship.io
{% endembed %}

Primär setzen wir dabei auf folgende Produkte:

* **Authentication** für Registrierung, Login, Zugriff auf Seiten zu unterbinden
* **Firestore** als Datenbasis für Lese- & Schreiboperation

Im Dezember 2021 hat Firebase eine neue Version mit modularem SDK veröffentlicht. Früher waren alle Funktionen ausschliesslich in Angular-Module verpackt.  Die beiden Varianten sind hier kurz erklärt:

* **Compat** - die alte, vertraute API-Oberfläche. Dazu ist viel Beispielcode im Internet zu finden. Eine "Übersetzung" von alt nach neu ist [hier](https://github.com/angular/angularfire/blob/master/docs/version-7-upgrade.md#alternatives-to-v6-apis) zu finden.
* **Modular** - eine neue API-Oberfläche, die das Tree-Shaking (Entfernen von ungenutztem Code) erleichtern soll, um die App so klein und schnell wie möglich zu machen.

In den kommenden Snippets sind jeweils beide Varianten aufgeführt.

&#x20;

### Wie füge ich Firebase zu meinem Projekt hinzu?

Um Firebase zu installieren, brauchen wir `@angular/fire`. Öffne dein Terminal, geh in den Projektordner wo auch dein `package.json` liegt und führe folgenden Befehl aus:

```bash
# Angular Firebase
npm install @angular/fire firebase --save
```

Wir müssen nun die Verbindung zwischen deiner App und  Firebase herstellen. Dazu kann man online im Firebase-Projekt die nötigen Verbindungsparameter kopieren. In unserem Fall verwenden wir für das Login immer das gleiche Projekt.\
Kopiere folgenden Inhalt in dein `src/environments/environment.ts` :

{% code title="environment.ts" %}
```javascript
export const environment = {
  production: false,
  // Firbase Verbindungsparameter hinzufügen
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
Die Datei `environment.ts` ist für die lokale Entwicklung gedacht, mit der Datei `environment.prod.ts` kannst du die Verbindungsparameter deines produktiven Firebase-Projekts eintragen. \
Best-Practice ist hier mind. zwei unterschiedliche Umgebungen/Projekte zu verwenden (z.B. `DEV` und `PROD`).
{% endhint %}

Jetzt können wir Firebase initialisieren, gehe dazu in die Datei `src/app/app.module.ts` und importiere alles was du von Firebase benötigst.

{% tabs %}
{% tab title="Compatibility" %}
```typescript
// ...
// AngularFire2 importieren
import { AngularFireModule } from '@angular/fire/compat';
import { AngularFirestoreModule } from '@angular/fire/compat/firestore';
import { AngularFireAuthModule } from '@angular/fire/compat/auth';

// Environments importieren
import { environment } from "../environments/environment";
// ...
```
{% endtab %}

{% tab title="Modular" %}
```typescript
// Environments importieren
import { environment } from "../environments/environment";

// Firebase Modular SDK importieren
import { provideFirebaseApp } from '@angular/fire/app';
import { initializeApp } from 'firebase/app';
import { provideFirestore } from '@angular/fire/firestore';
import { getFirestore } from 'firebase/firestore';
import { provideAuth } from '@angular/fire/auth';
import { getAuth } from 'firebase/auth';
```
{% endtab %}
{% endtabs %}

{% hint style="info" %}
Die Verbindungsdaten der `firebaseConfig` sind für diesen Kurs hier gegeben. Du brauchst also nicht extra eine eigene App zu erfassen. Möchtest du es trotzdem tun, gehe in das [Firebase Console Dashboard](https://console.firebase.google.com). Du solltest dort direkt nach dem Erstellen einer App ein grossen violetten Knopf sehen mit _Firebase zu meiner Web-App hinzufügen_. That's it, so weiter im Kontext...
{% endhint %}

Füge noch folgende beiden Zeilen im `@NgModule`-Teil im `imports`-Array hinzu:

{% tabs %}
{% tab title="Compatibility" %}
```typescript
AngularFireModule.initializeApp(environment.firebaseConfig),
AngularFirestoreModule,
AngularFireAuthModule
```
{% endtab %}

{% tab title="Modular" %}
```typescript
provideFirebaseApp(() => initializeApp(environment.firebaseConfig)),
provideFirestore(() => getFirestore()),
provideAuth(() => getAuth()),
```
{% endtab %}
{% endtabs %}

Deine `app.module.ts`-Datei sollte etwa so aussehen:

{% tabs %}
{% tab title="Compatibility" %}
{% code title="app.module.ts" %}
```typescript
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';

import { IonicModule, IonicRouteStrategy } from '@ionic/angular';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';

// Environments importieren
import { environment } from "../environments/environment";

// Firebase im Compatibility mode importieren
import { AngularFireModule } from '@angular/fire/compat';
import { AngularFirestoreModule } from '@angular/fire/compat/firestore';
import { AngularFireAuthModule } from '@angular/fire/compat/auth';

@NgModule({
  declarations: [AppComponent],
  entryComponents: [],
  imports: [
    BrowserModule,
    IonicModule.forRoot(),
    AppRoutingModule,
    IonicStorageModule.forRoot(),
    // Imports hinzufügen
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFirestoreModule,
    AngularFireAuthModule
  ],
  providers: [
    { provide: RouteReuseStrategy, useClass: IonicRouteStrategy }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
```
{% endcode %}
{% endtab %}

{% tab title="Modular" %}
{% code title="app.module.ts" %}
```typescript
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';

import { IonicModule, IonicRouteStrategy } from '@ionic/angular';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';

// Environments importieren
import { environment } from "../environments/environment";

// Firebase Modular SDK importieren
import { provideFirebaseApp } from '@angular/fire/app';
import { initializeApp } from 'firebase/app';
import { provideFirestore } from '@angular/fire/firestore';
import { getFirestore } from 'firebase/firestore';
import { provideAuth } from '@angular/fire/auth';
import { getAuth } from 'firebase/auth';


@NgModule({
  declarations: [AppComponent],
  entryComponents: [],
  imports: [
    BrowserModule,
    IonicModule.forRoot(),
    AppRoutingModule,
    IonicStorageModule.forRoot(),
    // Imports hinzufügen
    provideFirebaseApp(() => initializeApp(environment.firebaseConfig)),
    provideFirestore(() => getFirestore()),
    provideAuth(() => getAuth()),
  ],
  providers: [
    { provide: RouteReuseStrategy, useClass: IonicRouteStrategy }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
```
{% endcode %}
{% endtab %}
{% endtabs %}

