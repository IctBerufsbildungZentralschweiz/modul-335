# Ionic 6 & Angular 13 Upgrade



### 1) Versionen in Files updaten&#x20;

{% code title="package.json" %}
```
  ...
  "dependencies": {
        "@angular/common": "~13.0.0",
        "@angular/core": "~13.0.0",
        "@angular/fire": "^7.2.0",
        "@angular/forms": "~13.0.0",
        "@angular/platform-browser": "~13.0.0",
        "@angular/platform-browser-dynamic": "~13.0.0",
        "@angular/router": "~13.0.0",
        "@capacitor/android": "^3.3.3",
        "@capacitor/app": "1.0.7",
        "@capacitor/core": "^3.3.3",
        "@capacitor/haptics": "1.1.3",
        "@capacitor/ios": "^3.3.3",
        "@capacitor/keyboard": "1.2.0",
        "@capacitor/status-bar": "1.0.6",
        "@ionic/angular": "^6.0.0",
        "@ionic/storage-angular": "^3.0.6",
        "firebase": "^9.6.1",
        "hammerjs": "^2.0.8",
        "rxjs": "~6.6.0",
        "tslib": "^2.2.0",
        "zone.js": "~0.11.4"
    },
    "devDependencies": {
        "@angular-devkit/build-angular": "~13.0.1",
        "@angular-eslint/builder": "~13.0.1",
        "@angular-eslint/eslint-plugin": "~13.0.1",
        "@angular-eslint/eslint-plugin-template": "~13.0.1",
        "@angular-eslint/template-parser": "~13.0.1",
        "@angular/cli": "~13.0.1",
        "@angular/compiler": "~13.0.0",
        "@angular/compiler-cli": "~13.0.0",
        "@angular/language-service": "~13.0.0",
        "@capacitor/cli": "^3.3.3",
        "@ionic/angular-toolkit": "^5.0.0",
        "@types/jasmine": "~3.6.0",
        "@types/jasminewd2": "~2.0.3",
        "@types/node": "^12.11.1",
        "@typescript-eslint/eslint-plugin": "5.3.0",
        "@typescript-eslint/parser": "5.3.0",
        "eslint": "^7.6.0",
        "eslint-plugin-import": "2.22.1",
        "eslint-plugin-jsdoc": "30.7.6",
        "eslint-plugin-prefer-arrow": "1.2.2",
        "jasmine-core": "~3.8.0",
        "jasmine-spec-reporter": "~5.0.0",
        "karma": "~6.3.2",
        "karma-chrome-launcher": "~3.1.0",
        "karma-coverage": "~2.0.3",
        "karma-coverage-istanbul-reporter": "~3.0.2",
        "karma-jasmine": "~4.0.0",
        "karma-jasmine-html-reporter": "^1.5.0",
        "protractor": "~7.0.0",
        "ts-node": "~8.3.0",
        "typescript": "~4.4.4"
    },
...p
```
{% endcode %}



### 2) Angular 13 Upgrade

1. `angular.json kopieren`
2. ``

### 3) Ionic Storage

`@ionic/storage` heisst neu -> `@ionic/storage-angular` -> rename

`storage.ready()` gibts nicht mehr ->  entfernen



### 4) Firebase Update

Seit @angular/fire 7  sind die Exports neu, daher muss mittels der [compatibility layer](https://github.com/angular/angularfire/blob/master/docs/version-7-upgrade.md#compatibility-mode). oder die neuen, saubere Variante der Imports verwenden werden. -> Alle @angular/fire mit @angular/fire/compat ergänzen.

{% embed url="https://stackoverflow.com/questions/68939014/angularfiremodule-and-angularfiredatabasemodule-not-being-found-in-angular-fire" %}

### 5) Ionic Native&#x20;

Statusbar und Splashscreen gibts von Ionic Native nicht mehr, daher sind diese zu entfernen
