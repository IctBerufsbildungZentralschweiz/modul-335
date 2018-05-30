# Ionic Pro / Firebase

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

## Ionic Pro

**\(Ihr neues Flagschiff\)**

Ionic Pro ist eine powervolle Sammlung von Services und Features, welche das Ionic Framework erweitert. Es bringt die App Entwicklung für Entwicklungsteams auf total neues Level.

Ionic Pro hat diverse Services, welche dich durch den gesamten App Lifecyle beschäftigen:

* [**Deploy**](https://ionicframework.com/docs/pro/deploy/)**:** Spiele in Echzeit Remote-Updates deiner App ein, ohne über die Verzögerungen im App-Store.
* [**View**](https://ionicframework.com/docs/pro/view/)**:** Teste deine App mit Testern und erhalte umgehend Feedback ohne komplizierte Geräte- & Profilverwaltung.
* [**Package**](https://ionicframework.com/docs/pro/package/)**:** Builde App-Binaries in der Cloud für iOS und Android.
* [**Monitoring**](https://ionicframework.com/docs/pro/monitoring/)**:** Fange Laufzeitfehler deiner App in Produktion ab und schliesse Sie auf deine Zeile Code zurück.

Alle diese Services basieren auf einem einfachen GIT-Workflow, welcher dir als Entwickler bekannt sein sollten.

### Du möchtest, resp. hast Ionic Pro bereits verwendet

Zu Beginn dieses Kurses habe wir dich darum gebeten einen Account auf folgender Website zu machen: [https://dashboard.ionicjs.com/apps](https://dashboard.ionicjs.com/apps) Ja genau, bereits auf Ionic Pro. Zudem hast du sicher die DevApp auf deinem Gerät installiert, auch diese gehört bereits zur Ionic Pro Produktepalette.

## Google Firebase

Wir werden die kommenden Übungen mit [Google's Firebase](https://firebase.google.com/) als Backend as a Service absolvieren, schau dir dazu folgendes Video an:

{% embed data="{\"url\":\"https://www.youtube.com/watch?v=O17OWyx08Cg\",\"type\":\"video\",\"title\":\"\",\"icon\":{\"type\":\"icon\",\"url\":\"https://www.youtube.com/yts/img/favicon\_144-vfliLAfaB.png\",\"width\":144,\"height\":144,\"aspectRatio\":1},\"thumbnail\":{\"type\":\"thumbnail\",\"url\":\"https://i.ytimg.com/vi/O17OWyx08Cg/maxresdefault.jpg\",\"width\":1280,\"height\":720,\"aspectRatio\":0.5625},\"embed\":{\"type\":\"player\",\"url\":\"https://www.youtube.com/embed/O17OWyx08Cg?rel=0&showinfo=0\",\"html\":\"<div style=\\"left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.2493%;\\"><iframe src=\\"https://www.youtube.com/embed/O17OWyx08Cg?rel=0&amp;showinfo=0\\" style=\\"border: 0; top: 0; left: 0; width: 100%; height: 100%; position: absolute;\\" allowfullscreen scrolling=\\"no\\"></iframe></div>\",\"aspectRatio\":1.7778}}" %}

### Wie füge ich Firebase zu meinem Projekt hinzu?

Um Firebase zu installieren, brauchen wir AngularFire2. Öffne dein Terminal, geh in den Projektordner und führe folgenden Befehl aus:

```bash
npm install angularfire2 firebase
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

Die Verbindungsdaten der `firebaseConfig` sind für diesen Kurs hier gegeben. Du brauchst also nicht extra eine eigene App zu erfassen. Möchtest du es trotzdem tun, gehe in das [Firebase Console Dashboard](https://console.firebase.google.com). Du solltest dort direkt nach dem Erstellen einer App ein grossen violetten Knopf sehen mit _Firebase zu meiner Web-App hinzufügen_. That's it, so weiter im Kontext...

Füge noch folgende beiden Zeilen im `@NgModule`-Teil im `imports`-Array hinzu:

```javascript
    AngularFireModule.initializeApp(firebaseConfig),
    AngularFireDatabaseModule,
    AngularFireAuthModule
```

Deine `app.module.ts`-Datei sollte etwa so aussehen:

```javascript
import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { ListPage } from '../pages/list/list';

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

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
  declarations: [
    MyApp,
    HomePage,
    ListPage
  ],
  imports: [
    BrowserModule,
    IonicModule.forRoot(MyApp),
    AngularFireModule.initializeApp(firebaseConfig),
    AngularFireDatabaseModule,
    AngularFireAuthModule
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    ListPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {}
```

### Übung

![](../.gitbook/assets/ralph_uebung.png)

Wir möchten nun für deine App-Idee aus Use-Case 1 ein einfaches Login inkl. Registrierung einbauen. Gehe dazu wie folgt vor: 1. Lies die Doku oben nochmals gut durch. 2. Füge AngularFire nach der Anleitung in dein Projekt ein. Wir verwenden für diese Übung alle die selben Firebase-Daten: _m335-auth_ 3. Schau dir folgendes HowTo-Video Schritt für Schritt an. Pausiere zwischendurch, denn er spricht schnell und tippt noch viel schneller. Baue dir dein eigenes Login inkl. Registrierung in deine App-Idee.

{% embed data="{\"url\":\"https://www.youtube.com/watch?v=aNW444SpFNs\",\"type\":\"video\",\"title\":\"\",\"icon\":{\"type\":\"icon\",\"url\":\"https://www.youtube.com/yts/img/favicon\_144-vfliLAfaB.png\",\"width\":144,\"height\":144,\"aspectRatio\":1},\"thumbnail\":{\"type\":\"thumbnail\",\"url\":\"https://i.ytimg.com/vi/aNW444SpFNs/maxresdefault.jpg\",\"width\":1280,\"height\":720,\"aspectRatio\":0.5625},\"embed\":{\"type\":\"player\",\"url\":\"https://www.youtube.com/embed/aNW444SpFNs?rel=0&showinfo=0\",\"html\":\"<div style=\\"left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.2493%;\\"><iframe src=\\"https://www.youtube.com/embed/aNW444SpFNs?rel=0&amp;showinfo=0\\" style=\\"border: 0; top: 0; left: 0; width: 100%; height: 100%; position: absolute;\\" allowfullscreen scrolling=\\"no\\"></iframe></div>\",\"aspectRatio\":1.7778}}" %}

1. Zusatz: Füge ein Logout in deine App ein.
2. Zusatz: Gib dem User die Möglichkeit mehr über sich im Profil zu speichern. Z.B. Geburtsdatum, Adresse, Wohnort, usw.
3. Zusatz: Hat der Benutzer sein Passwort vergessen? Er soll eine Möglichkeit haben sich ein neues zuzusenden.
4. Zusatz: Gib dem Benutzer ein Gesicht. Es soll ein Profilbild hinterlegt sein, evt. kannst du hier mit Gravatar arbeiten.

