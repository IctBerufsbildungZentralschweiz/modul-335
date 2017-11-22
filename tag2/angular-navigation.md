# Angular / Ionic: Navigation
NavController ist die Basisklasse für Navigation Controller Komponenten wie _Nav_ und _Tab_. Wir brauchen den Navigation Controller um in Seiten deiner App zu navigieren.
Auf eine Art ist der Navigation Controller eine Art _"Array von Seiten"_, welche ein bestimmte Reihenfolge (so wie auch History) darstellt. 
Die Navigation erfolgt meistens über `push` und `pop` von Seiten und hinzufügen resp. entfernen in der History.

Die aktuelle Seite ist die letzte im Array, oder zuoberst im Stapel (wenn du so denkst). Eine neue Seite kann mittels `push` nun auf den Stapel hinzugefügt werden. Eine Seite wird mittels `pop` vom Stapel entfernt und die letzte Seite wird wieder angezeigt. Beide Vorgänge können animiert passieren.



Bitte lies folgende Doku nochmals durch und stelle wenn nötig im Plenum fragen:
https://ionicframework.com/docs/api/navigation/NavController/ 