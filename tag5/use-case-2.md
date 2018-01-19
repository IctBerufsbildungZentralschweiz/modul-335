# Use Case 2

![](/_allgemein/ralph_uebung.png)

## Ausgangslage

Wer geht schon nicht gerne in die Ferien? Ich natürlich auch, daher möchte ich eine einfache Ferien App von dir als Entwickler programmiert haben. Die entsprechende Screens und das Starter-Projekt liegen im [M335-Exchange](https://enz.lu/m335-exchange) für dich bereit. Ich bin gespannt auf dein Ergebnis.


#### Verbindungsparameter für Firebase Auth ```app.module.ts ```

```
apiKey: "AIzaSyDMfTpxjOIslKfKCxKjh0dg47up1jpOIKY",
authDomain: "m335-usecase2.firebaseapp.com",
databaseURL: "https://m335-usecase2.firebaseio.com",
projectId: "m335-usecase2",
storageBucket: "m335-usecase2.appspot.com",
messagingSenderId: "327137245327"
```

#### Verbindungsparameter für Sheetsu API ```api.ts ```
```
url: "https://sheetsu.com/apis/v1.0bu/71345d3e075a",
apiKey: "D4jusY6yW5LjJcprUshb",
apiSecret: "VzFZnWLaDaAsN41DURxxpFpjQVzy6hBebWRKJHsn"
```

#### Farbtabelle
Die folgenden Farbcodes sollen in der App verwendet werden.
```
Blau:        #3939D9
Violett:     #2B0B2F
Grau:        #CCCCCC
White:       #FFFFFF
```


#### Struktur der Daten
```json
Ferienorte:
- id
- name

Galerie:
- id
- imgurl
```

## Detailbeschreibung

#### Allgemein / Styling

* Die App soll nach den Farben in der Farbtabelle, resp. nach dem Prototyp gestylt sein.
* Für die Daten werden die dazugehörigen Schnittstellen Sheetsu resp. Firebase Auth verwendet. Login- & API-Daten sind oben zu entnehmen.

#### Navigation

* Das Menu soll die im Prototyp ersichtlichen Menupunkte \(Galerie, Ferienorte\) haben
* Der Benutzername des Benutzer soll im Menu angezeigt werden 
* Am unteren Ende des Menus soll ein Button fürs Logout ersichtlich sein 
* Klickt ein Benutzer Logout, wird er ausgeloggt und zum Login gesendet 
* Das Sidemenu soll in den Farben wie im Screen erscheinen

#### Willkommen

* Die Willkommenseite soll nur beim ersten App-Start erscheinen. Verwende dazu `Ionic Storage`. Sonst soll das Login kommen \(falls nicht eingeloggt\)     
* Auf der Seite ist ein Titel "Willkommen zum UseCase2" ersichtlich \(siehe Screen\) 
* Klickt der Benutzer irgendwo hin, soll er zum Login gelangen

#### Login

* Das Login besteht aus Email / Passwort
* Der Login-Button soll am unteren Rand des Bildschirms erscheinen 
* Die Farbe des Login-Button soll wie abgebildet sein 
* Oberhalb des Login-Buttons gibt es einen Button zur Registration
* Gibt es ein Fehler beim Login, soll dieser mittels `AlertController`  angezeigt werden

#### Registrierung

* Die Registration besteht aus Benutzername / Email / Passwort
* Der Registrierungs-Button soll am unteren Rand des Bildschirms erscheinen 
* Die Farbe des Registrierungs-Button soll wie abgebildet sein 
* Oberhalb des Registrierungs-Buttons gibt es einen Button zurück zum Login
* Gibt es ein Fehler beim Login, soll dieser mittels `AlertController`  angezeigt werden

#### Galerie

* Die Galerie zeigt Bilder an
* Die Bild-URL soll dabei von der Sheetsu-API geladen werden

#### Ferienorte

* In einer Liste werden alle in der Datenbank vorhanden Ferienorte mit Name angezeigt
* Ich kann ein über den "Plus"-Button in der Navigation einen neuen Ferienort hinzufügen
* Dabei wird ein `AlertController` verwendet
* Speichere ich den Datensatz wird dieser der Liste angehängt und an die API persistiert



