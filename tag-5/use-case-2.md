# Use Case 2

![](../.gitbook/assets/ralph\_uebung.png)

## Ausgangslage

Wer geht schon nicht gerne in die Ferien? Ich natürlich auch, daher möchte ich eine einfache Ferien App von dir als Entwickler programmiert haben. Die entsprechenden Screens und das Starter-Projekt werden dir auf [https://kurse.ict-bz.ch](https://kurse.ict-bz.ch) zur Verfügung gestellt. Ich bin gespannt auf dein Ergebnis.

### Verbindungsparameter für Firebase `environment.ts`

{% code title="environment.ts" %}
```javascript
...
    firebaseConfig: {
     apiKey: "AIzaSyBgjvp1reruxeOQ4hlur94bJhAh0nV28Pg",
     authDomain: "m335-usecase-2.firebaseapp.com",
     databaseURL: "https://m335-usecase-2.firebaseio.com",
     projectId: "m335-usecase-2",
     storageBucket: "m335-usecase-2.appspot.com",
     messagingSenderId: "829173625908",
     appId: "1:829173625908:web:3b808b777a912d39d08661"
  }
...
```
{% endcode %}

### Struktur der Daten

<figure><img src="../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

### Empfehlung für Vorgehen:

1. Download ZIP (Student Starter Template) von https://kurse.ict-bz.ch&#x20;
2. Unzip der Datei (an einen sichere Ort mit genügend Speicherplatz)
3. IDE (VS Code) im gerade entpackten Ordner öffnen
4. Packages installieren mit: `npm install`
5. Ionic Serve starten mit: `ionic serve`
6. Verbindungsparameter von Google Firebase (siehe oben) ins `environments.ts` kopieren
7. Imports im `app.module.ts` (mit TODO: markiert) hinzufügen
8. Alle Aufgaben unten in der Detailbeschreibung lesen

## Detailbeschreibung

### Allgemein / Styling

* Die App soll nach dem Hi-Fi Protoypen gestylt werden, als Farben sind die Defaults zu verwenden
* Für die Daten werden die dazugehörige Firebase API verwendet. Login- & API-Daten sind oben zu entnehmen.
* Die Seiten sind im Template bereits erstellt, die Grundnavigation inkl. AngularFireAuthGuards fehlt jedoch im `app-routing.module.ts`&#x20;

### Navigation

* Das Menu soll die im Prototyp ersichtlichen Menüpunkte (Galerie, Ferienorte) haben
* Die Menüpunkte sollen die im Prototyp ersichtlichen Icons und Farben haben
* Der Titel im Menu soll "Use Case 2" stehen
* Am unteren Ende des Menus soll ein Button fürs Logout ersichtlich sein
* Klickt ein Benutzer Logout, wird er ausgeloggt und zum Login gesendet, verwende hier den `auth.service.ts`

### Willkommen

* Die Willkommensseite soll nur beim ersten App-Start erscheinen. Verwende dazu `Ionic Storage`. Sonst soll das Login kommen (falls nicht eingeloggt)    &#x20;
* Auf der Seite ist ein Titel "Willkommen zum UseCase2" ersichtlich, verwende hier ein Grid und `h2` Elemente
* Klickt der Benutzer irgendwo hin, soll er zum Login gelangen

### Login

* Für das Login soll `auth.service.ts` verwendet werden
* Das Login soll mit Email / Passwort und Firebase Auth realisiert werden
* Bei einem Klick auf den Login-Button wird überprüft ob etwas eingegeben wurde, nur dann wird ein Login versucht
* Bei einem Klick auf den "Account erstellen"-Button soll zur Registrierung-Seite navigiert werden
* Gibt es ein Fehler beim Login, soll dieser mittels `ToastController`  angezeigt werden

### Registrierung

* Die Registration soll `auth.service.ts` verwenden
* Die Registration soll mit Benutzername / Email / Passwort und Firebase Auth realisiert werden, alle Daten sollen gespeichert werden
* Bei einem Klick auf den Registrieren-Button wird überprüft ob etwas eingegeben wurde, nur dann wird ein Registration versucht
* Oberhalb des Registrierungs-Buttons gibt es einen Button "Zurück zum Login" mit entsprechender Aktion
* Gibt es ein Fehler beim Login, soll dieser mittels `ToastController`  angezeigt werden

### Galerie

* Die Galerie-Seite ist nach dem Login die Standardseite
* Die Galerie zeigt Bilder der Firestore Collection an
* Die Bild-URL soll dabei ebenfalls von der Collection geladen werden
* Die Bilder sollen in einem Grid dargestellt werden

### Ferienorte

* In einer Liste werden alle in der Firestore Collection vorhanden Ferienorte mit Name angezeigt
* Ich kann ein über den "Plus"-Button in der Navigation einen neuen Ferienort hinzufügen
* Dabei wird ein `AlertController` mit Inputfelder verwendet
* Speichere ich den Datensatz wird dieser der Liste angehängt und in Firebase persistiert

