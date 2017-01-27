# Frequently Asked Questions 

Hier findest du eine Sammlung der meist gestellten Fragen:


#### Wie kann ich in Creator eine globale Variablen definieren?

---
#### Wie kann ich ein Objekt zu einem Array hinzufügen? 
(PUSH)

---
#### Wo kann ich meine App in Creator debuggen?
```html
http://docs.usecreator.com/docs/route-parameters
```

#### Wie kann ich Abstände im UI machen?


---

#### Wie kann ich ein Seperator im UI machen?
![](/_allgemein/seperator-example.png)

Verwende dazu mehrere ```<div>```'s und ein wenig CSS.

```html
<ion-view title="SeperatorExample">
	<ion-content padding="true" class="has-header">
        <div class="row">
            <div class="col"><div class="separator"></div></div>
            <div class="col text-center">ODER</div>
            <div class="col"><div class="separator"></div></div>
        </div>
	</ion-content>
</ion-view>
```
```css
.separator {
    background: $positive;
    height: 2px;
    margin-bottom: 10px !important;
    margin-top: 10px !important;
}
```

---





---
#### Wie kann ich Werte zwischen einzelnen Pages mitgeben?
Oft generiert man sich dynamisch z.B. aus einer Datenbank eine Liste. Möchte man nun die Details eines Eintrags anzeigen und so auf eine Detail-Seite verweisen wird meist eine ID resp. das ganze Objekt mitgegeben. 
In Angular funktioniert das mit sogenannten [Route Parameters](http://docs.usecreator.com/docs/route-parameters).


