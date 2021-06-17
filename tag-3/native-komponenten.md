# Native Komponenten

Heute verwendet praktisch jede App lokale Komponenten wie Kamera, Geolocation oder Kalender. Auch mit Ionic kann man darauf zugreifen, dabei gibt es grundsätzlich zwei Möglichkeiten:

* Cordova Plugins mit grosser Community \(Eine Liste davon findest du [hier](https://ionicframework.com/docs/native)\)
* [Capacitor](https://capacitor.ionicframework.com/) - der nativen Bridge vom Ionic Team

## Capacitor

![](../.gitbook/assets/image%20%288%29.png)

{% embed url="https://capacitor.ionicframework.com/" %}

Capacitor ist die aus dem Hause Ionic eigens hergestellt Brücke zwischen Javascript und dem nativen Code von iOS und Android. Der Hauptvorteil dabei ist, Sie ist perfekt auf das Ionic Framework abgestimmt. Die Community ist sicher kleiner als bei den Cordova Plugins, weiter geht Ionic auch hier geht Ionic immer mehr ihrem Ecosystem nach.

### Vorbereitungen

Um Capacitor brauchen zu können müssen folgende Punkte erfüllt sein:

* [NodeJS](https://nodejs.org) ist installiert
* [Ionic CLI](https://ionicframework.com/docs/cli) ist installiert
* [Android Studio ](https://developer.android.com/studio)wurde runtergeladen und installiert
* \(optional für macOS-User\) Xcode ist installiert, wenn auf iOS deployed werden soll

### Starter Template verwenden

Um das Projektsetup zu vereinfachen haben wir dir hier ein Starter Template für Capacitor zur Verfügung gestellt:

```bash
git clone https://github.com/IctBerufsbildungZentralschweiz/modul-335-capacitor-starter.git
cd ./modul-335-capacitor-starter
npm install
```

## Mit Capacitor programmieren

Programmiere nun ganz normale deine Funktionen in den entsprechenden Components mit Angular \(Typescript\) aus. Sobald du dein Code geschrieben hast und ihn auf dem nativen Gerät testen möchtest führe folgenden Befehl aus um ein Build zu erstellen:

```bash
ionic build
```

Danach müssen wir die Platform zu dem Projekt hinzufügen. Es wird ein Order `android` oder `ios` erstellt:

```bash
# Android
npx cap add android

# iOS
npx cap add ios
```

Dann musst du den Capacitor `copy` Befehl ausführen, welcher alle Assets \(in diesem Fall deine die Ionic Angular App\) in den nativen Codeteil deines Projekt kopiert:

```bash
npx cap copy
```

Als nächsten können wir \(falls nicht schon offen\) dein Projekt in den nativen Entwicklungsstudios öffnen:

```bash
# Android
npx cap open android

# iOS
npx cap open ios
```

Dein Projekt sollte nun geöffnet werden.



## Für Android: mit Android Studio

Mit dem Android Studio kannst du deine hybride Ionic App nun auf ein natives Gerät kopieren und dort den geschrieben Code testen.

![](../.gitbook/assets/image%20%287%29.png)

Überprüfe in  \(1\) ob du die richtigen Permissions \(2\) gesetzt hast.   
In der Toolbar solltest du ein verbundenes Gerät \(3\) finden  und kannst deine App darauf laufen lassen \(4\).

Eine detaillierte Anleitung dazu findest du hier:

{% embed url="https://capacitor.ionicframework.com/docs/android" %}

{% hint style="warning" %}
Ähnlich wie bei iOS müssten wir für Android auch die entsprechenden Zugriff auf die nativen Komponenten freischalten. Bei Android findest du dies in der `AndroidManifest.xml`Datei, du findest diese Datei unter `android/app/src/main/`.
{% endhint %}

{% hint style="warning" %}
Auf deinem Android-Gerät muss in den Entwicklereinstellungen USB-Debugging aktiviert sein.
{% endhint %}



## Für iOS: mit Xcode

{% hint style="danger" %}
Achtung: Bei iOS ist das ganze Deployment dank   und den sogenannten Provisioning Profiles etwas komplizierter. Hast du schon einmal mit Xcode gearbeitet, kennst du damit aus oder suchst die ultimative Challenge, dann bist du hier richtig.
{% endhint %}

Eine Getting Started Anleitung für iOS findest du hier:

{% embed url="https://capacitor.ionicframework.com/docs/ios" %}







