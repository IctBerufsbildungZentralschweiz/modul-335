# Angular / Ionic: Navigation
{% raw %}
<div id="demo-device-ios" style="width: 467px;height: 800px; background: center top no-repeat url(https://ionicframework.com/img/devices-sprite.jpg);background-size: 467px;margin: 0 auto;">
      <iframe style="margin-top: 85px;    width: 320px;    height: 568px;" src="https://ionicframework.com/docs/demos/src/navigation/www/?production=true&amp;ionicplatform=ios" frameborder="0">
      </iframe>
    </div>



{% endraw %}
NavController ist die Basisklasse für Navigation Controller Komponenten wie _Nav_ und _Tab_. Wir brauchen den Navigation Controller um in Seiten deiner App zu navigieren.
Auf eine Art ist der Navigation Controller eine Art _"Array von Seiten"_, welche ein bestimmte Reihenfolge (so wie auch History) darstellt. 
Die Navigation erfolgt meistens über `push` und `pop` von Seiten und hinzufügen resp. entfernen in der History.

Die aktuelle Seite ist die letzte im Array, oder zuoberst im Stapel (wenn du so denkst). Eine neue Seite kann mittels `push` nun auf den Stapel hinzugefügt werden. Eine Seite wird mittels `pop` vom Stapel entfernt und die letzte Seite wird wieder angezeigt. Beide Vorgänge können animiert passieren.




