# Route Guards / Login

Wenn wir das Angular Routing verwenden, können wir mit sogenannten _Route_ _Guards_ Zugriff auf gewisse Routes \(z.B.`/meineliste`\) verhindern, sofern gewisse Konditionen zutreffen. Eines der bekanntesten Beispiele ist einem Benutzer keine Zugriff zu gewähren, sofern dieser nicht eingeloggt ist. Genau diesen Fall werden wir in den kommenden Kapitel zusammen erarbeiten.

## Route Guards

Die grundsätzliche Idee ist es unseren Routes einen Service anzuhängen, welcher als Route Guard für eine spezifische Route gilt. Dieser Service muss über eine `canActivate` resp. `canLoad` Methode verfügen, welche entweder `true` oder `false` zurück liefert. Wenn `true` zurückkommt wird dem Benutzer der Zugriff erlaubt, bei `false` wird er keinen Zugriff auf die Route erhalten.

`canActivate` wird verwendet um den Benutzer den Zugriff auf eine gewisse Route zu verweigern, `canLoad` hingegen verhindert sogar das Laden des Moduls und dessen Kinder anstatt nur den Zugriff. Dies sollte speziell im Fall von LazyLoaded Seiten verwendet werden. \(siehe `loadChildren` in den `routes` der Datei `app-routing.module.ts`\)

{% hint style="warning" %}
Wichtig: Wenn wir Auth Guards verwenden wird die Applikation nur clientseitig im Browser geschützt. Er wird strengstens empfohlen die verwendeten Daten auf dem Server resp. den API-Endpunkt ebenfalls zusätzlich vor unerwünschten Zugriffen und Diebstahl zu schützen.
{% endhint %}

### Eine Route Guard erstellen

{% hint style="danger" %}
WICHTIG:   
Seit Herbst 2019 bietet `@angular/fire` eine [eigene Router-Guard](https://github.com/angular/angularfire/blob/master/docs/auth/router-guards.md) an, die uns die Komplexität rund um den Authentisierungsstatus mit Oberservables abnimmt. Daher hilft zwar das folgende Kapitel noch fürs Verständnis, kann aber direkt gelöst werden.
{% endhint %}

Eine Route Guard, in unserem Fall für das Login, zu erstellen ist so einfach, wie einen Service zu erstellen. Verwende dazu `generate` der Ionic CLI:

```bash
ionic generate guard _core/Auth
```

Diese AuthGuard muss nun lediglich die Methode `canActivate` resp. `canLoad` implementieren, welche `true` oder `false` zurückgibt, sofern der Benutzer eingeloggt ist.

{% code title="auth.guard.ts" %}
```typescript
import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';


@Injectable()
export class AuthGuard implements CanActivate {
  constructor(private auth: AuthService, private router: Router) {}


  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean> | boolean {
      if (this.auth.authenticated) { return true; }

      console.log('access denied!')
      this.router.navigate(['/login']);
      return false


  }
}
```
{% endcode %}

Wie du siehst, wird hier die Methode `authenticated` from `AuthService` verwendet, um zu prüfen ob der Benutzer eingeloggt ist. Sofern dies der fall ist senden wir `true` zurück, ansonsten geben wir `false` zurück und navigieren auf `/login` zurück. Wie wir den verwendeten `AuthService` erstellen, siehst du gleich.

Sobald wir die Methoden in unserer `AuthGuard` erstellt haben, müssen wir `AuthGuard` noch in unserem `app.module.ts` unter `providers` einbinden:

{% code title="app.module.ts" %}
```typescript
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';

import { IonicModule, IonicRouteStrategy } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { AuthGuard } from './_core/auth.guard';


@NgModule({
  declarations: [AppComponent],
  entryComponents: [],
  imports: [
    BrowserModule,
    IonicModule.forRoot(),
    AppRoutingModule
  ],
  providers: [
    StatusBar,
    SplashScreen,
    { provide: RouteReuseStrategy, useClass: IonicRouteStrategy },
    AuthGuard
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
```
{% endcode %}



### Einen Service erstellen

Um die Logik rund um das Login etwas zu entkoppeln, erstellen wir einen Service, welchen wir oben bereits in der `AuthGuard` verwendet haben. Verwende hier wiederum die Ionic CLI:

```text
ionic generate service _core/Auth
```

In der soeben generierten Datei `auth.service.ts` im Ordner `_core` müssen wir nun zwingend die Methode `authenticated` ausprogrammieren. Hier ein mögliches Grundgerüst für einen `AuthService`, später sollen die mit `// TODO` markierten Stellen noch gefüllt werden.

{% tabs %}
{% tab title="NEU:  Service wenn mit AngularFire guards" %}
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

{% tab title="Wenn mit eigener Route-Guard" %}
{% code title="auth.service.ts" %}
```javascript
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
  get authenticated(): boolean {
    // Holt den Login-Status von FirebaseAuth und gibt true zurück wenn der Benutzer eingeloggt ist
    return this.afAuth.auth.currentUser !== null;
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

### Mit Guards unsere Routes schützen

Was nun noch fehlt ist, dass wir die gewünschten Routes in unserem `app-routing.module.ts` mit dem `AuthGuard` schützen. Füge dazu als weiteres Property `canActivated` zu den zu schützenden Routes hinzu:

{% tabs %}
{% tab title="NEU: AngularFire guards" %}
{% code title="app-routing.module.ts" %}
```javascript
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LogoutComponent } from './logout/logout.page';
// Neue imports hinzufügen
import { AngularFireAuthGuard, redirectUnauthorizedTo, redirectLoggedInTo } from '@angular/fire/auth-guard';

// Standartverhalten festlegen
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

{% tab title="Mit eigener Route-Guard" %}
{% code title="app-routing.module.ts" %}
```typescript
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from './_core/auth.guard';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'locations',
    pathMatch: 'full'
  },
  { path: 'login', 
    loadChildren: './login/login.module#LoginPageModule' 
  },
  { path: 'registrierung', 
    loadChildren: './registrierung/registrierung.module#RegistrierungPageModule' 
  },
  { path: 'locations', 
    loadChildren: './locations/locations.module#LocationsPageModule', 
    canActivate: [AuthGuard]
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

Für die neue Variante mit [AngularFire Routeguards](https://github.com/angular/angularfire/blob/master/docs/auth/router-guards.md) muss noch folgender Import im `app.module.ts` gemacht werden, damit man `AngularFireAuthGuardModule` weiter unten in die `imports` hinzugefügt kann:

```typescript
import { AngularFireAuthGuardModule } from '@angular/fire/auth-guard';
```

## Übung Login

![](../.gitbook/assets/ralph_uebung.png)

Wir möchten nun für deine App-Idee aus Use-Case 1 ein einfaches Login inkl. Registrierung einbauen. Gehe dazu wie folgt vor: 

1. Lies die Doku oben nochmals gut durch. 

2. Füge AngularFire nach der Anleitung in dein Projekt ein. Wir verwenden für diese Übung alle die selben Firebase-Daten: _m335-auth_ 

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

