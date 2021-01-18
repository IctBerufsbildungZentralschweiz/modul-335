# Übung: Chat

![](../.gitbook/assets/ralph_uebung.png)

1. Wir werden nun einen kleinen Chat schreiben. Er soll am Ende dieser Übung in etwa so aussehen:  ![](../.gitbook/assets/chat.png)
2. Du nimmst wiederum deine Übung von Tag 1 "GX\_NachnameVorname\_Übung" und erstellst dort eine neue Seite "Chat".
3. Lass uns zuerst das Styling etwas vorantreiben. Hier ist unser SCSS-Code:

   ```css
   .chat-nachrichten {
       height: calc(100% - 60px);
       overflow: scroll;
       background-color: var(--ion-color-light-shade);
       span {
           background-color: var(--ion-color-success) !important;
           display: inline-block !important;
           color: var(--ion-color-dark) !important;
           padding: 10px !important;
           border-radius: 10px !important;
           text-align: left !important;
           max-width: 240px !important;
       }
   }
   .chat-eingabe {
       position: absolute;
       bottom: 0px;
       display: block;
       width: 100%;
       button {
           margin: 0px !important;
       }
       ion-spinner {
           width: 12px;
           height: 12px;
       }
       ion-spinner * {
           stroke: var(--ion-color-light);
           fill: white;
           margin: 0px !important;
       }
   }
   .messages {
       display: -webkit-box !important;
       display: -moz-box !important;
       display: -ms-flexbox !important;
       display: -webkit-flex !important;
       display: flex !important;
       -webkit-align-content: center !important;
       -ms-flex-line-pack: center !important;
       align-content: center !important;
       -webkit-box-align: center !important;
       -moz-box-align: center !important;
       -webkit-align-items: center !important;
       -ms-flex-align: center !important;
       align-items: center !important;
       margin-bottom: 5px !important;
       h3 {
           font-size: 12px;
           margin: 0px;
           padding-bottom: 10px;
       }
       p {
           margin: 0px;
       }
       .time {
           font-size: 10px;
           color: rgb(180, 179, 179);
       }
       .message {
           -webkit-box-flex: 1 !important;
           -moz-box-flex: 1 !important;
           -webkit-flex: 1 1 auto !important;
           -ms-flex: 1 1 auto !important;
           flex: 1 1 auto !important;
           padding: 5px !important;
           -webkit-transition: all 250ms ease-in-out !important;
           transition: all 250ms ease-in-out !important;
           overflow: hidden !important;
           text-align: left !important;
           -webkit-transform: translate3d(0, 0, 0) !important;
           -moz-transform: translate3d(0, 0, 0) !important;
           transform: translate3d(0, 0, 0) !important;
       }
   }
   .messages.other {
       .message {
           -webkit-transform: translate3d(0, 0, 0) !important;
           -moz-transform: translate3d(0, 0, 0) !important;
           transform: translate3d(0, 0, 0) !important;
           text-align: right !important;
       }
       span {
           color: var(--ion-color-light) !important;
           background: var(--ion-color-primary) !important;
       }
   }
   ```

4. Setze im HTML den `ion-content` so, dass er nicht scrollt und kein padding hat.
5. Ändere die Navigationsleiste so ab, dass sie eine Rote Farbe erhält.
6. Wir helfen dir nochmals, füge folgenden Code direkt innerhalb von `ion-content` ein. Versuch dabei den Code zu verstehen.

   ```markup
    <div #scrollMe class="chat-nachrichten" (swipe)="swipeEvent($event)">
           <ion-list>
               <div class="messages" [class.other]="chat.username === this.currentUser">
                   <div class="message">
                       <span>
                           <h3 *ngIf="chat.username" >{{chat.username}} </h3>                                                    
                           <p *ngIf="chat.text">{{chat.text}}</p>
                        </span>
                       <div class="time" *ngIf="showDates">{{chat.date}}</div>
                   </div>
               </div>
           </ion-list>
       </div>
   ```

7. Unterhalb dieses divs fügst du ein `form` mit der CSS-Klasse `chat-eingabe` darunter ein. Dieses Form wird unsere Eingabe sein.
8. Im `form` möchten wir mit einem `ion-grid` den Input und Button nebeneinander platzieren \(Tipp: `size="10"` / `size="2"` sehen nicht schlecht aus\).
9. Den Button möchten wir mit einem Icon lösen, dazu kannst du folgenden Code verwenden:

   ```markup
   <ion-icon *ngIf="!showSpinnerIcon" name="send"></ion-icon>
   <ion-spinner *ngIf="showSpinnerIcon" name="bubbles"></ion-spinner>
   ```

10. Nun musst du deinem Projekt `@angular/fire` und `firebase` hinzufügen
11. ```bash
    npm install @angular/fire firebase --save
    ```
12. Um mit unserer Firebase-Chat-API zu kommunizieren, benötigt es einige Änderungen im `app.module.ts`:   
13. Wir müssen die Angularfire2Module importieren:  

```javascript
       // AngularFire2 importieren
       import { AngularFireModule } from '@angular/fire';
       import { AngularFireDatabaseModule } from '@angular/fire/database';
       import { AngularFireAuthModule } from '@angular/fire/auth';
```

