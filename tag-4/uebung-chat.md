# Übung: Chat

![](../.gitbook/assets/ralph\_uebung.png)

Wir werden nun einen kleinen Chat schreiben. Er soll am Ende dieser Übung in etwa so aussehen:\
&#x20;<img src="../.gitbook/assets/image (4).png" alt="" data-size="original">

## Vorbereitung

1. Du nimmst wiederum deine Übung von Tag 1 "GX\_NachnameVorname\_Übung" und erstellst dort mit dem Generator eine neue Seite "Chat".
2.  Nun fügst du deiner `environment.ts` Datei ein neues Property `m335GroupNumber` mit deiner Gruppennummer des ÜKs hinzu.\


    ```typescript
    export const environment = {
        production: false,
        m335GroupNumber: 0 ,
    };
    ```

    \==> Beispiel: Gruppe 1:  `m335GroupNumber: 1`
3.  Füge nun Firebase zu deinem Projekt hinzu. Im Kapitel [google-firebase.md](google-firebase.md "mention") findest du die komplette Anleitung. Kurz zusammengefasst:\
    \- `npm install @angular/fire firebase --save`\
    \- Imports im `app.module.ts` hinzufügen \
    \- environments.ts anpassen\
    \
    Wir setzen auf eine gemeinsame Firebase-Konfiguration für diese Chat-Übung. Kopiere folgenden Inhalt in dein `src/environments/environment.ts` \
    ``

    ```typescript
     export const environment = {
      production: false,
      m335GroupNumber: 0,
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
4. Füge der `ion-toolbar` wiederum ein Menu-Button hinzu und färbe die Navigationsleiste in `danger` um.&#x20;
5.  Mit dem Styling helfen wir dir etwas. Kopiere folgenden SCSS-Code in dein Projekt:

    {% code title="chat-page.scss" %}
    ```scss
    ion-item {
        display: flex;
    }
    ion-list {
        --ion-item-background: transparent;
    }

    ion-avatar {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .message-list {
        height: 100%;
        .my-message {
            justify-content: flex-end;
            .message-bubble {
                background: var(--ion-color-primary);
                .my-message-text {
                    color: white;
                }
            }
        }
        .other-message {
            padding-left: 10px;
        }

        .message-bubble {
            background: var(--ion-color-light);
            border-radius: 16px;
            padding: 8px;
            box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
        }

        .message-date {
            font-size: 10px;
            color: var(--ion-color-medium);
        }
    }

    .chat-message-input {
        padding-left: 8px;
    }
    ```
    {% endcode %}
6. Versuche nun als nächsten den soeben kopierten Code zu verstehen. Schon gesehen dass du mit `var(...)` auch hier im SCSS auf die Ionic-Farben zugreifen kannst?
7.  Wir helfen dir nochmals, ersetze dein `ion-content` mit folgendem Code. Versuch auch hier zu verstehen was du kopierst.  Deine Todo's sind mit `/* TODO */` markiert. Es gibt einige neue Dinge, wie z.B.\
    \- [ng-container](https://angular.io/api/core/ng-container)\
    \- [ng-template](https://angular.io/api/core/ng-template)

    {% code title="chat.page.html" lineNumbers="true" %}
    ```html
    <ion-content class="message-list">
        <ion-list>
            <ng-container *ngFor="">
                <ng-container
                    *ngIf="isMyMessage('/* TODO */'); else isForeignMessage"
                >
                    <ion-item class="my-message ion-no-padding" lines="none">
                        <ion-label class="message-bubble" slot="end">
                            <p
                                class="my-message-text"
                                [style.max-width]="getMessageBubbleWidth('/* TODO */')"
                            >
                                <!--  {{ /* TODO */ }} -->
                            </p>
                            <div class="message-date">
                                <!-- {{ /* TODO */.toDate() | date:
                                'dd.MM.yyyy HH:mm' }}-->
                            </div>
                        </ion-label>
                    </ion-item>
                </ng-container>
                <ng-template #isForeignMessage>
                    <ion-item lines="none" class="other-message ion-no-padding">
                        <ion-avatar slot="start">
                            <!-- <ion-img [src]="/* TODO */"></ion-img>-->
                        </ion-avatar>
                        <ion-label class="message-bubble ion-text-wrap">
                            <h5 [style.color]="stringToColor('/* TODO */')">
                                <!-- {{ /* TODO */}}-->
                            </h5>
                            <p
                                [style.max-width]="getMessageBubbleWidth('/* TODO */')"
                            >
                                <!--  {{ /* TODO */}}-->
                            </p>
                            <div class="message-date">
                                <!--  {{ /* TODO */.toDate() | date: 'dd.MM.yyyy HH:mm'}}-->
                            </div>
                        </ion-label>
                    </ion-item>
                </ng-template>
            </ng-container>
        </ion-list>
    </ion-content>
    ```
    {% endcode %}
8.  Füge nun unterhalb des `ion-content`  ein Footer ein:

    {% code title="chat.page.html" %}
    ```html
    <ion-footer>
        <form >
            <ion-toolbar>
                <ion-textarea
                    type="text"
                    name="message"
                    class="chat-message-input"
                >
                </ion-textarea>

                <ion-button
                    type="submit"
                >
                </ion-button>
            </ion-toolbar>
        </form>
    </ion-footer>

    ```
    {% endcode %}
9.  Kopieren folgenden TS-Code in dein Projekt:

    {% code title="chat.page.ts" lineNumbers="true" %}
    ```typescript
    import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
    import { IonContent } from '@ionic/angular';
    import {
        AngularFirestore,
        AngularFirestoreCollection,
    } from '@angular/fire/compat/firestore';
    import { FormControl, FormGroup, Validators } from '@angular/forms';
    import { AlertController } from '@ionic/angular';
    import { Timestamp } from '@firebase/firestore-types';
    import { Observable } from 'rxjs';
    import { ChatMessage } from '../_types/chatmessage.types';
    import { environment } from 'src/environments/environment';

    @Component({
        selector: 'app-chat',
        templateUrl: './chat.page.html',
        styleUrls: ['./chat.page.scss'],
    })
    export class ChatPage implements OnInit {
        @ViewChild(IonContent) ionContent: IonContent;
        chatForm: FormGroup;
        showSpinnerIcon: boolean = false;
        showDates: boolean = false;
        chatMessages$: Observable<ChatMessage[]>;

        /* TODO: Bitte anpassen */
        currentAuthor: string = '/* TODO */'; // Bsp. Ralph
        currentAuthorAvatarImageUrl: string =
            '/* TODO */'; // Bsp. https://www.w3schools.com/howto/img_avatar.png

        constructor(
            private afs: Firestore,
            private alertCtrl: AlertController
        ) {
            /* TODO: Daten von Firebase holen */


        }

        ngOnInit() {
            /* TODO: Formularfelder definieren */
            this.chatForm = new FormGroup({

            });
        }

        isMyMessage(chatMessageAuthor: string): boolean {
            /* TODO: Vergleich ob chatMessage-Author der aktuelle Author */
            return true
        }

        sendMessage() {
            if (this.chatForm.get('message').value != '') {
                    /* TODO: Spinner einschalten */

                    /* TODO: Mit der add(...) Methode 
                       eine Nachricht auf der ChatMessage-Referenz schreiben */
                
                    /* TODO: Formular zurücksetzen */
            }
        }
       

        /* Zusatzaufgabe */
        swipeEvent(swipe: any) {
            // 2  = Right to left swipe
            // 4  = Left to right swipe
            if (swipe.direction == 2 || swipe.direction == 4) {
                this.showDates = !this.showDates; // Toggle
            }
        }

        async updateMessage(id: string, updatedText: string) {
            /* TODO: ChatMessage updaten */

        }

        async deleteMessage(id: string) {
             /* TODO: ChatMessage löschen */
        }

        /* Hilfestellungen */
        ngAfterViewChecked() {
            this.scrollContent('bottom'); // Scrollt ans Ende
        }

        scrollContent(scroll: any) {
            if (scroll === 'top') {
                this.ionContent?.scrollToTop(300);
            } else if (scroll === 'bottom') {
                this.ionContent?.scrollToBottom(300);
            }
        }

        stringToColor(inputString: string) {
            if (inputString) {
                let hash = 0;
                for (let i = 0; i < inputString.length; i++) {
                    hash = inputString.charCodeAt(i) + ((hash << 5) - hash);
                }
                let color = '#';
                for (let i = 0; i < 3; i++) {
                    let value = (hash >> (i * 8)) & 0xff;
                    color += ('00' + value.toString(16)).substr(-2);
                }
                return color;
            } else {
                return '#000000';
            }
        }

        getMessageBubbleWidth(text: string): string {
            const maxWidth = 300;
            const minWidth = 50;
            const measureElement = document.createElement('span');
            measureElement.style.visibility = 'hidden';
            measureElement.style.whiteSpace = 'pre';
            measureElement.innerText = text;
            document.body.appendChild(measureElement);
            const width = Math.max(measureElement.offsetWidth, minWidth);
            document.body.removeChild(measureElement);
            return Math.min(width, maxWidth) + 'px';
        }
    }

    ```
    {% endcode %}

    \
    Auch hier sind die `TODO`'s im Code markiert. Wir gehen in den Aufgaben aber schrittweise an den Chat heran.
10. Erstelle zuerst ein neuen Ordner `src/app/_types`  und füge anschliessend eine neue Datei `chatmessage.types.ts` mit folgendem Inhalt ein:\


    {% code title="chatmessage.types.ts" %}
    ```typescript
    import { Timestamp } from '@firebase/firestore-types';

    export interface ChatMessage {
        id?: string;
        groupNumber: number;
        author: string;
        text: string;
        dateCreated: Timestamp;
        avatarImageUrl?: string;
    }
    ```
    {% endcode %}

    Hier siehst du also schon mal, wie eine `ChatMessage` genau aussehen wird.

## Aufgaben

1. Als Erstes möchten wir die bereits vorhanden Chat-Messages deiner Gruppe anzeigen.  Passe den Author und dein Avatar-URL im `chat.page.ts` (Zeile 29 + 30) an.
2.  Die Datenstruktur in unserem gemeinsamen Google Firebase Projekt sieht folgendermassen aus:

    <figure><img src="../.gitbook/assets/image (1) (2).png" alt=""><figcaption></figcaption></figure>
3. Mach dich in der offiziellen Angularfire-Dokumentation schlau wie man mit einer Firestore Collection interagieren kann:\
   [https://github.com/angular/angularfire/blob/master/docs/firestore/collections.md](https://github.com/angular/angularfire/blob/master/docs/firestore/collections.md)
4.  Wir werden nun im `constructor` der `chatMessageCollection` eine Referenz auf die  Firebase Collection _chats_ zuweisen

    ```typescript
    this.chatMessages$ = collectionData(query(collection(this.afs, 'chats'),
      where('groupNumber', '==', environment.m335GroupNumber)
    , orderBy('dateCreated', 'asc')
    ), {
      idField: 'id',
    }).pipe(map(x => x as ChatMessage[]))
    ```

    Mit `where(...)` wird  in den _Values_ nach der Gruppennummer aus deinem `environments.ts` gefiltert und mit `orderBy(...)` nach dem Datum von `dateCreated` sortiert.\
    \
    🤙🏻 Solltest du hier Probleme haben, frage dein Pultnachbar oder den Instruktor\
    \
    \=> Die Antwort mappen wir noch zum vom Typ `ChatMessage[].` Als Best-Practice im Alltag hat sich etabliert, dass wir Observables mit einem **$** kennzeichnen, siehe `chatMessages$`
5. Das TS ist also bereit, nun ist es Zeit dass du mit `*ngFor` das Observable im HTML ausgibst. Wechsle nun ins `chat.page.html` und iteriere mit einer [Asynchronen-Pipe](https://angular.io/api/common/AsyncPipe) `| async`  über das Observable. Verwende dazu einen passenden Namen z.B. `chatMessage` &#x20;
6. Nun kannst du im HTML diverse TODO's sehr einfach lösen. Gibt dazu die Werte deiner soeben im `ngFor` deklarierten `chatMessage` an der richtigen Stelle aus. &#x20;
7. Es gibt eine Funktionen `isMyMessage(...), getMEssageBubbleWidth(...), stringToColor(...)` im HTML, welcher wir Daten  einer Chat-Message übergeben müssen. Studiere dazu die Funktionen im TS und übergib ihnen die passenden Werte.
8. Als letztes fehlt noch das schöne Avatar-Bild. Dem `src` des `ion-avatar'`s wollen wir nur die `avatarImageUrl` der `chatMessage` übergeben, wenn diese auch gesetzt ist. Sonst soll ein Fallback-Avatar-Bild angezeigt werden. Verwende dazu eine Angular-Binding (Tipp: Eckige Klammern und ein [Conditional-Operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Conditional\_Operator)&#x20;
9. Hast du alles richtig gemacht, sollte die Liste der Chat-Nachrichten schön formatiert erscheinen.  Sonst frag doch dein Pultnachbar um Hilfe, sollte es harzen ist dein Instruktor auch für dich da.&#x20;
10. Weiter gehts mit Senden einer Nachricht...
11. Erstelle ein `form`-Tag um die `ion-toolbar`. Zuerst im HTML indem du die `formGroup` und das `ngSubmit` mit dem TS verknüpfst. Anschliessend indem du die `ion-textarea` mit dem TS über `formControlName`. Du findest im `ngOnInit` die passende FormGroup dazu. Als Validatoren kannst du z.B. `required` und eine `minLength()` einsetzen.&#x20;
12. Füge deiner `ion-textarea` nun auch ein placeholder hinzu
13. Style nun den `ion-button` wie im Screen um. roter Farbe, am rechten Rand. Inhalt ist entweder ein Icon oder Spinner:

    ```html
    <ion-icon *ngIf="!showSpinnerIcon" name="send"> </ion-icon>
    <ion-spinner *ngIf="showSpinnerIcon" name="bubbles">
    ```
14. Der Button soll nur enabled sein, wenn das Formular valid ist
15. Als nächstes möchten wir noche ein ChatMessage schreiben können. Schau dir dazu die sendMessage(...) Funktion im TS an.
16. Es gibt diverse `/* TODO */` zu lösen. Eine neue Nachricht kann an firebase mittels `addDoc(..)` gesendet werden. Mehr verraten wir nicht, suche im Internet nach Beispielen wie du eine neue ChatMessage hinzufügen und den Spinner zur richtigen Zeit ein/ausblenden kannst.&#x20;
17. Wurde die Nachricht gespeichert, soll die `ion-textarea` zurückgesetzt werden.
18. Füge nun im HTML allen Orten mit Datum noch ein `*ngIf` hinzu, so dass das Datum nur angezeigt wird wenn `showDates`  wahr ist.

## Zusatzaufgaben



1. Datum : Das Datum wird normalerweise nicht angezeigt. Nun soll mittels Links- & Rechts-Swipe auf dem `ion-content` die Funktion `swipeEvent(...)` getriggert werden. Schau dir dazu zuerst die Funktion `swipeEvent(...)` im TS an.\
   Anschliessend kannst du mittels `swipeLeft` & `swipeRight` event die Funktion triggern. \
   ![](<../.gitbook/assets/image (2).png>)
2. Gott-Modus: Teil deinem Instruktor mit dass du hier angekommen bist. Er kann dir in seinen Musterlösung ein cooles Feature um die Funktionen `updateMessage(...)`, `deleteMessage(...)` zeigen.\
   Dazu gilt es wie folgt vorzugehen:\
   \- HTML erweitern (Input zum Bearbeiten + Trash-Icon) \
   \- Funktionen ausprogrammieren, Tipp: Intellisense bei `chatMessagesRef` anschauen \
   \- Logik beim Senden einer Nachricht einbauen, dass der Gott-Modus aktiviert/deaktivert werden kann.\
   ![](<../.gitbook/assets/image (12).png>)\
