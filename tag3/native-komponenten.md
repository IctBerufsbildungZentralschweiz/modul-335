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
npm install -g cordova
npm install -g ionic
```

Unter Mac OSX und Linux-Betriebssystemen muss der Befehl mit root-Rechten ausgeführt werden, weshalb der Befehl wie folgt aussieht:

```bash
sudo npm install -g cordova
sudo npm install -g ionic
```

Nun sollte das Ionic CLI global auf dem Rechner verfügbar sein. Zur Kontrolle kann auch hier die installierte Version, wie bei dem Cordova CLI, durch einen Befehl in der Eingabeaufforderung überprüft werden:

```bash
ionic -v
```

\(Sollte nun die installierte Version ausgeben\)

Damit ist die Installation des CLI abgeschlossen und es kann mit dem Erstellen eines eigenen Ionic-Projekts begonnen werden.






