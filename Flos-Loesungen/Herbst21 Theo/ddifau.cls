%TODO: Counter für DBSOSY für subsections automatisch neustarten?
%TODO: LinesAntwort-Umgebung
%TODO: Punktetabelle


%@author: Tilman Michaeli
%@email: tilman.michaeli@fau.de

%%Identification
%%The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ddifau}[10/02/2019]

%%Preliminary definitions, needed by the options
\newcommand{\headlinecolor}{\normalcolor}
\LoadClass[a4paper, oneside]{scrartcl}
\RequirePackage{xcolor}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{a4wide}
\RequirePackage{latexsym}
\RequirePackage{dsfont}
\RequirePackage{amsfonts,amssymb,amsmath,amsthm}
\RequirePackage{eucal}
\RequirePackage{pgfgantt}
\RequirePackage[ngerman]{babel}
\RequirePackage{xspace}
\RequirePackage{ifthen}
\RequirePackage[all]{xy}
\RequirePackage{array}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage{algorithmic}
\RequirePackage{enumitem}
\RequirePackage{marginnote}
\RequirePackage{tikz}
\RequirePackage{float}
\RequirePackage{marvosym}
\RequirePackage{qtree}
\RequirePackage{listings}
\RequirePackage{etoolbox}
\RequirePackage{textcomp}
\RequirePackage{eurosym}
\RequirePackage{xparse}

%fuer unaebhaengiges stex-repo: if stex-repo, file aus unterordner ziehen, else ddifau muss in texmf liegen (bzw. entsprechende symlinks)
\IfFileExists{../../ddifau-tex}{\RequirePackage{../../ddifau-tex/tikz-er2}}{\RequirePackage{tikz-er2}}
\IfFileExists{../../ddifau-tex}{\RequirePackage{../../ddifau-tex/tikz-uml}}{\RequirePackage{tikz-uml}}

\usetikzlibrary{%
	arrows,
	automata,
	positioning,
	shadows
}

\definecolor{ddi}{HTML}{4781B4}

%Font
\RequirePackage[sfdefault]{roboto}

%Hyperlinks, als letztes \usepackage{}
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
		linkcolor=black,
    urlcolor=[RGB]{6,69,173},
}


% Seitenlayout
%\topmargin=-1.5cm
%\topskip=0cm
%\addtolength{\textheight}{1cm}
%\addtolength{\marginparwidth}{.5cm}
%\setlength{\oddsidemargin}{0cm}
%\setlength{\textwidth}{16cm}

\parindent=0cm
\parskip1.5ex

%\topmargin-1cm
%\bottommargin-1cm


% Kopf- und Fusszeile

