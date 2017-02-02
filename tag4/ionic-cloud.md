# Ionic: Cloud

Ionic Cloud ist ein mächtiges, hybrid-fokussiertes Mobiles Backend inkl. Services. Es erlaubt einem Entwickler sehr einfach eine performante, produktive App aufzusetzen und zu skalieren.  
Mit Ionic Cloud rundet Drifty ihre  Produktepalette ab resp. erweitert ihr eigenes Ökosystem um tolle Services.

Die [Dokumentation für Ionic Cloud](http://docs.ionic.io/) ist jeweils in Ionic 1 und 2 geschrieben. Ein Wechsel der Versionen kann dabei auf der oberen Linken Seite gemacht werden:  
![](/_allgemein/ionic-cloud-dokuversion.png)

Die Doku besteht aus den folgende 3 Teilen:

* [Einrichtung](http://docs.ionic.io/setup.html) \(Wie kann ich Ionic Cloud meinem Projekt hinzufügen\)
* [Services](http://docs.ionic.io/services/) \(Welche Services kann ich benutzen\)
* [API](http://docs.ionic.io/api/http.html) \(Wie kann ich Ionic Cloud sonst noch ansteuern\)

## Services

Anbei ein Überblick der wichtigsten Services von Ionic Cloud. Wie bereits erwähnt ist das einzigartige daran, es funktioniert einfach :\)

![](https://docs.ionic.io/img/cloud-welcome-illustration.png)

### [Auth](http://docs.ionic.io/services/auth/)

Der Auth-Service macht es unglaublich einfach um Benutzer mit Email/Passwort zu authentisieren. Sozialen Logins, wie Twitter Facebook oder auch existierende Auth-Systeme können einfach integriert werden.

### [Ionic DB](http://docs.ionic.io/services/database/)

Daten erhalten und speichern ist zentral für deine App und mit der heutigen, schnelllebigen Zeit sind Echzeit-Daten ein absolutes muss. IonicDB ist eine cloudbasierte, gehostete Echzeit-Datenbank welche dir Zugriff auf deine Daten ermöglicht, ohne dass du dir Sorgen um deine Infrastruktur machen musst.

Wir schauen Ionic DB etwas später im Rahmen der Datenanbindung nochmals an.

### [Deploy](http://docs.ionic.io/services/deploy/)

Mit Ionic Deploy kannst du Code in deiner produktiven App ändern. Änderungen welche keine Binary-Änderungen beinhalten können in Echzeit ausgetauscht werden. So sparst du dir Tage, Wochen auf Wartezeit, da du deine Apps im Store nicht neu hinzufügen musst. Mann kann sogar ein "Rollback" auf vorherige Version, automatische Updates aktivieren und jedes Detail des Upgrades kontrollieren.

### [Push](http://docs.ionic.io/services/push/)

Mit Ionic Push kann man Ziel- resp. Gruppenorientierte Push-Notifikationen anhand eines einfachen Dashboards senden. Meldungen können sofort, zeitverzögert oder wenn Benutzer einem spezifischen Muster entsprechen gesendet werden. Push hat auch eine sehr gut dokumentierte API, welche Senden von Notifikation von  eigenen Servern erlaubt.  
Push unterstützt iOS- und Android-Geräte.

### [Package](http://docs.ionic.io/services/package/)

Der Ionic Package Service erlaubt es dir schnell Entwicklungs- reps. Produktions-Builds deiner App zu erstellen. Diese kannst du in den Apple App Store oder Google Play Store stellen, sie können aber auch direkt auf den Geräten deiner Familie, Freunden oder Kollegen installiert werden.

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



