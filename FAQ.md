# Frequently Asked Questions 

Hier findest du eine Sammlung der meist gestellten Fragen... ❓

---
#### Wie kann ich meine App debuggen?
Hast du auch einen weissen Bildschirm oder deine Styling sieht nicht wie gewünscht aus? Dann wird es Zeit deine App mittels Entwicklerconsole zu debuggen:

https://modul-335.enz.lu/tag1/ionic-archtiektur.html#wie-debugge-ich-meine-app

---
#### Wie kann ich ein Objekt zu einem Array hinzufügen? 
Dies kann mittels ```push``` erreicht werden:
```js
export class MyArrayPage {
  myArr: any[];
  constructor(public navCtrl: NavController {
      this.myArr.push({id: 1, name: "Zwei"});
  }
}
```

---
#### Wie kann ich ein Seperator im UI machen?
![](/_allgemein/seperator-example.png)

Verwende dazu mehrere ```<div>```'s und ein wenig CSS.

```html
<ion-content no-scroll no-padding>
        <ion-grid>
            <ion-row>
                <ion-col col-4>
                    <div class="separator"></div>
                </ion-col>
                <ion-col col-4 text-center>
                    ODER
                </ion-col>
                <ion-col col-4>
                    <div class="separator"></div>
                </ion-col>
            </ion-row>
        </ion-grid>
</ion-content>
```
```css
.separator {
    background: color($colors, primary);
    height: 2px;
    margin-bottom: 10px !important;
    margin-top: 10px !important;
}
```
---
#### Wie kann ich Werte zwischen einzelnen Pages mitgeben?
Oft generiert man sich dynamisch z.B. aus einer Datenbank eine Liste. Möchte man nun die Details eines Eintrags anzeigen und so auf eine Detail-Seite verweisen wird meist eine ID resp. das ganze Objekt mitgegeben. 
In Ionic funktioniert das mit sogenannten [Nav Params](https://ionicframework.com/docs/api/navigation/NavParams/).


