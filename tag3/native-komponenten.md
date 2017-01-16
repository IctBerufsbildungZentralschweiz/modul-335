# Native Komponenten

Heute verwendet praktisch jede App lokale Komponenten wie Kamera, Geolocation oder Kalender. Auch mit Ionic kann mittels Cordova auf diese Ressourcen zugegriffen werden. Drifty hat die Dokumentation bereits auf die neue Version umgeschrieben:

[https://ionicframework.com/docs/v2/native/](https://ionicframework.com/docs/v2/native/)

Weitere Beispiele resp. Anleitungen für Ionic 1 sind noch via Google zu finden...

## Lokale Entwicklungsumgebung

Die Geräteressourcen können natürlich nicht in Creator getestet werden, daher müssen wir für dieses Kapitel auf die lokale Entwicklungsumgebung wechseln.  
Eine aktuelle Anleitung zur Einrichtung ist wiederum bei Ionic zu finden:

[http://ionicframework.com/docs/guide/installation.html     
](http://ionicframework.com/docs/guide/installation.html)

### Voraussetzungen

* Windows: [Git Bash](https://git-for-windows.github.io/)
* OSX: Terminal
* [NodeJS](https://nodejs.org/en/) \(`node -v`\)
* NPM \(`npm -v`\)

Bevor das Ionic CLI installiert werden kann, müssen als Voraussetzung NodeJS, NPM, Cordova CLI und Git CLI vorhanden und eingerichtet sein.  
Sind alle Voraussetzungen erfüllt, kann es losgehen. Unter Windows wird jetzt eine neue Git-Bash oder unter OSX ein neues Terminal geöffnet. Nun folgt die Eingabe des Installationsbefehls \(Windows\):

```bash
npm install -g ionic
```

Unter Mac OSX und Linux-Betriebssystemen muss der Befehl mit root-Rechten ausgeführt werden, weshalb der Befehl wie folgt aussieht:

```bash
sudo npm install -g ionic
```

Nun sollte das Ionic CLI global auf dem Rechner verfügbar sein. Zur Kontrolle kann auch hier die installierte Version, wie bei dem Cordova CLI, durch einen Befehl in der Eingabeaufforderung überprüft werden:

```bash
ionic -v
```

\(Sollte nun die installierte Version ausgeben\)

Damit ist die Installation des CLI abgeschlossen und es kann mit dem Erstellen eines eigenen Ionic-Projekts begonnen werden.



## Export aus Ionic Creator

Es kann vorkommen, dass dir Ionic Creator nicht mehr genügt, deine Lizenz abläuft oder du Native Komponenten brauchen möchtest. Dann wir es höchste Zeit in den PRO-Modus zu wechseln - auf Ionic CLI. Dazu kannst du dein in Creator erstelltes Projekt exportieren und mit CLI weiterverwenden. Die folgende Anleitung wurde aus der [_Ionic Doku _](http://docs.usecreator.com/docs/zip-export-an-ionic-project) übersetzt und erklärt dir die wichtigsten Schritte:

**Wichtig:** 

Der Export deines Projekts als ZIP funktioniert nur einseitig. Es gibt aktuell keinen Weg dein Projekt wieder in Creator zu importieren.

#### 1. Exportiere deine ZIP-Datei

Klicke auf das Export-Icon am oberen, rechten Bildschirmrand in Creator und ein Export-Modal wird erscheinen:

![](https://files.readme.io/66d807c-Screen_Shot_2016-11-04_at_12.44.38_PM.png)

Klicke danach den grossen blauen Button "Download Project ZIP". Entzippe nun den Inhalt, wir werden die Dateien/Ordner im nächsten Schritt verschieben.

#### 2. Erstelle eine neues lokalen Ionic Projekt.

Es wird vorausgesetzt, dass du Ionic CLI installiert hast. Erstelle nun ein neues Projekt, indem du folgenden Befehl verwendest:

```bash
ionic start myapp
```

Gehe nun in den neu erstellten ```myapp``` Ordner, du wirst darin ein Verzeichnis namens ```www``` finden.

Lösche alles im Verzeichnis ```www``` und verschiebe die ausgepackten Dateien aus ZIP (Schritt 1) hier rein. Die Struktur sollte so aussehen:
https://files.readme.io/f169778-Screen_Shot_2016-11-04_at_12.58.15_PM.png

#### 3. Verschiebe dein SCSS Ordner
Verschiebe das Verzeichnis namens ```SCSS-MOVEME``` eine Eben hoch und benenne es in ```scss``` um. Der Verzeichnis sollte nun auf der gleichen Ebene wie```www```sein.

Nun führe den folgenden Befehl in deinem Ordner ```myapp```aus:

```bash
npm install 
```
Dies wird dir gulp.js und ein paar weitere Tasks wie gulp-sass, gulp-minify-css, usw. installieren.

Abschliessend füge in der Datei ionic.config.json folgendes JavaScript-Property hinzu:
```bash
"gulpStartupTasks": ["sass", "watch"]
```


#### 4. (optional) Installiere Cordova Plugins
Falls du Cordova Plugins verwenden möchtest, musst du diese in deinem lokalen Projekt noch installieren. Für jedes Plugin führe den Befehl aus:
```bash
ionic plugin add [cordova-plugin-name]
```

#### 5. Zeig deine App-Vorschau an
Du hast deine App nun erfolgreich exportiert und in ein lokales Projekt umgewandelt. Eine Vorschau deiner App zeigst du dir mit folgenden Befehl an:
```bash
ionic serve
```










