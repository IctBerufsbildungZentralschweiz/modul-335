# Eigene Guard erstellen (Tutorial)

### Eine eigene Guard erstellen

Eine eigene Guard, in unserem Fall für die Willkommens/Tutorial-Seite zu erstellen ist ziemlich einfach. Verwende dazu `generate guard` der Ionic CLI:

```bash
ionic generate guard _guards/tutorial
```

Diese Guard muss nun lediglich die Methode `canActivate` resp. `canLoad` implementieren, welche `true` oder `false` zurückgibt, sofern der Benutzer die Willkommensseite noch nicht besucht hat.

{% code title="tutorial.guard.ts" %}
```typescript
import { Injectable } from '@angular/core';
import { CanLoad, Router } from '@angular/router';
import { StorageService } from '../_services/storage.service';

@Injectable({
  providedIn: 'root'
})
export class TutorialGuard implements CanLoad {
  constructor(private storageService: StorageService, private router: Router) {}

  async canLoad(): Promise<boolean> {
     let tutorialVisited = await this.storageService.get('tutorialVisited').then(res => {
      if (tutorialVisited) {
        this.router.navigate(['/app', 'tabs', 'schedule']);
        return false;
      } else {
        return true;
      }
    });
  }
}


```
{% endcode %}

Wie du siehst, wird hier die Methode `authenticated` from `AuthService` verwendet, um zu prüfen ob der Benutzer eingeloggt ist. Sofern dies der fall ist senden wir `true` zurück, ansonsten geben wir `false` zurück und navigieren auf `/login` zurück. Wie wir den verwendeten `AuthService` erstellen, siehst du gleich.

Sobald wir die Methode `canLoad()` in unserer `TutorialGuard` erstellt haben, müssen wir `ATutorialGuard` noch in unserem `app.module.ts` unter `providers` einbinden:

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
import { TutorialGuard } from './_guards/tutorial.guard';


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
    TutorialGuard
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
```
{% endcode %}

So und nun müssen wir zuletzt unser `app.routing-module.ts` noch anpassen, indem wir die `TutorialGuard` mit `canLoad` zu der gewünschten Route hinzufügen:&#x20;

{% code title="app.routing-module.ts" %}
```javascript
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TutorialGuard } from './_guards/tutorial.guard';

const routes: Routes = [
  {
    path: '',
    redirectTo: '/tutorial',
    pathMatch: 'full'
  },
  // More routes ... 
  {
    path: 'tutorial',
    loadChildren: () => import('./pages/tutorial/tutorial.module').then(m => m.TutorialModule),
    canLoad: [TutorialGuard]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
```
{% endcode %}



