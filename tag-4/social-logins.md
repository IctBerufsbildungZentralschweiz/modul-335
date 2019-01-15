# Social Logins

Social Logins sind in praktisch jeder App zu finden. Immer öfter machen es sich Entwickler einfach und implementieren gar keine eigene Logins mehr.

![](../.gitbook/assets/social-login-page.png)

Die grossen Sozialen Netzwerke unterscheiden sich dabei nicht gross. Dem Benutzer soll das Login resp. die Registrierung mit Hilfe dieses Buttons massiv vereinfacht werden.

## **Authentisierungs** - Prozess

Anbei eine grafische Übersicht des Authentisierungs-Prozesses:

![](../.gitbook/assets/how-it_happens.jpg)

1. User besucht die Seite/app und klickt auf "Login mit Facebook"
2. Benutzer wird via App zum Facebook Auth-Dialog weitergeleitet \(Gibt Email/Passwort ein\)
3. Benutzer wird zurück zur App geleitet nachdem er "Erlauben" geklickt hat
4. Unsere App spricht mit Facebook
5. Facebook gibt unser App Informationen zum User

{% embed url="https://www.youtube.com/watch?v=uUMp7qcHhIc" caption="" %}

## Übung

![](../.gitbook/assets/ralph_uebung.png)

1. Ich weiss die Zeit ist knapp, aber wie Social Logins in etwa funktionieren sollte man schon wissen.
2. Lies die Firebase Dokumentation z.B. zum [Social Login mit Facebook](https://firebase.google.com/docs/auth/web/facebook-login?authuser=0) durch
3. Versuche anhand der Doku, für deine eigene App-Idee die nötigen Schritte zu machen
4. Dabei wirst du einige Einstellungen auch auf Facebook machen müssen

