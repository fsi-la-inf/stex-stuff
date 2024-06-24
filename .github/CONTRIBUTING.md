# Contributing

Wir freuen uns über jeden Beitrag. Im Folgenden sind einige Richtlinien
aufgeführt, die dir helfen, einen Beitrag zu leisten.

## Beiträge zu den Lösungsversuchen

In Kapitel 3 sammeln wir Lösungsversuche zu den Staatsexamensaufgaben. Wenn du
einen Lösungsversuch beisteuern möchtest, dann erstelle bitte eine Datei im
Ordner `sol`. Hier ein konkretes Beispiel dazu:

### Beispiel
Angenommen, du möchtest einen Lösungsversuch zu Didaktik F23T1 beisteuern. Dann
erstellst du eine Datei `sol/ddi/f23t1.tex`. Der Inhalt dieser Datei sollte wie
folgt aufgebaut sein:

```latex
\subsection{F23T1}
% Hier kommt dein Lösungsversuch
```

Möchtest du zusätzlich Informationen zu dir selbst ergänzen, dann kannst du das
wie folgt tun:

```latex
\subsectionwithauthor[author={Max Mustermann},email={max@mustermann.de}]{F23T1}
% Hier kommt dein Lösungsversuch
```
Sowohl die Angabe von Email als auch des Namens sind optional.

Hast du die Datei einmal erstellt, so musst du sie lediglich unter `sol.tex`
hinzufügen, dies geht wie folgt:

```latex
\input{sol/ddi/f23t1}
```
Bitte achte auf eine sinnvolle Sortierung.

### Wichtiges zu beachten

- Bitte beachte das Urheberrecht. **Insbesondere können wir keine
  Aufgabenstellungen zu Staatsexamensaufgaben zulassen**.
- Bitte achte auf eine sinnvolle Sortierung der Dateien.
- Bitte achte auf eine sinnvolle Benennung der Dateien.

## Beiträge zu den Themenbereichen

In Kapitel 2 sammeln wir theoretische Beiträge zu den Themenbereichen des
Staatsexamens. Wenn du einen Beitrag beisteuern möchtest, dann erstelle bitte
eine Datei im Ordner `themes`. Hier ein konkretes Beispiel:

### Beispiel

```latex
\subsection{Gerade Zahlen}
% Oder wieder alternativ:
%\subsectionwithauthor[author={Max Mustermann},email={max@mustermann.de}]{F23T1}

\begin{definition}
  	Eine Zahl $n$ heißt gerade, wenn es eine ganze Zahl $k$ gibt, sodass $n = 2k$.
\end{definition}

\begin{theorem}
  	Die Summe zweier gerader Zahlen ist gerade.
\end{theorem}

\begin{proof}
  	Seien $n$ und $m$ gerade Zahlen. Dann gibt es ganze Zahlen $k$ und $l$
	mit $n = 2k$ und $m = 2l$. Also ist $n + m = 2k + 2l = 2(k + l)$.
\end{proof}

\begin{example}
  	Die Zahlen $2$ und $4$ sind gerade. Also ist $2 + 4 = 6$ gerade.

	Die Zahlen $3$ und $4$ sind nicht beide gerade. Also ist $3 + 4 = 7$
	nicht gerade.
\end{example}
```
