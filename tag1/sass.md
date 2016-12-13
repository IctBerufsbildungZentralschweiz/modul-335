# SASS


... kennt die heutigen verwendeten Standards für CSS Styling
... kann in Creator die App mit SASS umstylen


"- Vorteil von SASS / Less
- Variablen, Nesting, Function, Syntax erläutern, auf Doku verweisen"
- Übung lösen

## Preprocessors
CSS alleine kann Spass machen. Stylesheets werden aber immer grösser, komplexer und schwieriger zu Warten. Hier können dir Preprocessoren helfen. SASS bietet dir Funktionen die es so in CSS nicht gibt:
- Variablen (variables)
- Verschachtelung (nesting)
- Mixins
- usw.

Ein Preprocessor nimmt deine SASS-Datei und wandelt Sie in eine herkömliche CSS-Datei um. Denn dein Browser versteht nur CSS, kein SASS.
Es gibt diverse Programme die dir diese Umwandlung abnehmen, egal ob Terminal, Programm oder in Ionic direkt - die Idee bleibt die gleiche. 


__Kleines Beispiel:__
![](https://futurestud.io/blog/content/images/2014/Jun/sass-vs-scss.png) 


## Variablen

```sass
// SASS: Variablen
// ----
$farbe-blau: #34495E;
$farbe-rot: #E74C3C;
$farbe-gruen: #2ECC71;

$hintergrund: $farbe-blau;

.wrapper {
  background: $hintergrund;
}
h1 { 
  font-style: italic;
  color: $farbe-rot;
}
h2 {
  font-size: 20px;
  color: $farbe-gruen;
}

```



## Nesting


