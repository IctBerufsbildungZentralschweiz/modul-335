# Übung - Chat

![](/_allgemein/ralph_uebung.png)

1. Wir werden nun einen kleinen Chat schreiben. Er soll am Ende dieser Übung in etwa so aussehen: 
![](/_allgemein/chat.png)

2. Du nimmst wiederum deine Übung von Tag 1 "GX\_NachnameVorname\_Übung" und erstellst dort eine neue Seite "Chat". 

3. Lass uns zuerst das Styling etwas vorantreiben. Hier ist unser SCSS-Code:  
```css
// chat.scss
   page-chat {
    .chat-nachrichten {
        height: calc(100% - 40px);
        overflow: scroll;
        background-color: color($colors, light);
        span {
            background-color: #C7C7CC !important;
            display: inline-block !important;
            color: color($colors, dark) !important;
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
        background-color: white;
        button {
            margin: 0px !important;
        }
        ion-spinner {
            width: 12px;
            height: 12px;
        }
        ion-spinner * {
            stroke: color($colors, light);
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
            color: color($colors, light) !important;
            background: color($colors, secondary) !important;
        }
    }
}
```

4. Setze im HTML  den `ion-content` so, dass er nicht scrollt und kein padding hat.

5. Ändere die Navigationsleiste so ab, dass sie eine Rote Farbe erhält.

6. Wir helfen dir nochmals, füge folgenden Code direkt unterhalb von `ion-content` ein. Versuch dabei den Code zu verstehen.
```html
    <div #scrollMe class="chat-nachrichten" (swipe)="swipeEvent($event)">
        <ion-list>
            <div class="messages" *ngFor="let chat of chats" [ngClass]="{other: chat.username == this.sheetsuAPI.currentUser}">
                <div class="message">
                    <span>
                        <h3 *ngIf="chat.username">{{chat.username}} </h3>                                                    
                        <p *ngIf="chat.text">{{chat.text}}</p>
                     </span>
                    <div class="time" *ngIf="showDates">{{chat.date}}</div>
                </div>
            </div>
        </ion-list>
    </div>
```

7. Unterhalb dieses divs fügst du ein `form` mit der CSS-Klasse `chat-eingabe` darunter ein. Dieses Form wird unsere Eingabe sein.

8. Im `form` möchten wir mit einem `ion-grid` den Input und Button nebeneinander platzieren (Tipp: `col-10` / `col-2` sehen sind nicht schlecht aus). 

9. Den Button möchten wir mit einem Icon lösen, dazu kannst du folgenden Code verwenden:
```html
<ion-icon *ngIf="!showSpinnerIcon" name="send"></ion-icon>
<ion-spinner *ngIf="showSpinnerIcon" name="bubbles"></ion-spinner>
```

10. Nun fügst du in dein `app.module.ts` folgende beide Zeilen ein und fügst Sie zu deinen imports unten hinzu:
```
import { HttpClientModule } from '@angular/common/http';
import { HttpModule } from '@angular/http'; 
``` 

11. Um mit unserer Chat-API zu kommunizieren, brauchen wir einen Service. Erstelle in deinem Terminal einen neuen provider mit `ionic g provider ChatService` und füge darin folgenden Code ein, versuch in zu verstehen:

12. Ändere im `chat-service.ts` auf Zeile 13 den Namen auf deinen eigenen.

13. Nun gehts ans eigentliche Programmieren, dein `chat.ts`. Wir stellen dir auch hier eine kleine Hilfe zur Verfügung:

14. Wir haben dir die weiteren Aufgaben direkt im Code mit _// TODO:_ gestellt.

15. Zusatz: Füge in der Navigationsleiste (oben rechts) einen Button ein, um die Chats neu zu laden

16. Zusatz: Es dauert eine Moment bist die Chat-Liste beim Start geladen wird. Erstelle im HTML einen weiteren Spinner der das Laden der Daten anzeigt.

15. Zusatz: Integriere dein Firebase-Auth und verknüpfe den Benutzername im `chat-service.ts` mit der eingeloggten Person.
