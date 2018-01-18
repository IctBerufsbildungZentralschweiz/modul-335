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
            <div class="messages" *ngFor="let chat of chats" [ngClass]="{other: chat.username == this.chatService.sheetsuAPI.currentUser}">
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

11. Um mit unserer Chat-API zu kommunizieren, brauchen wir einen Service. Erstelle in deinem Terminal einen neuen provider mit `ionic g provider ChatService` und füge darin folgenden Code ein, versuch ihn zu verstehen:

```js
import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions } from '@angular/http';
import 'rxjs/add/operator/map';

@Injectable()
export class ChatServiceProvider {

  public sheetsuAPI = {
    url: "https://sheetsu.com/apis/v1.0bu/6d08e3b8df99",
    apiKey: "13ekDLnGt7m3KyWhs9B1",
    apiSecret: "nrxTg4msyGqYeVzxJzsCUowvKvjGA4daF5RNFNxu",
    currentUser: "Max" // TODO: Namen anpassen
  }


  constructor(public http: Http) {
  }


  getChatList() {
    console.log("Getting chats from:" + this.sheetsuAPI.url);
    let headers = new Headers({ 'Authorization': 'Basic ' + btoa(this.sheetsuAPI.apiKey + ':' + this.sheetsuAPI.apiSecret) });
    let options = new RequestOptions({ headers: headers });

    return this.http.get(this.sheetsuAPI.url, options).map(res => res.json());
  }

  postChatMessage(message: any) {
    console.log("Posting message to:" + this.sheetsuAPI.url);
    let headers = new Headers({
      'Authorization': 'Basic ' + btoa(this.sheetsuAPI.apiKey + ':' + this.sheetsuAPI.apiSecret),
      'Content-Type': 'application/json'
    });
    let options = new RequestOptions({ headers: headers });
    let formattedDate = new Date().toLocaleString();
    let body = { 'username': this.sheetsuAPI.currentUser, 'text': message, 'date': formattedDate };

    return this.http.post(this.sheetsuAPI.url, body, options).map(res => res.json());
  }
}
``` 

12. Ändere im `chat-service.ts` auf Zeile 13 den Namen auf deinen eigenen.

13. Nun gehts ans eigentliche Programmieren, dein `chat.ts`. Wir stellen dir auch hier eine kleine Hilfe zur Verfügung:

```js
// chat.ts
import { Component,ViewChild,AfterViewChecked, ElementRef, OnInit } from '@angular/core';
import { IonicPage, NavController, NavParams, Content } from 'ionic-angular';
import { ChatServiceProvider } from '../../providers/chat-service/chat-service';
import { AlertController } from 'ionic-angular/components/alert/alert-controller';

@IonicPage()
@Component({
  selector: 'page-chat',
  templateUrl: 'chat.html',
})

export class ChatPage implements OnInit, AfterViewChecked{
  @ViewChild('scrollMe') private myScrollContainer: ElementRef;

  message: string;
  chats: any[];
  showSpinnerIcon: boolean = false;
  showDates: boolean = false;
 
  constructor(public navCtrl: NavController, private chatService: ChatServiceProvider, private alertCtrl: AlertController) {
    // TODO: Beim Laden der Seite sollen die Chats geladen werden

  }
  
  ngOnInit() { 
    this.scrollToBottom();

  }

  ngAfterViewChecked() {        
     this.scrollToBottom();        
  } 

  scrollToBottom(): void {
      try {
          this.myScrollContainer.nativeElement.scrollTop = this.myScrollContainer.nativeElement.scrollHeight;
      } catch(err) { }                 
  }
  swipeEvent(swipe) {
    // Mit swipe.direction erhälst du die Richtung in welcher der User in den Nachrichten gewischt hat
    // 2  = Swipe von Rechts nach Links
    // 4  = Swipe von Links nach Rechts
    
    // TODO: Sofern die Richtung Links oder Rechts ist, sollen die Daten angezeigt werden (schau im chat.html) nach was gesetzt werden muss.
  }

  loadChats() {
    this.chatService.getChatList().subscribe(
      data => {
          // TODO: In Data erhälst du ein JSON-Objekt mit deinen Daten zurück, sofern data nicht null ist soll es deinem Chat-Array zugewiesen werden
         
      },
      err => {
          console.error(err);
          // TODO: Übergib den error.status Code an die unten vergesehen Funktion. Testen kannst du es, indem du im chat-service.ts z.B. einen falschen API-Token wählst
      });
  }

  sendMessage(e) {
    // TODO: Prüfe ob eine Nachricht eingeben wurden, falls nicht sollen die Daten nicht gesendet werden. 

    this.showSpinnerIcon = true;
    
    this.chatService.postChatMessage(this.message).subscribe(
      data => {
        if(data) {

          // TODO: Füge das erhalten data Objekt deinem Array hinzu. Tipp: Such nach push in der Doku.

          // TODO: Dein Nachrichten-Input soll geleert werden     

          // TODO: Schalte den Spinner wieder ab.
        }
      },
      err => {
          console.error(err);
        // TODO: Hier nochmals. Übergib den error.status Code an die unten vergesehen Funktion. Testen kannst du es, indem du im chat-service.ts z.B. einen falschen API-Token wählst
      });
    
  }


  handleHTTPError(errorCode: number) {
    let errorMsg: string;
    switch(errorCode) {
      case 400: {
        errorMsg = "Fehler beim Einfügen/Ändern von Daten!";
        break;
      }
      case 401: {
        errorMsg = "Um die API zu brauchen musst man angemeldet sein!";
        break;
      }
      case 402: {
        errorMsg = "Oops, da hat wohl einer seine Rechnung bei Sheetsu nicht bezahlt!";
        break;
      }
      case 403: {
        errorMsg = "Diese Aktion wurde vom Sheets-Admin für diese API unterbunden";
        break;
      }
      case 429: {
        errorMsg = "Dein Quoata wurde aufgebraucht, versuche es später erneut.";
        break;
      }
      case 500: {
        errorMsg = "Ein unbekannter Server-Fehler ist aufgetreten.";
        break;
      }
      default: {
        errorMsg = "Ein unbekannter Fehler ist aufgetreten!";
        break; 
      }
    }
    
    // TODO: Zeig die errorMsg in einem Alert mit Titel "Error" und button "OK" an:

  }
}

``` 
## Zusatz


15. Zusatz: Füge in der Navigationsleiste (oben rechts) einen Button ein, um die Chats neu zu laden

16. Zusatz: Es dauert einen Moment bist die Chat-Liste beim Start geladen wird. Erstelle im HTML einen weiteren Spinner der das Laden der Daten anzeigt.

15. Zusatz: Integriere dein Firebase-Auth und verknüpfe den Benutzernamen im `chat-service.ts` mit der eingeloggten Person.