1. Wir setzen die Firebase-Konfiguration für diese Übung  



Kopiere folgenden Inhalt in dein src/environments/environment.ts :

{% code title="environment.ts" %}
```javascript
export const environment = {
  production: false,
  // Neu hinzufügen
  firebaseConfig: {
    apiKey: "AIzaSyDJgmwqHki4FjNxduVqkoYUQIp8G0QYyOo",
    authDomain: "m335-uebungen.firebaseapp.com",
    databaseURL: "https://m335-uebungen.firebaseio.com",
    projectId: "m335-uebungen",
    storageBucket: "m335-uebungen.appspot.com",
    messagingSenderId: "675049996439",
    appId: "1:675049996439:web:9b2aed3cfc2b9fabe669d2"
  }
};
```
{% endcode %}

1. Wir fügen die Angularfire in den `imports` hinzu:  

```javascript
        AngularFireModule.initializeApp(firebaseConfig),
        AngularFireDatabaseModule,
        AngularFireAuthModule
```

Hier die komplette Datei

{% code title="app.module.ts" %}
```javascript
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
import { AngularFireModule } from '@angular/fire';
import { AngularFireDatabaseModule } from '@angular/fire/database';
import { AngularFireAuthModule } from '@angular/fire/auth';
​
// Environments importieren
import { environment } from "../environments/environment";
​
@NgModule({
  declarations: [AppComponent],
  entryComponents: [],
  imports: [
    BrowserModule,
    IonicModule.forRoot(),
    AppRoutingModule,
    IonicStorageModule.forRoot(),
    AngularFireModule.initializeApp(environment.firebaseConfig),
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
```
{% endcode %}

1. Um nun die Daten zu laden müssen wir die _ChatPage_ anpassen. Hier eine Vorlage mit TODO's für dich:  

{% code title="chat.page.ts" %}
```javascript
import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { AlertController } from '@ionic/angular';
import { AngularFireDatabase, AngularFireList } from '@angular/fire/database';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-chat',
  templateUrl: './chat.page.html',
  styleUrls: ['./chat.page.scss'],
})
export class ChatPage implements OnInit {
  // TODO: In der Angular Doku nachlesen, was ViewChild macht und basierend auf deinem HTML XXXXX ersetzen 
  @ViewChild('XXXXX', {static: false}) messageInput;
  @ViewChild('XXXXX', {static: false}) private myScrollContainer: ElementRef;

  message: string;
  showSpinnerIcon = false;
  showDates = false;
  chatList: Observable<ChatMessage[]>;
  chatListRef: AngularFireList<ChatMessage>;
  // TODO: Passe deine Gruppennummer und deinen Namen an
  groupNumber = 'G0'; // Bsp. G1
  currentUser = 'Roomies Ralph'; // Bsp. Ralph

  constructor(private alertCtrl: AlertController, afDb: AngularFireDatabase) {
    this.chatListRef = afDb.list('/chats/' + this.groupNumber);
    this.chatList = this.chatListRef.valueChanges();
  }

  ngOnInit() {
    // TODO: An das Ende scrollen
  }

  ngAfterViewChecked() {
    // TODO: An das Ende scrollen
  }

  scrollToBottom(): void {
    try {
      this.myScrollContainer.nativeElement.scrollTop = this.myScrollContainer.nativeElement.scrollHeight;
    } catch (err) { }
  }
  swipeEvent(swipe) {
    // 2  = Right to left swipe
    // 4  = Left to right swipe
    if (swipe.direction === 2 || swipe.direction === 4) {
      // TODO: Datum ein resp. ausblenden
    }
  }
  sendMessage(e) {
    if (this.message !== '') {
      // TODO: Spinner anzeigen
      let formattedDate = new Date().toLocaleString();

      // TODO: Mittels push()) die Nachricht an Firebase senden 
      // gesendet muss werden: { username: <DEIN-USERNAME> , text: <NACHRICHT>, date: formattedDate }

      // TODO: Cleanup: Nachricht löschen und Spinner ausblenden
    }
  }
}
interface ChatMessage {
  username: string;
  text: string;
  date: any;
}
```
{% endcode %}

1. Spätestens jetzt möchten wir die Chatnachrichten noch ausgeben, studier den Code oben genau und gib mittels`*ngFor` die Nachrichten in deinem Template aus.  Wichtig: Da es sich bei der `chatList` um ein Observable handelt, musst du ein Pipe `| async` anhängen. Mehr Codebeispiele findest du auch [hier](https://github.com/angular/angularfire)

## Zusatz

1. Zusatz: Füge eine Funktion hinzu, dass wie bei WhatsApp die Namen der anderen Benutzern in einer anderen Farbe erscheinen. Tipp:  Schau dir `ngStyle` in der Angular Doku an.
2. Zusatz: Passe das Styling so an, dass das Datum rechts neben der Nachricht und nicht mehr unterhalb eingeblendet wird
3. Zusatz: Erweitere deine Chat-App um Nachrichten weiterleiten zu können

