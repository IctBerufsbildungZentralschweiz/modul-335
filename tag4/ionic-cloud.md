# Ionic: Cloud 
**(Im Januar 2019 heisst es bye bye Wolke)**

Ionic Cloud war ein hybrid-fokussiertes Mobiles Backend inkl. Services von Ionic. Es erlaubt einem Entwickler sehr einfach eine performante, produktive App aufzusetzen und zu skalieren.  

Die [Dokumentation für Ionic Cloud](http://docs.ionic.io/) war jeweils mit beiden Versionen Ionic 1 und 2 kompatibel und geschrieben .

## Services

Folgende Services waren darin enthalten und sind jetzt nicht mehr im neuen Produkt drin:
* [Auth](http://docs.ionic.io/services/auth/) eine Benutzerverwaltung inkl. Social Logins
* [Ionic DB](http://docs.ionic.io/services/database/) eine einfache Echzeit-Datenbank
* [Push](http://docs.ionic.io/services/push/)-Notifikationen über die Plattform an Benutzer senden

Ionic möchte sich auf die Entwicklung fokussieren und nicht anderen Cloud-Grössen wie Amazon, Google, Heroku, usw. Konkurrenz machen. 

---

# Ionic Pro
**(Ihr neues Flagschiff)**

Ionic Pro ist eine powervolle Sammlung von Services und Features, welche das Ionic Framework erweitert. Es bringt die App Entwicklung für Entwicklungsteams auf total neues Level.

Ionic Pro hat diverse Services, welche dich durch den gesamten App Lifecyle beschäftigen:

* **[Deploy](https://ionicframework.com/docs/pro/deploy/):** Spiele in Echzeit Remote-Updates deiner App ein, ohne über die Verzögerungen im App-Store.

* **[View](https://ionicframework.com/docs/pro/view/):** Teste dein App mit Testen und erhalten umgehend Feedback ohne komplizierte Geräte- & Profilverwaltung.

* **[Package](https://ionicframework.com/docs/pro/package/):** Builde App-Binaries in the Cloud für iOS und Android.

* **[Monitoring](https://ionicframework.com/docs/pro/monitoring/):** Fange Laufzeitfehler deiner App in Produktion ab und schliesse Sie auf deine Zeile Code zurück.

Alle diese Services basieren auf einem einfachen GIT-Workflow, welchem dir als Entwickler bekannt sein sollten.

## Du möchtest, resp. hast Ionic Pro bereits verwendet
Zu Beginn dieses Kurses habe wir dich darum gebeten einen Account auf folgender Website zu machen:
https://dashboard.ionicjs.com/apps 
Ja genau, bereits auf Ionic Pro. Zudem hast du sicher die DevApp auf deinem Gerät installiert, auch diese gehört bereits zur Ionic Pro Produktepalette.


---
# Google Firebase
Wir werden die kommenden Übungen mit [Google's Firebase](https://firebase.google.com/) als Backend as a Service absolvieren, schau dir dazu folgendes Video an:
{% youtube %} https://www.youtube.com/watch?v=O17OWyx08Cg {% endyoutube %}

## Wie füge ich Firebase deinem Projekt hinzu?
Um Firebase zu installieren, brauchen wir AngularFire2. Öffne dein Terminal, geh in den Projektordner und führe folgenden Befehl aus:
```bash
npm install angularfire2 firebase
```

Jetzt können wir Firebase initialisieren gehe dazu in die Datei `src/app/app.module.ts` und importiere alles was du von Firebase benötigst.
```js




``

You can open your app.module.ts and import everything we’ll be using, this is the only time you’ll see this file 🙂



## Clone unser Starter-Projekt




```js
  // M335-Auth: Firebase
  var config = {
    apiKey: "AIzaSyBM_MflQcqElJum8Mc6IGDBr5ruBeDSVKI",
    authDomain: "m335-auth.firebaseapp.com",
    databaseURL: "https://m335-auth.firebaseio.com",
    projectId: "m335-auth",
    storageBucket: "m335-auth.appspot.com",
    messagingSenderId: "535601451759"
  };
```


 
 


---

## Übung

![](/_allgemein/ralph_uebung.png)

1. Mach dich mit der Dokumention zu Ionic Cloud vertraut
2. Falls du noch keinen Account hast, erstell dir [Hier](https://apps.ionic.io/signup) einen
3. Erstell dir unter apps.ionic.io deine eigene App und benenn Sie nach deiner App-Idee aus Use Case 1, du sollst nun mit deiner Use-Case Idee arbeiten... 
4. Versuch nun mit Hilfe dieser  [Doku ](https://docs.ionic.io/services/auth/) ein einfaches Login inkl. Profil zu erstellen
   1. Benutzer sollen sich Registrieren können
   2. Benutzer sollen sich einloggen können und dann in die App kommen
   3. Der Inhalt der App soll nur angezeigt werden wenn ein Benutzer eingeloggt ist
   4. Ein Logout soll natürlich auch möglich sein. Erstelle dazu  ein Logout-Button in den Einstellungen oder im Menu.
   5. Unter Einstellungen soll der Benutzer sein Profil \(z.B. Name, Vorname\) ändern können
   6. Zusatz: Hat der Benutzer sein Passwort vergessen? Er soll eine Möglichkeit haben sich ein neues zuzusenden.
   7. Zusatz: Gib dem User die Möglichkeit mehr über sich im Profil zu speichern. Z.B. Geburtsdatum, Adresse, Wohnort, usw.
   8. Zusatz: Gib dem Benutzer ein Gesicht. Es soll ein Profilbild hinterlegt sein, evt. kannst du hier mit Gravatar arbeiten.



