# Reactive Forms

In Angular gibt es grundsätzlich 2 Varianten wie man mit Formularen umgehen kann:

* **Reactive Forms:** Sind robuster, besser skalier- und testbar. Also deine Perfekte Wahl wenn du an mehreren Orten Formulare einsetzen möchtest 
* **Template-basierte Formulare:** eher für einfachere Apps \(Newsletter-Anmeldung oder einfache Registrierungen\) 

Auf den ersten Blick scheinen Reactive Forms etwas komplex, aber ihr werdet sehen, dass man hier relativ schnell sehr gute Erfolge erzielen kann:

## Hinzufügen: Aber wie richtig?

Um Reactive Forms in deiner App zu brauchen führst du folgende drei Schritte durch:

1. ReactiveFormsModule hinzufügen
2. In deiner Komponente eine FormGroup deklarieren
3. Mit deinem HTML-Template verknüpfen

Wir gehen Schritt für Schritt vor und werden hier als Beispiel ein einfaches Kontaktformular erstellen. Tipp:

### 1. ReactiveFormsModule hinzufügen

Wir fügen ReactiveFormsModule zu unseren Modulen pro Komponente hinzu.

{% hint style="warning" %}
Wichtig: Da die meisten Ionic Projekte mit Submodulen arbeiten, reicht es nicht ReactiveForms nur im `app.module.ts` hinzufügen. Das würde in unserem Fall zu folgendem Fehler führen:

`Can't bind to 'formGroup' since it isn't a known property of 'form'.`
{% endhint %}

Also fügen wir einfach folgende Zeile unserem `form-example.module.ts` hinzu:

```javascript
// ReactiveForms importieren 
import { ReactiveFormsModule } from '@angular/forms';
```

In unserem Beispiel sieht die Datei dann komplett so aus:

{% code title="form-example.module.ts" %}
```javascript
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
// Add ReactiveFormsModule to the imports
import { FormsModule, ReactiveFormsModule } from '@angular/forms'; 

import { IonicModule } from '@ionic/angular';
import { FormExamplePageRoutingModule } from './form-example-routing.module';
import { FormExamplePage } from './form-example.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    FormExamplePageRoutingModule,
    ReactiveFormsModule, // Add this line
  ],
  declarations: [FormExamplePage]
})
export class FormExamplePageModule {}
```
{% endcode %}

### 2. In deiner Komponente eine FormGroup deklarieren

In unser Komponente müssen wir nun zwei Dinge hinzufügen:

* **FormGroup:** Die Felder in unserem Kontaktformular werden in einer sogenannten FormGroup gruppiert. Natürlich könnten wir bei einem grossen Formular pro Seite auch mehrere Groups machen. Der Gruppe geben wir einen Namen `contactForm`
* **FormControl:** Jeder Input in unserem Kontaktformular wird zu einer FormControl gemappt. Hier können die klassischen Typen wie Input, Radio, Select usw. verwendet werden. Jedes FormControl Element enthält einen _value_ und _validation_ des Felds.   Wir fügen also im `ngOnInit` unserem `contactForm` nun mehrere Felder \(Nachname, Vorname, Email, Land + Nachricht\)  in form von FormControls hinzu.

Unser Code sieht somit wie folgt aus:

{% code title="form-example.page.ts" %}
```javascript
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';

@Component({
  selector: 'app-form-example',
  templateUrl: './form-example.page.html',
  styleUrls: ['./form-example.page.scss'],
})
export class FormExamplePage implements OnInit {

  // formGroup erstellen
  contactForm: FormGroup; 

  constructor() { }

  ngOnInit() {
    this.contactForm = new FormGroup({
      lastname: new FormControl(null),
      firstname: new FormControl(null),
      email: new FormControl(null)
    });
  }

  sendContactForm() {
    console.log("Do something fancy with the form...");
    console.log("Lastname: " + this.contactForm.get('lastname').value);
    console.log("Firstname: " + this.contactForm.get('firstname').value);
    console.log("Email: " + this.contactForm.get('email').value);
  }
}
```
{% endcode %}

### 3. HTML-Template verknüpfen

Nun müssen wir die erstellte FormGroup und deren Controls noch sauber mit unserem Template verknüpfen:

```javascript
<form [formGroup]="contactForm" (ngSubmit)="sendContactForm()">
```

* **formGroup:** Bindet das Formular an die von uns in der Komponente erstellte `contactForm` 
* **ngSubmit:** Fügt ein Event hinzu was beim absenden des Formular passieren soll, wir rufen hier unsere Methode sendContactForm\(\) auf.

Unser Template sollte also in etwa so aussehen:

{% code title="form-example.page.html" %}
```markup
<ion-header>
  <ion-toolbar>
    <ion-title>Contact us</ion-title>
  </ion-toolbar>
</ion-header>

<ion-content>
  <form [formGroup]="contactForm" (ngSubmit)="sendContactForm()">
    <ion-item>
      <ion-label position="floating">Lastname <ion-text color="danger">*</ion-text></ion-label>
      <ion-input required formControlName="lastname" type="text"></ion-input>
    </ion-item>
    <ion-item>
      <ion-label position="floating">Firstname <ion-text color="danger">*</ion-text></ion-label>
      <ion-input required formControlName="firstname" type="text"></ion-input>
    </ion-item>
    <ion-item>
      <ion-label position="floating">Email <ion-text color="danger">*</ion-text></ion-label>
      <ion-input required formControlName="email" type="email"></ion-input>
    </ion-item>
    <ion-button block color="primary" type="submit" [disabled]="contactForm.invalid">
      Send it!
    </ion-button>
  </form>
</ion-content>
```
{% endcode %}

