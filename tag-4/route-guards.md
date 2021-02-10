# Guards / Service / Login

Wenn wir das Angular Routing verwenden, können wir mit sogenannten _Guards_ Zugriff auf gewisse Routes \(z.B.`/meineliste`\) verhindern, sofern gewisse Konditionen zutreffen.   
Beispiele dafür sind:

* Willkommens und Tutorial-Seiten beim Start der App
* Login- und Registrierung-Formulare resp. die geschützten Seiten dazu

In den kommenden Kapiteln werden wir dies zusammen erarbeiten.

## Guards

Die grundsätzliche Idee ist es unseren Routes eine Route Guard anzuhängen.   
Diese Guard muss über eine `canActivate` resp. `canLoad` Methode verfügen, welche entweder `true` oder `false` zurück liefert. Wenn `true` zurückkommt wird dem Benutzer der Zugriff erlaubt, bei `false` wird er keinen Zugriff auf die Route erhalten.

`canActivate` wird verwendet um den Benutzer den Zugriff auf eine gewisse Route zu verweigern, `canLoad` hingegen verhindert sogar das Laden des Moduls und dessen Kinder anstatt nur den Zugriff. Dies sollte speziell im Fall von LazyLoaded Seiten verwendet werden. \(siehe `loadChildren` in den `routes` der Datei `app-routing.module.ts`\)

{% hint style="warning" %}
Wichtig: Wenn wir Auth Guards verwenden wird die Applikation nur Clientseitig im Browser geschützt. Er wird strengstens empfohlen die verwendeten Daten auf dem Server resp. den API-Endpunkt ebenfalls zusätzlich vor unerwünschten Zugriffen und Diebstahl zu schützen. Mehr dazu auch am Tag 5 im Kapitel Security.
{% endhint %}

In diesem Kapitel schauen wir uns zuerst das Login an, später am heutigen Tag kommt dann noch das Tutorial dazu. 

