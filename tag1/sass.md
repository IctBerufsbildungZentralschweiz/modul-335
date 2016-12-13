# SASS

... kennt die heutigen verwendeten Standards für CSS Styling  
... kann in Creator die App mit SASS umstylen

"- Vorteil von SASS / Less

* Variablen, Nesting, Function, Syntax erläutern, auf Doku verweisen"
* Übung lösen

## Preprocessors

CSS alleine kann Spass machen. Stylesheets werden aber immer grösser, komplexer und schwieriger zu Warten. Hier können dir Preprocessoren helfen. SASS bietet dir Funktionen die es so in CSS nicht gibt:

* Variablen \(variables\)
* Verschachtelung \(nesting\)
* Mixins
* usw.

Ein Preprocessor nimmt deine SASS-Datei und wandelt Sie in eine herkömliche CSS-Datei um. Denn dein Browser versteht nur CSS, kein SASS.  
Es gibt diverse Programme die dir diese Umwandlung abnehmen, egal ob Terminal, Programm oder in Ionic direkt - die Idee bleibt die gleiche.

**Kleines Beispiel:**  
![](https://futurestud.io/blog/content/images/2014/Jun/sass-vs-scss.png)

## Variablen

Du kannst ganz einfach Variablen in Sass definieren. Oft werden Variablen für Grössen oder Farben verwendet:

```sass
// SASS: Variablen
// ----
$farbe-blau: #34495E;
$farbe-rot: #E74C3C;
$farbe-gruen: #2ECC71;
$groesse: 20px;

$hintergrund: $farbe-blau;

.wrapper {
  background: $hintergrund;
}
h1 { 
  font-style: italic;
  color: $farbe-rot;
}
h2 {
  font-size: $groesse;
  color: $farbe-gruen;
}
```

**Beispiel auf: **

[http://www.sassmeister.com/gist/e4a777cd959c035502658c0bded5f66b](http://www.sassmeister.com/gist/e4a777cd959c035502658c0bded5f66b)




{% gist id="https://gist.github.com/motzne/fb4b559749692856d2cd591645dca353" %}{% endgist %}





## Nesting