Was hier noch zu sehen ist:

* Wir haben unsere Formular-Elemente mit `formControlName` mit den FormControls aus unsere Komponente verknüpft \(`lastname`, `firstname`, `email`\)
* Da die ion-input Elemente alle `required` sind wird der "Send it!"-Button erst aktiv werden wenn alles ausgefüllt wurde.  Im nächsten Kapitel siehst du jedoch das es noch mehr Möglichkeiten dazu gibt

## Validators: Lass uns Felder überprüfen

Meist reicht es nicht nur zu prüfen ob ein Feld ausgefüllt wurde. Was, wenn deine Benutzer ein komplexes Passwort wählen müssen oder du den Benutzernamen schon prüfen möchtest?  
Hierzu bietet uns Angular zusammen mit ReactiveForms sogenannte Validators an.  
Wir schauen uns die [wichtigsten Standardvalidatoren ](https://angular.io/api/forms/Validators) an:

* **minLength\(**_**n**_**\):** Hier kann eine minimale Länge angeben werden
* **maxLength**_**\(n**_**\):** Auch hier kann man die maximale Länge definieren
* **required:** Der Name sagt es ja schon
* **email:** Prüft ob die Eingabe dem Format einer Email-Adresse entspricht

Wir möchten nun in unserem Beispiel ein wenig anpassen:

* Email soll als email geprüft werden, ist aber nicht mehr Pflichtfeld
* Vorname & Nachname sollen jeweils mindestens 2 Zeichen sein und Pflicht bleiben

Dazu passen wir unsere FormControls in der Komponente wie folgt an:

{% code title="form-example.page.ts" %}
```javascript
...
// BEFORE:
    this.contactForm = new FormGroup({
      lastname: new FormControl(null),
      firstname: new FormControl(null),
      email: new FormControl(null)
    });

// AFTER:
    this.contactForm = new FormGroup({
      lastname: new FormControl('', [Validators.required,
      Validators.minLength(2)]),
      firstname: new FormControl('', [Validators.required,
      Validators.minLength(2)]),
      email: new FormControl('',  Validators.email)
    });
...
```
{% endcode %}

Und unser Template passen wir wie folgt an:

{% code title="form-example.page.html" %}
```markup
<ion-header>
  <ion-toolbar>
    <ion-title>Contact us</ion-title>
  </ion-toolbar>
</ion-header>

<ion-content>
  <form [formGroup]="contactForm" (ngSubmit)="sendContactForm()">
    <ion-item>
      <ion-label position="floating">Lastname <ion-text color="danger">*</ion-text></ion-label>
      <ion-input formControlName="lastname" type="text"></ion-input>
    </ion-item>
    <ion-item>
      <ion-label position="floating">Firstname <ion-text color="danger">*</ion-text></ion-label>
      <ion-input formControlName="firstname" type="text"></ion-input>
    </ion-item>
    <ion-item>
      <ion-label position="floating">Email </ion-label>
      <ion-input formControlName="email" type="email"></ion-input>
    </ion-item>
    <div class="formErrors">
      <ion-item color="danger" *ngIf="!contactForm.controls.lastname.valid && !contactForm.controls.lastname.pending && (contactForm.controls.lastname.dirty)">
        Sorry, that lastname is either to short or not yet provided!
      </ion-item>
      <ion-item color="danger" *ngIf="!contactForm.controls.firstname.valid && !contactForm.controls.firstname.pending && (contactForm.controls.firstname.dirty)">
        Sorry, that firstname is either to short or not yet provided!
      </ion-item>
      <ion-item color="danger" *ngIf="!contactForm.controls.email.valid && !contactForm.controls.email.pending && (contactForm.controls.email.dirty)">
        Sorry, that email is not correct!
      </ion-item>
    </div>
    <ion-button block color="primary" type="submit" [disabled]="contactForm.invalid">
      Send it!
    </ion-button>
  </form>
</ion-content>
```
{% endcode %}

Beispiel mit Fehler:

![](../.gitbook/assets/image%20%284%29.png)

Wie eingangs beschrieben könnte man hier beliebig viel selber validieren, das würde den Rahmen hier aber sprengen. Möchtest du mehr darüber erfahren, empfehle ich dir direkt die [Angular Form Validatoren Seite](https://angular.io/guide/form-validation).

## Weitere Dokumentationen

{% embed url="https://angular.io/guide/reactive-forms" caption="" %}

{% embed url="https://medium.com/@jinalshah999/reactive-forms-in-angular-a46af57c5f36" caption="" %}

## Übung

![](../.gitbook/assets/ralph_uebung.png)

1. Nimm dein am Tag 1 erstelltes  Projekt "GX\_NachnameVorname\_Übung" und erstelle darin eine neue Seite Namens "Newsletter" 
2. Ziel soll es sein, sich mit einer Email Adresse an einem Newsletter anmelden zu können. Die Validierung soll mit `Validators` und `ReactiveForms` realisiert werden. ![](../.gitbook/assets/image%20%286%29.png)
   1. Das Feld muss ein Pflichtfeld sein
   2. Das Feld muss eine gültige Email sein
   3. Mann kann sich erst anmelden wenn eine gültige Email eingegeben werden
3. Gibt es einen Fehler soll zwischen Input + Button ein Fehler angezeigt werden. 
4. BONUS I : Nach dem Absenden soll die Email in einer Toast-Nachricht angezeigt werden