\fancypagestyle{blattstyle}{
	\fancyhf{}
	\ifsolution
		\fancyhead[L]{\textcolor{red}{Lösungshinweise}}
	\fi
	\fancyhead[R]{\@title}
	\fancyfoot[R]{Seite \thepage \hspace{1pt} von \pageref{LastPage}}
	\fancyfoot[L]{\@author}
}
\fancypagestyle{stextitlestyle}{
\fancyhf{}
\fancyfoot[R]{Seite \thepage \hspace{1pt} von \pageref{LastPage}}
\fancyfoot[L]{\scriptsize Letzte {\"A}nderung:~{\today}}
\renewcommand{\headrulewidth}{0.0pt}
}
\fancypagestyle{stexstyle}{
	\fancyhf{}
	\fancyhead[R]{\@subtitle \mbox{} \@title}
	\fancyfoot[R]{Seite \thepage \hspace{1pt} von \pageref{LastPage}}
}
\fancypagestyle{titlestyle}{
	\fancyhf{}
	\fancyfoot[R]{Seite \thepage \hspace{1pt} von \pageref{LastPage}}
	 \renewcommand{\headrulewidth}{0.0pt}
	\fancyfoot[L]{\@author}
}
\fancypagestyle{klausurstyle}{
	\fancyhf{}
	\ifsolution
		\fancyfoot[C]{\textcolor{red}{Musterlösung}}
	\fi
	\fancyfoot[R]{Seite \thepage \hspace{1pt} von \pageref{LastPage}}
	\renewcommand{\headrulewidth}{0.0pt}
}


%Optionen

\newif\ifsolution
\newif\ifonlysolution
\newif\ifcupsolution
\DeclareOption{cupsolution}{\cupsolutiontrue \solutiontrue}  %inklusive Loesungen zu Checkup-Aufgaben
\DeclareOption{solution}{\solutiontrue} %inklusive Loesungen (+ Aufgaben)
\DeclareOption{onlysolution}{ %nur Loesung, keine Aufgaben mehr
	\solutiontrue
	\onlysolutiontrue
}
\DeclareOption{klausur}{
	\renewcommand{\maketitle}{%
		\pagestyle{klausurstyle}
		\kopf
		\vspace{.3cm}
%		\hrule
		\vspace{1cm}
		\begin{center}
			  { \textbf{\Huge \@title}\\[1em]
				{\textcolor{darkgray}{\Large am \@date}}}
		\end{center}
		\vspace{1cm}
		\begin{center}
				\Large
				\begin{tabular}{p{3cm}p{.5cm}p{7cm}}
					Name \newline & & \hrulefill\\
					Vorname \newline & & \hrulefill\\
					Kennwort \newline & & \hrulefill
				\end{tabular}
				\ifsolution
					\textcolor{red}{\Huge Musterlösung}
				\fi
			\end{center}
		}
}

%Stexlösung
\DeclareOption{stex}{
	\renewcommand{\maketitle}{%
		\pagestyle{stexstyle}
		\thispagestyle{stextitlestyle}
		\kopf

		\medskip

		\fbox{
			\centering
			\begin{minipage}{\linewidth}
				\centering
				\large Lösungs\textit{vorschläge} zu den Staatsexamina:\\
				\@subtitle
			\end{minipage}
		}
		\smallskip

		{\LARGE \textbf{\@title}}
	}
}
%Uebungsblatt
\DeclareOption{blatt}{
\renewcommand{\maketitle}{%
				\pagestyle{blattstyle}
				\thispagestyle{titlestyle}
				\kopf

				\medskip
				\ifsolution
				\begin{center}
						{\LARGE \textcolor{red}{Lösungshinweise}}
				\end{center}
				\fi
					\vspace{.5cm}
					{\LARGE \@title\\}
					\textcolor{darkgray}{\@subtitle}
					\vspace{.5cm}
				}
}
\ProcessOptions\relax

%%Body of the class, most of the declarations appear here.

%=============================================================================
%======================== Custom Environments ================================
%=============================================================================

%======================= Aufgaben und Teilaufgaben ===========================


%Counter auf 1 und nicht auf 0 setzen fuer neue section
\newcounter{aufgcount}[section]
\newcounter{aufgteilcount}[aufgcount]
\NewDocumentEnvironment{aufgabe}{ O{} O{} }{
%vorher erhoehen, damit nummerierung mit 1 beginnt
\stepcounter{aufgcount}
%ausblenden wenn cupsolution
\ifcupsolution
		\setbox0\vbox\bgroup
\fi

%wenn Punkte bzw. wenn Aufgabentitel mit uebergeben, dann anzeigen
\ifthenelse{\equal{#1}{}}
		{\large \textbf{Aufgabe \arabic{aufgcount}}} %kein titel
		{\large \textbf{Aufgabe \arabic{aufgcount}: #1 }} %titel
\ifthenelse{\equal{#2}{}}
	{}
	{\large \textbf{\hfill (#2 Punkte)}}
\vspace*{1ex}\noindent\par\nobreak

\ifonlysolution
	\setbox0\vbox\bgroup
\fi
}{%

\ifcupsolution
		\egroup
\fi

\ifonlysolution
	 \egroup
\else
\vspace*{1ex}\noindent\par\nobreak
\fi
}%



\NewDocumentEnvironment{cupaufgabe}{ O{} O{} }{%vorher erhöhen, damit nummerierung mit 1 beginnt
\stepcounter{aufgcount}
%wenn Punkte bzw. wenn Aufgabentitel mit uebergeben, dann anzeigen
\ifthenelse{\equal{#1}{}}
		{\large \textbf{Aufgabe \arabic{aufgcount} (Check-Up)}} %kein titel
		{\large \textbf{Aufgabe \arabic{aufgcount}: #1 (Check-Up)}} %titel
\ifthenelse{\equal{#2}{}}
	{}
	{\large \textbf{\hfill (#2 Punkte)}}
	\ifonlysolution
			\setbox0\vbox\bgroup
	\else
		\vspace*{1ex}\noindent\par\nobreak
	\fi
}
{
\ifonlysolution
	 \egroup
\else
\vspace*{1ex}\noindent\par\nobreak
\fi
}

\newenvironment{solution}{%
%ausblenden wenn cupsolution
\ifcupsolution
		\setbox0\vbox\bgroup
\fi

%blau einblenden wenn solution, schwarz einblenden wenn onlysolution
	\ifsolution
		\ifonlysolution

		\else
			\vspace*{1ex}\noindent\par\nobreak
			\color{blue}
		\fi

	\else
		 \setbox0\vbox\bgroup
	\fi

}{%

	\ifcupsolution
			\egroup
	\fi

	\ifsolution
		\vspace*{1ex}\noindent\par\nobreak
	\else
		 \egroup
	\fi
}%


%Checkup-Loesungen werden nur bei expliziter Option angezeigt, sonst Dummie-Text!
\newenvironment{cupsolution}{%

%Dummie-Text blau, wenn soltution, schwarz wenn onlysolution
	\unless\ifonlysolution  % == ifnot
		\ifsolution
			\color{blue}
		\fi
	\fi

%nur wenn cupsolution tatsächliche Loesung anzeigen, sonst Dummie-Text
	\ifcupsolution
		\vspace*{1ex}\noindent\par\nobreak
	\else
		\ifsolution
			Diese Aufgabe bitte abgeben!
			\setbox0\vbox\bgroup
			\else
		 \setbox0\vbox\bgroup
		 \fi
	\fi
}{%
	\ifcupsolution
		\vspace*{1ex}\noindent\par\nobreak
	\else
		 \egroup
	\fi
}%




\newenvironment{teile}
{
  \begin{list}
    {(\alph{aufgteilcount})}
    {\usecounter{aufgteilcount}}
}
{\end{list}\vspace*{-3mm}}


%Kopf füt Titelseite
\newcommand{\kopf}{
	\vspace*{-2cm}
%	\fbox{
		\begin{minipage}{0.15\linewidth}
			\hspace{0.1cm}\includegraphics[width=2.4cm]{logo_neu.png}
		\end{minipage}
		\hfill
		\begin{minipage}{0.83\linewidth}
			\textbf{\large FRIEDRICH-ALEXANDER-UNIVERSIT{\"A}T ERLANGEN-N{\"U}RNBERG}\\
			Professur für Didaktik der Informatik
		\end{minipage}
%	}
}


\newcommand{\klausurpunkte}[1]{

	\vfill
	\hrule

	\begin{center}
	Nicht von der Kandidatin bzw. dem Kandidaten auszufüllen!
	\end{center}
	\newcounter{anzahlaufg}
	\setcounter{anzahlaufg}{#1}
	\newcounter{aufgno}
	\def\sep{&}
	\begin{center}
	  \Large
	  \begin{tabular}{|c|*{\theanzahlaufg}{p{8mm}|}|p{8mm}|}
	    \hline
	    Aufgabe\rule[-6mm]{0cm}{15mm} &
	    \whiledo{\value{aufgno}<\value{anzahlaufg}}{\stepcounter{aufgno}%
	      \hfill \theaufgno \hspace*{\fill} \sep }
	    \hspace*{\fill}$\Sigma$\hspace*{\fill} \\
	    \hline
	    Punkte \rule[-6mm]{0cm}{15mm} &
	    \setcounter{aufgno}{1}
	    \whiledo{\value{aufgno} < \value{anzahlaufg}}{%
	      \sep \stepcounter{aufgno}}
	    & \\
	    \hline
	  \end{tabular}
	\end{center}
	\clearpage
}


\newcommand{\antwortkariert}[1]{
	\ifsolution
		\setbox0\vbox\bgroup
		\egroup
	\else
		\begin{center}
		\par\hspace{.8cm}
		\begin{tikzpicture}
			\draw[step=0.5cm,color=lightgray] (0,0) grid (0.935\textwidth ,#1);
		\end{tikzpicture}\par
	\end{center}
		\medskip
	\fi
}

%TODO: Schleife bauen
\newcommand{\antwortliniert}[1]{
	\ifsolution
		\setbox0\vbox\bgroup
		\egroup
	\else
	\begin{center}
	\par\hspace{.8cm}
	\begin{tikzpicture}
		\draw[step=1.5cm,color=black] (0,0) grid (0.935\textwidth ,#1);
	\end{tikzpicture}\par
	\end{center}
		\medskip
	\fi
}


\newcommand{\antwortrahmen}[1]{
	\ifsolution
		\setbox0\vbox\bgroup
		\egroup
	\else
		\begin{center}
		\par\hspace{.8cm}
		\begin{tikzpicture}
			\draw[step=0.5cm,color=lightgray] (0,0) rectangle (0.935\textwidth ,#1);
		\end{tikzpicture}\par
	\end{center}
		\medskip
	\fi
}








% neue Spaltendefinition für Tables
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}

%=========================Custom Styles=================================
\NewDocumentEnvironment { rschema }
{ +b }
{{\noindent\footnotesize\ttfamily#1}} {}


%=========================Custom Listings================================



\lstnewenvironment{java}
  {\lstset{language=Java,
  showspaces=false,
  stepnumber=1,
  numbers=left,
  numbersep=5pt,
  numberstyle=\ttfamily\tiny\color[gray]{0.3},
  showtabs=false,
  breaklines=true,
  showstringspaces=false,
  breakatwhitespace=true,
  commentstyle=\color{gray},
  keywordstyle=\color{blue},
  stringstyle=\color{red},
  basicstyle=\ttfamily,
}}
  {}
\lstnewenvironment{haskell}
  {\lstset{
  language=Haskell,
  xleftmargin=2pt,
  stepnumber=1,
  numbers=left,
  numbersep=5pt,
  numberstyle=\ttfamily\tiny\color[gray]{0.3},
  belowcaptionskip=\bigskipamount,
  captionpos=b,
  escapeinside={*'}{'*},
  language=haskell,
  tabsize=2,
  emphstyle={\bf},
  commentstyle=\itshape,
  stringstyle=\mdseries\rmfamily,
  showspaces=false,
  keywordstyle=\bfseries\rmfamily,
  columns=flexible,
  basicstyle=\small\sffamily,
  showstringspaces=false,
  morecomment=[l]\%,
}}
  {}

\lstnewenvironment{sql}
{\lstset{
  language=SQL,
  showspaces=false,
  stepnumber=1,
  numbers=left,
  numbersep=5pt,
  numberstyle=\ttfamily\tiny\color[gray]{0.3},
  showtabs=false,
  breaklines=true,
  showstringspaces=false,
  breakatwhitespace=true,
  commentstyle=\color{gray},
  keywordstyle=\color{blue},
  stringstyle=\color{red},
  basicstyle=\ttfamily,
}}
	{}



%=========================== Diagramme ===================================


%UML: http://perso.ensta-paristech.fr/~kielbasi/tikzuml/var/files/doc/tikzumlmanual.pdf

%ER-Diagramme: http://www.texample.net/tikz/examples/entity-relationship-diagram/
	\tikzstyle{every entity} = [top color=white!10, bottom color=white!30,
	draw=blue!50!black!100]
	\tikzstyle{every weak entity} = []
	\tikzstyle{every attribute} = [top color=white, bottom color=white!20, draw=black, node distance=1cm]
	\tikzstyle{every relationship} = [top color=white, bottom color=white!20, draw=red!50!black!100]
	\tikzstyle{every isa} = [top color=white, bottom color=white!20,  draw=green!50!black!100]
	%\begin{tikzpicture}[node distance=1.5cm, every edge/.style={link}]
	%...
	%\end{tikzpicture}

%B-B\"aume: https://tex.stackexchange.com/questions/17331/how-do-i-draw-a-b-tree-in-latex
	\tikzstyle{bplus}=[rectangle split, rectangle split horizontal,rectangle split ignore empty parts,draw]
	%\begin{tikzpicture}[->,>=stealth', semithick, every node/.style={bplus}]
	%\tikzstyle{level 1}=[sibling distance=20mm]
	%\tikzstyle{level 2}=[sibling distance=15mm]
	% ...
	%\end{tikzpicture}

% ===================Makros =======================

\def\Nz{\mathbb{N}}
\def\P{\mathcal{P}}
\def\NP{\mathcal{NP}}
\def\R{{\sf R}}
\def\L{{\sf L}}
\def\N{{\sf N}}
\newcommand{\NMath}{\mathds{N}}
\def\Nat{\NMath}
\newcommand{\ggT}{\mathrm{ggT}}
\newcommand{\kgV}{\mathrm{kgV}}
\def\land{\wedge}
\def\lor{\vee}

%xmark to match checkmark
\newcommand{\xmark}{{\sffamily X}}
