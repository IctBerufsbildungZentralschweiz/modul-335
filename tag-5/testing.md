# Testing

Auch in Ionic entwickelte Apps sollten vor der Veröffentlichung gründlich getestet werden. Ob ein Entwickler nun nach Test-First programmiert oder ein eigenes Team im Unternehmen dafür verantwortlich ist spielt keine Rolle. Tests sind wichtig und nur damit findest du die wirklichen Bugs... Wie ich meine Ionic App testen kann haben wir in diesem [Tutorial](https://ionicframework.com/docs/guide/testing.html) bereits kurz angeschaut.

Das folgende Video zeigt dir noch eine Implementation von Unit-Tests:

{% embed data="{\"url\":\"https://www.youtube.com/watch?v=8ApX7EhkBDs\",\"type\":\"video\",\"title\":\"\",\"icon\":{\"type\":\"icon\",\"url\":\"https://www.youtube.com/yts/img/favicon\_144-vfliLAfaB.png\",\"width\":144,\"height\":144,\"aspectRatio\":1},\"thumbnail\":{\"type\":\"thumbnail\",\"url\":\"https://i.ytimg.com/vi/8ApX7EhkBDs/maxresdefault.jpg\",\"width\":1280,\"height\":720,\"aspectRatio\":0.5625},\"embed\":{\"type\":\"player\",\"url\":\"https://www.youtube.com/embed/8ApX7EhkBDs?rel=0&showinfo=0\",\"html\":\"<div style=\\"left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.2493%;\\"><iframe src=\\"https://www.youtube.com/embed/8ApX7EhkBDs?rel=0&amp;showinfo=0\\" style=\\"border: 0; top: 0; left: 0; width: 100%; height: 100%; position: absolute;\\" allowfullscreen scrolling=\\"no\\"></iframe></div>\",\"aspectRatio\":1.7778}}" %}

{% embed data="{\"url\":\"https://www.youtube.com/watch?v=i0iV\_x8NgeE\",\"type\":\"video\",\"title\":\"\",\"icon\":{\"type\":\"icon\",\"url\":\"https://www.youtube.com/yts/img/favicon\_144-vfliLAfaB.png\",\"width\":144,\"height\":144,\"aspectRatio\":1},\"thumbnail\":{\"type\":\"thumbnail\",\"url\":\"https://i.ytimg.com/vi/i0iV\_x8NgeE/maxresdefault.jpg\",\"width\":1280,\"height\":720,\"aspectRatio\":0.5625},\"embed\":{\"type\":\"player\",\"url\":\"https://www.youtube.com/embed/i0iV\_x8NgeE?rel=0&showinfo=0\",\"html\":\"<div style=\\"left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.2493%;\\"><iframe src=\\"https://www.youtube.com/embed/i0iV\_x8NgeE?rel=0&amp;showinfo=0\\" style=\\"border: 0; top: 0; left: 0; width: 100%; height: 100%; position: absolute;\\" allowfullscreen scrolling=\\"no\\"></iframe></div>\",\"aspectRatio\":1.7778}}" %}

## Testarten

### Komponententest

Der Modultest, auch Komponententest oder Unittest genannt, ist ein Test auf der Ebene der einzelnen Module der Software. Testgegenstand ist die Funktionalität innerhalb einzelner abgrenzbarer Teile der Software \(Module, Programme oder Unterprogramme, Units oder Klassen\). Testziel dieser häufig durch den Softwareentwickler selbst durchgeführten Tests ist der Nachweis der technischen Lauffähigkeit und korrekter fachlicher \(Teil-\) Ergebnisse.

### Integrationstest

Der Integrationstest bzw. Interaktionstest testet die Zusammenarbeit voneinander abhängiger Komponenten. Der Testschwerpunkt liegt auf den Schnittstellen der beteiligten Komponenten und soll korrekte Ergebnisse über komplette Abläufe hinweg nachweisen.

### Systemtest

Der Systemtest ist die Teststufe, bei der das gesamte System gegen die gesamten Anforderungen \(funktionale und nicht-funktionale Anforderungen\) getestet wird. Gewöhnlich findet der Test auf einer Testumgebung statt und wird mit Testdaten durchgeführt. Die Testumgebung soll die Produktivumgebung des Kunden simulieren, d. h. ihr möglichst ähnlich sein. In der Regel wird der Systemtest durch die realisierende Organisation durchgeführt.

### Abnahmetest

Ein Abnahmetest, Verfahrenstest, Akzeptanztest oder auch User Acceptance Test \(UAT\) ist das Testen der gelieferten Software durch den Kunden. Der erfolgreiche Abschluss dieser Teststufe ist meist Voraussetzung für die rechtswirksame Übernahme der Software und deren Bezahlung. Dieser Test kann unter Umständen \(z. B. bei neuen Anwendungen\) bereits auf der Produktionsumgebung mit Kopien aus Echtdaten durchgeführt werden.

Besonders für System- und Abnahmetests wird das Blackbox-Verfahren angewendet, d. h. der Test orientiert sich nicht am Code der Software, sondern nur am Verhalten der Software bei spezifizierten Vorgängen \(Eingaben des Benutzers, Grenzwerte bei der Datenerfassung etc.\).

_Quelle:_ [https://de.wikipedia.org/wiki/Softwaretest](https://de.wikipedia.org/wiki/Softwaretest)

## Test-First

Testgetriebene Entwicklung \(auch testgesteuerte Programmierung, engl. test first development oder test-driven development \(TDD\)\) ist eine Methode, die häufig bei der agilen Entwicklung von Computerprogrammen eingesetzt wird. Bei der testgetriebenen Entwicklung erstellt der Programmierer Software-Tests konsequent vor den zu testenden Komponenten.

### Gründe für die Einführung einer testgetriebenen Entwicklung

Nach klassischer Vorgehensweise, beispielsweise nach dem Wasserfall- oder dem V-Modell, werden Tests parallel zum und unabhängig vom zu testenden System entwickelt oder sogar nach ihm. Dies führt oft dazu, dass nicht die gewünschte und erforderliche Testabdeckung erzielt wird. Mögliche Gründe dafür sind unter anderem:

* Fehlende oder mangelnde Testbarkeit des Systems \(monolithisch, Nutzung von Fremdkomponenten, …\).
* Verbot der Investition in nicht-funktionale Programmteile seitens der Unternehmensführung. \(„Arbeit, von der man später im Programm nichts sieht, ist vergeudet.“\)
* Erstellung von Tests unter Zeitdruck.
* Nachlässigkeit und mangelnde Disziplin der Programmierer bei der Testerstellung.

Ein weiterer Nachteil klassischer White-Box-Tests ist, dass der Entwickler das zu testende System und seine Eigenheiten selbst kennt und dadurch aus Betriebsblindheit unversehens „um Fehler herum“ testet.

Die Methode der testgetriebenen Entwicklung versucht den Gründen für eine nicht ausreichende Testabdeckung und einigen Nachteilen der White-Box-Tests entgegenzuwirken.

 _Quelle:_ [https://de.wikipedia.org/wiki/Testgetriebene\_Entwicklung](https://de.wikipedia.org/wiki/Testgetriebene_Entwicklung)

