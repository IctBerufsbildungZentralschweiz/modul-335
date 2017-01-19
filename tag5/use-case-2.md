# Use Case 2
![](/_allgemein/ralph_uebung.png)
## Ausgangslage
Wer geht schon nicht gerne in die Ferien? Ich natürlich auch, daher möchte eine einfache Ferien App von dir als Entwickler programmiert haben. Die entsprechende Screens solltest du auf Papier erhalten haben. Ich bin gespannt auf dein Ergebnis. 

#### App-ID aus Ionic Auth
 
```
1ff587b6

```
#### Farbtabelle 
Die folgenden Farbcodes sollen in der App verwendet werden. 
```
Blau:        #3939D9
Violett:     #2B0B2F

```
#### Einstellungen Firebase 
```js
apiKey: "AIzaSyDMfTpxjOIslKfKCxKjh0dg47up1jpOIKY",
authDomain: "m335-usecase2.firebaseapp.com",
databaseURL: "https://m335-usecase2.firebaseio.com",
storageBucket: "m335-usecase2.appspot.com",
messagingSenderId: "327137245327"
```

## Detailbeschreibung
#### Allgemein / Styling
* Die App soll nach den Farben in der Farbtabelle, resp. nach dem Prototyp gestylt sein.
* Für die Daten werden die dazugehörigen Schnittstellen Auth resp. Firebase verwendet. Login-Daten sind oben zu entnehmen.

#### Navigation
* Die App soll mit einem Side-Menu realisiert werden 
* Das Menu soll die im Prototyp ersichtlichen Menupunkte (Gallerie, Ferien) haben
* Der Benutzername des Benutzer soll im Menu angezeigt werden 
* Am unteren Ende des Menus soll ein Icon fürs Logout ersichtlich sein 
* Klickt ein Benutzer Logout, wird er ausgeloggt und zum Login gesendet 
* Das Sidemenu soll in den Farben wie im Screen erscheinen

#### Willkommen
* Die Willkommenseite soll nur beim ersten App-Start erscheinen. Verwende dazu Local-Storage. Sonst soll das Login kommen (falls nicht eingeloggt) 	
* Auf der Seite ist ein Titel "Willkommen zum UseCase2" ersichtlich (siehe Screen) 
* Klickt der Benutzer irgendwo hin, soll er zum Login gelangen

#### Login
* Das Login besteht aus Email / Passwort
* Der Login-Button soll am unteren Rand des Bildschirms erscheinen 
* Die Farbe des Login-Button soll wie abgebildet sein 
* Oberhalb des Login-Buttons gibt es einen Button zur Registration
* Gibt es ein Fehler beim Login, soll dieser mittels Error unterhalb des Formulars angezeigt werden

#### Registrierung
* Die Registration besteht aus Name / Email / Passwort
* Der Registrierungs-Button soll am unteren Rand des Bildschirms erscheinen 
* Die Farbe des Registrierungs-Button soll wie abgebildet sein 
* Oberhalb des Registrierungs-Buttons gibt es einen Button zurück zum Login
* Gibt es ein Fehler beim Login, soll dieser mittels Error unterhalb des Formulars angezeigt werden

#### Gallerie
* Die Gallerie zeigt Bilder an
* Die Bild-URL soll dabei von der DB geladen werden

#### Ferienorte
* In einer Liste werden alle in der Datenbank vorhanden Ferienorte mit Name angezeigt
* Ich kann ein über den "Plus"-Button in der Navigation einen neuen Ferienort hinzufügen
* Dabei wird ein IonicPopup verwendet
* Speichere ich den Datensatz wird dieser der Liste angehängt und persistiert


























