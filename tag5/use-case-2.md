# Use Case 2

![](/_allgemein/ralph_uebung.png)

## Ausgangslage

Wer geht schon nicht gerne in die Ferien? Ich natürlich auch, daher möchte eine einfache Ferien App von dir als Entwickler programmiert haben. Die entsprechende Screens solltest du auf Papier erhalten haben. Ich bin gespannt auf dein Ergebnis.

#### App-ID aus Ionic Auth ```ionic.cloud.init.js ```

```
1ff587b6
```

#### Farbtabelle

Die folgenden Farbcodes sollen in der App verwendet werden.

```
Blau:        #3939D9
Violett:     #2B0B2F
```

#### Einstellungen Firebase ```firebase.init.js ```

```js
apiKey: "AIzaSyDMfTpxjOIslKfKCxKjh0dg47up1jpOIKY",
authDomain: "m335-usecase2.firebaseapp.com",
databaseURL: "https://m335-usecase2.firebaseio.com",
storageBucket: "m335-usecase2.appspot.com",
messagingSenderId: "327137245327"
```

#### Struktur der Daten
```json
{
  "ferienorte" : {
    "-KapaxtCtq_Oy6jWFJea" : {
      "name" : "Ibiza"
    },
    "-KapayjfGFmD3LoKyJui" : {
      "name" : "Malediven"
    },
    "-KaqlRQ5tZNB0yubBUp0" : {
      "name" : "Cancun"
    },
    "-KatAx_GxTKmKAx4lOi9" : {
      "name" : "New York"
    }
  },
  "gallerie" : {
    "-KaqmAPFcaCRjI_Nm3AQ" : {
      "imgurl" : "http://vitalmag.eu/wp-content/uploads/2014/06/Ferienorte-in-Europa-vitalmag4.jpg"
    },
    "-KaqmBJ3TBEHJ106f0Mk" : {
      "imgurl" : "https://deavita.com/wp-content/uploads/2013/10/Exotische-Ferienorte-Fidschi-Pazifik-Laucala-Insel-Resort.jpeg"
    },
    "-KaqmCAXU-6dQi_YObc6" : {
      "imgurl" : "http://www.reise-informationen.net/cms/wp-content/uploads/2009/03/negril-strand.jpg"
    },
    "-KaqmD2Xtz6700fi0aNU" : {
      "imgurl" : "http://www.pustertal.net/images/gallery/pustertal/ferienregion/small/pragser-wildsee-pustertal.jpg"
    },
    "-Kar26HsKOhgip-SY4tq" : {
      "imgurl" : "http://www.savognin.ch/typo3temp/pics/bb-dorf-bivio2-2009_a6e92a647d.jpg"
    }
  }
}

```

## Detailbeschreibung

#### Allgemein / Styling

* Die App soll nach den Farben in der Farbtabelle, resp. nach dem Prototyp gestylt sein.
* Für die Daten werden die dazugehörigen Schnittstellen Auth resp. Firebase verwendet. Login-Daten sind oben zu entnehmen.

#### Navigation

* Die App soll mit einem Side-Menu realisiert werden 
* Das Menu soll die im Prototyp ersichtlichen Menupunkte \(Gallerie, Ferien\) haben
* Der Benutzername des Benutzer soll im Menu angezeigt werden 
* Am unteren Ende des Menus soll ein Icon fürs Logout ersichtlich sein 
* Klickt ein Benutzer Logout, wird er ausgeloggt und zum Login gesendet 
* Das Sidemenu soll in den Farben wie im Screen erscheinen

#### Willkommen

* Die Willkommenseite soll nur beim ersten App-Start erscheinen. Verwende dazu Local-Storage. Sonst soll das Login kommen \(falls nicht eingeloggt\)     
* Auf der Seite ist ein Titel "Willkommen zum UseCase2" ersichtlich \(siehe Screen\) 
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



