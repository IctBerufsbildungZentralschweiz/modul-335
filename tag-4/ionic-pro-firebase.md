# Ionic Appflow / Firebase

## Ionic: Cloud

**\(Im Januar 2019 heisst es bye bye Wolke\)**

Ionic Cloud war ein hybrid-fokussiertes Mobiles Backend inkl. Services von Ionic. Es erlaubt einem Entwickler sehr einfach eine performante, produktive App aufzusetzen und zu skalieren.

Die [Dokumentation für Ionic Cloud](http://docs.ionic.io/) war jeweils mit beiden Versionen Ionic 1 und 2 kompatibel und geschrieben .

### Services

Folgende Services waren darin enthalten und sind jetzt nicht mehr im neuen Produkt drin:

* [Auth](http://docs.ionic.io/services/auth/) eine Benutzerverwaltung inkl. Social Logins
* [Ionic DB](http://docs.ionic.io/services/database/) eine einfache Echzeit-Datenbank
* [Push](http://docs.ionic.io/services/push/)-Notifikationen über die Plattform an Benutzer senden

Ionic möchte sich auf die Entwicklung fokussieren und nicht anderen Cloud-Grössen wie Amazon, Google, Heroku, usw. Konkurrenz machen.

## Ionic Appflow

**\(Ihr neues Flagschiff, seit Herbst 2018 nicht mehr Ionic PRO\)**

Ionic Appflow ist eine powervolle Sammlung von Services und Features, welche das Ionic Framework erweitert. Es bringt die App Entwicklung für Entwicklungsteams auf total neues Level.

Ionic Appflow hat diverse Services, welche dich durch den gesamten App Lifecyle beschäftigen:

* \*\*\*\*[**Builds**](https://ionicframework.com/docs/appflow/builds/#builds): Zusammen mit einem Git-Workflow können Builds deployed oder packetiert werden
* \*\*\*\*[**Deploy**](https://ionicframework.com/docs/appflow/deploy/)**:** Spiele in Echzeit Remote-Updates deiner App ein, ohne über die Verzögerungen im App-Store.
* \*\*\*\*[**Package**](https://ionicframework.com/docs/appflow/package/)**:** Builde native App-Binaries in der Cloud für iOS und Android.
* \*\*\*\*[**Automation**](https://ionicframework.com/docs/appflow/automation/): Automatisierte Build mit Möglichkeiten für Webhooks

Die meistens Services basieren auf einem einfachen GIT-Workflow, welcher dir als Entwickler bekannt sein sollte.

### Du möchtest, resp. hast Ionic Appflow bereits verwendet

Zu Beginn dieses Kurses habe wir dich darum gebeten einen Account auf folgender Website zu machen: [https://dashboard.ionicjs.com/apps](https://dashboard.ionicjs.com/apps) Ja genau, bereits auf Ionic Appflow. Zudem hast du sicher die DevApp auf deinem Gerät installiert, auch diese gehört bereits zur Ionic Appflow Produktepalette.

## Google Firebase

Wir werden die kommenden Übungen mit [Google's Firebase](https://firebase.google.com/) als Backend as a Service absolvieren, schau dir dazu folgendes Video an:

{% embed url="https://www.youtube.com/watch?v=O17OWyx08Cg" %}

### Wie füge ich Firebase zu meinem Projekt hinzu?

Um Firebase zu installieren, brauchen wir AngularFire2. Öffne dein Terminal, geh in den Projektordner und führe folgenden Befehl aus:

```bash
npm install angularfire2 firebase --save
```

Jetzt können wir Firebase initialisieren, gehe dazu in die Datei `src/app/app.module.ts` und importiere alles was du von Firebase benötigst.

```javascript
// AngularFire2 importieren
import { AngularFireModule } from 'angularfire2';
import { AngularFireDatabaseModule } from 'angularfire2/database';
import { AngularFireAuthModule } from 'angularfire2/auth';


// Firebase Einstellungen 
export const firebaseConfig = {
  apiKey: "AIzaSyBM_MflQcqElJum8Mc6IGDBr5ruBeDSVKI",
  authDomain: "m335-auth.firebaseapp.com",
  databaseURL: "https://m335-auth.firebaseio.com",
  projectId: "m335-auth",
  storageBucket: "m335-auth.appspot.com",
  messagingSenderId: "535601451759"
};
```

{% hint style="info" %}
Die Verbindungsdaten der `firebaseConfig` sind für diesen Kurs hier gegeben. Du brauchst also nicht extra eine eigene App zu erfassen. Möchtest du es trotzdem tun, gehe in das [Firebase Console Dashboard](https://console.firebase.google.com). Du solltest dort direkt nach dem Erstellen einer App ein grossen violetten Knopf sehen mit _Firebase zu meiner Web-App hinzufügen_. That's it, so weiter im Kontext...
{% endhint %}

Füge noch folgende beiden Zeilen im `@NgModule`-Teil im `imports`-Array hinzu:

```javascript
    AngularFireModule.initializeApp(firebaseConfig),
    AngularFireDatabaseModule,
    AngularFireAuthModule
```

Deine `app.module.ts`-Datei sollte etwa so aussehen:

{% code-tabs %}
{% code-tabs-item title="app.module.ts" %}
```typescript
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';

import { IonicModule, IonicRouteStrategy } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { IonicStorageModule } from '@ionic/storage';

// AngularFire2 importieren
import { AngularFireModule } from 'angularfire2';
import { AngularFireDatabaseModule } from 'angularfire2/database';
import { AngularFireAuthModule } from 'angularfire2/auth';


// Firebase Einstellungen 
export const firebaseConfig = {
  apiKey: "AIzaSyBM_MflQcqElJum8Mc6IGDBr5ruBeDSVKI",
  authDomain: "m335-auth.firebaseapp.com",
  databaseURL: "https://m335-auth.firebaseio.com",
  projectId: "m335-auth",
  storageBucket: "m335-auth.appspot.com",
  messagingSenderId: "535601451759"
};
@NgModule({
  declarations: [AppComponent],
  entryComponents: [],
  imports: [
    BrowserModule,
    IonicModule.forRoot(),
    AppRoutingModule,
    IonicStorageModule.forRoot(),
    AngularFireModule.initializeApp(firebaseConfig),
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
{% endcode-tabs-item %}
{% endcode-tabs %}

### Übung

![](../.gitbook/assets/ralph_uebung.png)

Wir möchten nun für deine App-Idee aus Use-Case 1 ein einfaches Login inkl. Registrierung einbauen. Gehe dazu wie folgt vor: 1. Lies die Doku oben nochmals gut durch. 2. Füge AngularFire nach der Anleitung in dein Projekt ein. Wir verwenden für diese Übung alle die selben Firebase-Daten: _m335-auth_ 3. Schau dir folgendes HowTo-Video Schritt für Schritt an. Pausiere zwischendurch, denn er spricht schnell und tippt noch viel schneller. Baue dir dein eigenes Login inkl. Registrierung in deine App-Idee.

{% hint style="warning" %}
Dieses Video wurde mit Ionic 3 erstellt. Solltest du Probleme in Ionic 4 damit haben, frage in deiner Gruppe nach resp. wende dich an deinen Kursleiter.
{% endhint %}

{% embed url="https://www.youtube.com/watch?v=aNW444SpFNs" %}

1. Zusatz: Füge ein Logout in deine App ein.
2. Zusatz: Gib dem User die Möglichkeit mehr über sich im Profil zu speichern. Z.B. Geburtsdatum, Adresse, Wohnort, usw.
3. Zusatz: Hat der Benutzer sein Passwort vergessen? Er soll eine Möglichkeit haben sich ein neues zuzusenden.
4. Zusatz: Gib dem Benutzer ein Gesicht. Es soll ein Profilbild hinterlegt sein, evt. kannst du hier mit Gravatar arbeiten.