![Capture](https://everythingfullstack.files.wordpress.com/2017/04/capture.jpg?w=700)

## Service

Um die Logik rund um das Login etwas zu entkoppeln und unser wachsendes Projekt sauber zu halten, erstellen wir einen Service. Verwende hier wiederum die Ionic CLI:

```text
ionic generate service _core/Auth
```

Die soeben generierten Datei `auth.service.ts` im Ordner `_core` soll alles rund ums Login beinhalten. Hier ein mögliches Grundgerüst für einen `AuthService`, später sollen die mit `// TODO` markierten Stellen noch gefüllt werden.

{% tabs %}
{% tab title="Auth Services" %}
{% code title="auth.service.ts" %}
```typescript
import { Injectable } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/auth';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private afAuth: AngularFireAuth) { }

  async loginWithEmailAndPassword (user: User) {
    // TODO: Login für Benutzer ausprogrammieren
  }

  async createUserWithEmailAndPassword (user: User) {
   // TODO: Registrierung für den Benutzer ausprogrammieren
  }
  
  logout() {
    // TODO: User ausloggen
  }
}
export interface User {
    email: string;
    password: string;
    displayname: string;
  }
```
{% endcode %}
{% endtab %}
{% endtabs %}

### 

### Mit `AngularFireAuthGuard` unsere Routes schützen

Seit Herbst 2019 bietet `@angular/fire` die `AngularFireAuthGuard` an, die uns die Komplexität rund um den Authentisierungsstatus mit Oberservables abnimmt, so dass wir fürs Login nicht noch eine eigene Guard schreiben müssen.  

Für die neue Variante mit [AngularFireAuthGuards](https://github.com/angular/angularfire/blob/master/docs/auth/router-guards.md) muss  folgender Import im `app.module.ts` gemacht werden, damit man `AngularFireAuthGuardModule` weiter unten in die `imports` hinzugefügt kann:

```typescript
import { AngularFireAuthGuardModule } from '@angular/fire/auth-guard';
```

Gut nun sind wir Startklar, was uns jetzt noch fehlt ist, dass wir die gewünschten Routes in unserem `app-routing.module.ts` mit einer `AngularFireAuthGuard` schützen.   
  
Dabei gehen wir wie folgt vor:

1. Einmalig: Neue Imports hinzufügen \(Zeile 5\)
2. Einmalig: Zwei neue Variable definieren um das Standardverhalten festzulegen \(Zeile 8+9\)
   1. `redirectUnauthorizedToLogin` = Wohin wird der User geleitet wenn er nicht eingeloggt ist
   2. `redirectLoggedInToRoot` = Wohin wird der User geleitet wenn er eingeloggt ist
3. Pro Route: Den zu schützenden Routes zwei weiteres Properties `canActivate` und `data` hinzufügen \( Zeile 21 + 21, Zeile 27+28, usw.\)

{% tabs %}
{% tab title="AppRouting mit AngularFireAuthGuard" %}
{% code title="app-routing.module.ts" %}
```javascript
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LogoutComponent } from './logout/logout.page';
// Neue imports hinzufügen
import { AngularFireAuthGuard, redirectUnauthorizedTo, redirectLoggedInTo } from '@angular/fire/auth-guard';

// Standardverhalten festlegen
const redirectUnauthorizedToLogin = () => redirectUnauthorizedTo(['login']);
const redirectLoggedInToRoot = () => redirectLoggedInTo(['']);


const routes: Routes = [
  {
    path: "",
    redirectTo: "home",
    pathMatch: "full"
  },
  {
    path: "home",
    loadChildren: "./home/home.module#HomePageModule",
    canActivate: [AngularFireAuthGuard],
    data: { authGuardPipe: redirectUnauthorizedToLogin }
  },
  {
    path: "list",
    loadChildren: "./list/list.module#ListPageModule",
    canActivate: [AngularFireAuthGuard],
    data: { authGuardPipe: redirectUnauthorizedToLogin }
  },
  { path: "login", 
    loadChildren: "./login/login.module#LoginPageModule", 
    canActivate: [AngularFireAuthGuard],
    data: { authGuardPipe: redirectLoggedInToRoot }
  },
  {
    path: "register",
    loadChildren: "./register/register.module#RegisterPageModule"
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
```
{% endcode %}
{% endtab %}
{% endtabs %}

## Übung Login

![](../.gitbook/assets/ralph_uebung.png)

Wir möchten nun für deine App-Idee aus Use-Case 1 ein einfaches Login inkl. Registrierung einbauen. Gehe dazu wie folgt vor: 

1. Lies die Doku oben nochmals gut durch. 

2. Füge AngularFire nach der Anleitung in dein Projekt ein. Wir verwenden für diese Übung alle die selben Firebase-Daten: `m335-login` 

3. Schau dir folgendes HowTo-Video Schritt für Schritt an. Pausiere zwischendurch, denn er spricht schnell und tippt noch viel schneller. Baue dir dein eigenes Login inkl. Registrierung in deine App-Idee.

{% hint style="warning" %}
Dieses Video wurde mit Ionic 3 erstellt. Solltest du Probleme in Ionic 4 damit haben, frage in deiner Gruppe nach resp. wende dich an deinen Kursleiter.
{% endhint %}

{% embed url="https://www.youtube.com/watch?v=aNW444SpFNs" caption="" %}

**Video für Ionic 4**

{% embed url="https://www.youtube.com/watch?v=Q8zcieAWn3g" %}



1. Zusatz: Füge ein Logout in deine App ein.
2. Zusatz: Gib dem User die Möglichkeit mehr über sich im Profil zu speichern. Z.B. Geburtsdatum, Adresse, Wohnort, usw.
3. Zusatz: Hat der Benutzer sein Passwort vergessen? Er soll eine Möglichkeit haben sich ein neues zuzusenden.
4. Zusatz: Gib dem Benutzer ein Gesicht. Es soll ein Profilbild hinterlegt sein. Evtl. kannst du hier mit Gravatar arbeiten.

