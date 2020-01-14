# Angular: Navigation I

Bis und mit Ionic 3 war die Navigation über den sogenannten NavController möglich und basierte auf einem "Array von Seiten". Die Navigation erfolgt meistens über `push` und `pop` von Seiten und hinzufügen resp. entfernen in der History.

Mit Ionic 4 wird die Navigation neu über das [**Angular Routing**](https://angular.io/guide/router) gemacht. Angular Routing basiert mehr auf dem in der URL ersichtlichen Pfad \(z.B. `http://localhost:8100/home`\).  
In deiner Applikation findest du eine zentrale Datei um das Routing zu steuern:

{% code title="app-routing.module.ts" %}
```typescript
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginPage } from './login/login.page';
import { DetailPage } from './datail/datail.page';

const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'login', component: LoginPage },
  { path: 'home', loadChildren: './pages/home/home.module#HomeModule' },
  { path: 'about', loadChildren: './pages/about/about.module#AboutModule' },
  { path: 'detail/:id', component: DetailPage },
];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {

}
```
{% endcode %}

Was sehen wir hier:

* Wird kein Pfad aufgerufen, wird eine Weiterleitung/Redirect auf `/login` gemacht
* Die `LoginPage` wird als `component` direkt eingebunden
* `/home` und `/about` werden mittels Lazy Loading eingebunden \(mehr dazu weiter unten\)
* Nach der Route von `/detail` kann noch eine ID mitgegeben werden, so können wir z.B. Details in einer Liste anzeigen \(mehr dazu weiter unten\)
* Die definierten `routes` werden im `RouterModule forRoot()` registriert

## Was versteht man unter Lazy Loading mit Angular Routing in Ionic?

```typescript
const routes: Routes = [
  { path: 'login', loadChildren: './pages/login/login.module#LoginModule' },
  { path: 'home', loadChildren: './pages/home/home.module#HomeModule' },
  { path: 'detail/:id', loadChildren: './pages/detail/detail.module#DetailModule' },
  { path: '', redirectTo: '/login', pathMatch: 'full' },
];
```

Anstatt nun eine `component` für eine Route anzugeben, machen wir Gebrauch der `loadChildren`-Property. Da nun nicht alles zu Beginn geladen wird, sagen wir eigentlich _"geh in diese Datei und finde heraus welche Components du laden musst"_.  
Nehmen wir die `/home` Route als Beispiel. Der Router weiss das er die Datei `home.module.ts` öffnen muss und schaut nach `HomeModule` darin.

{% code title="home.module.ts" %}
```typescript
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';

import { HomePage } from './home.page';
import { HomePageRoutingModule } from './home-routing.module';

@NgModule({
  imports: [
    CommonModule,
    IonicModule,
    HomePageRoutingModule
  ],
  declarations: [HomePage],
  entryComponents: [],
  bootstrap: [HomePage],
})
export class HomeModule {}
```
{% endcode %}

In der Datei `home.module.ts` sehen wir, dass die Routes in einer separaten Datei gehalten werden, welche in etwa so aussehen wird:

{% code title="home-routing.module.ts" %}
```typescript
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomePage } from './home.page';
import { SomethingPage } from './something/something.page';

const routes: Routes = [
  { path: '', component: HomePage },
  { path: 'something', component: SomethingPage }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HomePageRoutingModule { }
```
{% endcode %}

Hier wird nun wiederum die Zuordnung auf die jeweiligen Komponenten `HomePage` und `SomethingPage` gemacht. Es können natürlich noch weitere `routes` definiert werden.

## Wie kann ich zu einer Seite resp. zurück navigieren?

Die Navigation ist basierend auf welcher URL wir gerade haben resp. welcher Route dazu passt. Wenn die URL gewechselt wird, ändert die aktuelle Seite. Aber wir haben einige weitere Optionen um zu navigieren:

Man kann mittels normalen Angular Router **href** verwenden um auf eine andere Seite zu navigieren:

```markup
<ion-item [href]="'/detail/' + item.id">
```

oder auch im Code:

```typescript
navigateToLogin() {
    this.router.navigateByUrl('/login');
}
```

```typescript
<ion-button (click)="navigateToLogin()">Login</ion-button>
```

## Wie übergebe ich Werte zwischen zwei Seiten?

Der Array, welcher der `navigate` Funktion als Parameter übergeben wird, akzeptiert die Parameter wie folgt:

```typescript
navigateToDetail() {
    this.router.navigate(['/detail', { id: itemId }]);
}
```

Die Daten sind in der `PersonDetail`-Seite nun über die `ActivatedRoute` mit über `paramMap`zu holen:

{% code title="person-detail.page.ts" %}
```typescript
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-person-detail',
  templateUrl: './person-detail.page.html',
  styleUrls: ['./person-detail.page.scss'],
})
export class PersonDetailPage implements OnInit {
  private personID: number;

  constructor(private route: ActivatedRoute) { }

  ngOnInit() {
    this.personID = this.route.snapshot.paramMap.get('id');
  }

}
```
{% endcode %}

Mehr dazu findest du auch in folgendem Tutorial:

{% embed url="https://www.joshmorony.com/implementing-a-master-detail-pattern-in-ionic-4-with-angular-routing/" caption="" %}

## Übung

![](../.gitbook/assets/ralph_uebung.png)

1. Nimm dein am Tag 1 erstelltes  Projekt "GX\_NachnameVorname\_Übung" und erstelle darin mit dem Generator zwei neue Seiten Namens "Navigation" und "NavigationDetail"
2. Füge die Seiten in deiner Seiten-Navigation mit einem passenden Ionicon-Icon hinzu. Tipp: Solltest du die Datei nicht finden, verwende die Suche deiner IDE.
3. Versuche nun in deiner Navigation-Seite einen Button zu erstellen und mittel **\[href\]** auf deine NavigationDetail-Seite zu navigieren.

