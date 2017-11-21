# Modul 335 - OnBoarding

Herzliche Gratulation,

das du dich zu diesem ÜK angemeldet hast. Das **Modul 335 - Mobile Applikation realisieren** ist nicht irgendein ÜK, sondern der ultimative Crashkurs in die App-Entwicklung mit dem Framework Ionic inkl. AngularJS. Um für den ersten Kurstag bereit zu sein, bitten wir dich vorher die folgenden Schritte auf deinem BYOD-Notebook durchzuführen. Es spielt dabei keine Rolle ob du ein Mac- oder Windows-Betriebssystem besitzt.

## Terminal

Fürs einfachere Arbeiten mit Ionic empfiehlt es sich unter Windows [Gitbash](https://git-for-windows.github.io/) zu installieren. [Gitbash](https://git-for-windows.github.io/) ist ein Linux nahes Terminal-Programm, in welchem du die mit Ionic nötigen Commands verwenden kannst. Lade die Setup-Datei runter und installiere sie.

@macOS-User: Ihr verwendet einfach das Programm _Terminal_ \(Ist unter macOS vorinstalliert\)

## Node.js

Ionic basiert auf Node.js resp. dem Node Package Manager kurz npm. Geh dazu auf die Website [nodejs.org](https://nodejs.org/en/) und lade dir die letzte LTE-Version \(Download Button: Links\) runter. Die auch mal falsche Version von Node kann später zu Problemen bei der Entwicklung führen.

## Dein Editor/IDE nach Wahl

Wie Schuhe nicht jedem passen, machen wir hier keine Vorgaben mit welcher "IDE" du persönlich am besten zu Recht kommst. Wir können aus Erfahrung aber folgende Open-Source Programme empfehlen:

* [Atom](https://atom.io/)
* [Visual Studio Code](https://code.visualstudio.com/download)

Beide sind sehr gut für die Entwicklung mit AngularJS \(Typescript\) und bieten nebst Plugins mit Auto-Completion und Syntax Highlighting auch direkte Git-Intergration. Wirklich cool.

Lade dir eines \(oder beide\) runter und installiere Sie.

---

Okay, fürs Erste sollten wir die meisten Dinge installiert haben. Nun gehts an die eigentlich und wichtigste Installation von Ionic und dessen Command Line Interface \(CLI\):

# Account bei Ionic erstellen

Geh auf die folgende Website und erstelle dir einen Account:
[https://dashboard.ionicjs.com/signup](https://dashboard.ionicjs.com/signup)

Ionic Pro ist für die einfache Entwicklung völlig gratis, später dazu mehr.

> Tipp: Merke dir deine Login-Daten, du wirst Sie gleich wieder brauchen :\)

# Ionic CLI installieren

Öffne dein Terminal oder deine Gitbash und tippe:

```bash
npm install -g ionic cordova
```

Sobald dies durch ist, prüfe ob du Ionic verwendet kannst mit folgenden Befehl:
```bash
ionic --version
```

Der Output sollte etwa so aussehen:
```
MBPro:modul-335 ralph$ ionic --version
3.15.2
```

Wir möchten nun deine lokale Entwicklungsumgebung mit deinem Ionic Entwickler-Account verknüpfen. Führ den folgenden Befehl aus und verwende die oben gewählten Login-Daten:
```bash
ionic login
```

Bsp.
```
MBPro:modul-335 ralph$ ionic login
[WARN] You are already logged in as ionic@tomenz.ch! Prompting for new credentials.

? Email: max.muster@ilovetohaveaverylongdomain.ch

? Password: [hidden]
[OK] You are logged in!
```

Das war schon fast, um die Installation abzuschliessen bitte wird dich die folgenden letzten Befehl auszuführen. Beantworte die paar Fragen für uns:
```bash
bash <(curl -s -L https://enz.lu/m335-checkenvironment)
```

> Was passiert damit? Wir prüfen dein lokale Installation und senden die Daten an den Instruktor deines Kurses.


