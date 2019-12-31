# Native Komponenten

![](../.gitbook/assets/ionic-native.png)

Heute verwendet praktisch jede App lokale Komponenten wie Kamera, Geolocation oder Kalender. Auch mit Ionic kann mittels Cordova auf diese Ressourcen zugegriffen werden. Ionic hat die Dokumentation bereits auf die neue Version umgeschrieben:

{% embed url="https://beta.ionicframework.com/docs/native" %}



## Früher vs. heute

Die Geräteressourcen können natürlich nicht ohne Smartphone getestet werden. Mit Ionic 1 war spätestens hier der Zeitpunkt um auf die lokale Entwicklungsumgebung zu wechseln. Mühsam musste man die Smartphones für die Entwicklung konfigurieren und die App raufkopieren.

Ionic sah dieses Problem und stellte die bereits verwendete DevApp zur Verfügung.  
Eine Liste der unterstützten Plugins findest du hier:  
[https://ionicframework.com/docs/appflow/devapp/\#native-cordova-plugin-support](https://ionicframework.com/docs/appflow/devapp/#native-cordova-plugin-support)

## Beispiel der Kamera

### Installation

Wenn du nicht die DevApp verwendest und deine App selber auf dein Smartphone resp. in den AppStore deployen möchtest:

1\) Installiere folgendes Plugin in deinen Projektordner \(Gitbash\)

```bash
$ ionic cordova plugin add cordova-plugin-camera
$ npm install --save @ionic-native/camera
```

2\) Füge das Plugin zu deinem app.module.ts hinzu:  
[https://beta.ionicframework.com/docs/native\#usage-with-angular-apps](https://beta.ionicframework.com/docs/native#usage-with-angular-apps)

### Verwendung

```javascript
import { Camera, CameraOptions } from '@ionic-native/camera/ngx';

constructor(private camera: Camera) { }

...


const options: CameraOptions = {
  quality: 100,
  destinationType: this.camera.DestinationType.DATA_URL,
  encodingType: this.camera.EncodingType.JPEG,
  mediaType: this.camera.MediaType.PICTURE
}

this.camera.getPicture(options).then((imageData) => {
 // imageData is either a base64 encoded string or a file URI
 // If it's base64:
 let base64Image = 'data:image/jpeg;base64,' + imageData;
}, (err) => {
 // Handle error
});
```

## Ausblick -&gt; Capactior

![](../.gitbook/assets/capacitor-hero.jpg)

{% embed url="https://capacitor.ionicframework.com/" %}





