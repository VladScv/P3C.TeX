%-------------------- Developed Over the Official Public Package :
%----------------------- UOC 2022/03/02 LaTeX Package for students
%-------------------------------------------------------by Scvria
%------------- PLANTILLA TFM UOC EIMT-----------------------------
%--------------- v3 ----------------------------------------------
%--------------- Antoni Pérez-Navarro ----------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{styles/PECTeX}[2022/03/02 LaTeX Package for students]
\RequirePackage[utf8]{inputenc}
\RequirePackage{ifthen}
\RequirePackage{arev}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{color}
\RequirePackage{array}
\RequirePackage{colortbl}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{amsmath} %ampliació d'opcions matemàtiques
\RequirePackage{graphicx} %Permet carregar imatges (figures)
\RequirePackage{float} % Afegeix opcions per ubicar objectes.
\RequirePackage{pdfpages}
\RequirePackage[a4paper, margin= 0.75cm]{geometry}
%% ----------------------- Opcions d'entrada pròpies del paquet: català, castellà o anglès-----
\newboolean{langspanish}
\newboolean{langcatalan}
\newboolean{langenglish}
\newboolean{practica}
\DeclareOption{CAT}{
	\setboolean{langcatalan}{true}
	\setboolean{langspanish}{false}
	\setboolean{langenglish}{false}
} 
\DeclareOption{IB}{
	\setboolean{langcatalan}{false}
	\setboolean{langspanish}{true}
	\setboolean{langenglish}{false}
}
\DeclareOption{ENG}{
	\setboolean{langcatalan}{false}
	\setboolean{langspanish}{false}
	\setboolean{langenglish}{true}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}% Passa les opcions no declarades explícitament a "article". Així es poden fer servir totes les opcions de report.
\ProcessOptions

%% --------------- Basat en l'estil article -------------------

\LoadClass[11pt]{article}

\ifthenelse{\boolean{langspanish}} 
{\RequirePackage[spanish]{babel}}%%% CASTELLÀ
{\ifthenelse{\boolean{langcatalan}}
	{\RequirePackage[catalan]{babel}}%%% CATALÀ
	{\RequirePackage[english]{babel}}}%%% ANGLÈS

%% --------------- Configuració de la pàgina -------------------
\setlength{\topmargin}{0cm}
\setlength{\textheight}{22cm}
\setlength{\textwidth}{17cm}
\setlength{\oddsidemargin}{0.75cm}
\setlength{\evensidemargin}{0.75cm}
\setlength{\headheight}{1cm}
\setlength{\hoffset}{-1truecm}
\setlength{\voffset}{-2truecm}

%% --------------- Capçalera de les planes normals -------------------

\fancypagestyle{uocstyle}{%
	\fancyhf{} % Esborra capçaleres i peus existents
	\setlength\headheight{35pt}
	\fancyhead[L]{\raisebox{0.075truecm}{\includegraphics[height=1cm]{styles/img/noulogo.png}}}
	\fancyhead[C]{ \@nomAct \\ \textbf{\@nomEst}}
	\fancyhead[R]{ \@nomAsAUX\\ \@codAs}
	\fancyfoot[L]{\@PECfootAUX}
	\fancyfoot[C]{\thepage}
	\fancyfoot[R]{\includegraphics[height=0.35cm,keepaspectratio=true]{styles/img/eimt.png} \hspace*{0.25cm}\\ \tiny{\@nomAs}}
	\renewcommand\headrulewidth{2pt}
	\renewcommand\footrulewidth{0.4pt}
	\renewcommand{\footrule}{\hbox to\headwidth{%
			\color{airblueuoc}\leaders\hrule height \footrulewidth\hfill}}
	\renewcommand{\headrule}{\hbox to\headwidth{%
			\color{airblueuoc}\leaders\hrule height \headrulewidth\hfill}}
}
%\pagestyle{uocstyle} 

%\pagestyle{fancy} 
%\setlength\headheight{35pt}
%\lhead{\raisebox{0.075truecm}{\includegraphics[height=1truecm]{styles/img/noulogo.png}}}
%\chead{\textbf{\@author}\\ \@nomAct}
%\rhead{\@codAs\\ \@nomAs}
%\fancyfoot{}
%\renewcommand\headrulewidth{2pt}
%
%\renewcommand\footrulewidth{0.4pt}
%\renewcommand{\footrule}{\hbox to\headwidth{%
%		\color{airblueuoc}\leaders\hrule height \footrulewidth\hfill}}
%\renewcommand{\headrule}{\hbox to\headwidth{%
%		\color{airblueuoc}\leaders\hrule height \footrulewidth\hfill}}
%
%\lfoot{}
%\cfoot{\thepage}
%\rfoot{\includegraphics[height=0.35truecm,keepaspectratio=true]{styles/img/eimt.png} \hspace*{0.25truecm} }

%% --------------- Definició de comandes -------------------
\definecolor{airblueuoc}{rgb}{0.36, 0.54, 0.66}
\newcommand{\bluepac}{\color{airblueuoc}} %% Definició del color blau de la plantilla.
\newcommand{\graypac}{\color{gray}} %% Definició del color gris de la plantilla.
\newcommand{\sectionuoc}[1]{\section{\bluepac #1}}
\newcommand{\subsectionuoc}[1]{\subsection{\graypac #1}}
\newcommand{\subsubsectionuoc}[1]{\subsubsection{\bluepac #1}}
\newcommand{\HRule}{\noindent\rule{\linewidth}{1.5pt}}
\newcommand{\Hrule}{\noindent\rule{\linewidth}{0.75pt}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ----------------------- Generació de les metadades del TFM -----------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\@titcrt}{}
\newcommand{\titcrt}[1]{
	\renewcommand{\@titcrt}{#1}
}

\newcommand{\@PECtitleAUX}{}
\newcommand{\PECtitleAUX}[1]{
	\renewcommand{\@PECtitleAUX}{#1}
}
\newcommand{\@PECfootAUX}{}
\newcommand{\PECfootAUX}[1]{
	\renewcommand{\@PECfootAUX}{#1}
}
\newcommand{\@nomPDC}{}
\newcommand{\nomPDC}[1]{
	\renewcommand{\@nomPDC}{#1}
}

\newcommand{\@nomEst}{}
\newcommand{\nomEst}[1]{
	\renewcommand{\@nomEst}{#1}
}
\newcommand{\@titulac}{}
\newcommand{\titulac}[1]{
	\renewcommand{\@titulac}{#1}
}

\newcommand{\@nomAct}{}
\newcommand{\nomAct}[1]{
	\renewcommand{\@nomAct}{#1}
}
\newcommand{\@nomActAUX}{}
\newcommand{\nomActAUX}[1]{
	\renewcommand{\@nomActAUX}{#1}
}


\newcommand{\@nomAs}{}
\newcommand{\nomAs}[1]{
	\renewcommand{\@nomAs}{#1}
}

\newcommand{\@codAs}{}
\newcommand{\codAs}[1]{
	\renewcommand{\@codAs}{#1}
}

\newcommand{\@nomAsAUX}{}
\newcommand{\nomAsAUX}[1]{
	\renewcommand{\@nomAsAUX}{#1}
}


\newcommand{\@idioma}{}
\newcommand{\idioma}[1]{
	\renewcommand{\@idioma}{#1}
}

\newcommand{\@subtitol}{}
\newcommand{\subtitol}[1]{
\renewcommand{\@subtitol}{#1}
}
\newcommand{\@subsubtitol}{}
\newcommand{\subsubtitol}[1]{
\renewcommand{\@subsubtitol}{#1}
}

\newcommand{\@dataActual}{}
\newcommand{\dataActual}[1]{
	\renewcommand{\@dataActual}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% CREACIÓ DE L'ESTRUCTURA INICIAL DEL DOCUMENT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\noplagi}
{
	
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%% Definició dels codis d'idioma
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\ifthenelse{\boolean{langspanish}} %%% CASTELLÀ
	{
		Yo \textbf{\@nomEst}\label{student} , declaro que ostento la autoría total y plena de todas las tareas que se llevan a cabo en el presente documento. Soy la única persona que ha elaborado cada ejercicio. No he compartido los enunciados con nadie y la única ayuda que he recibido ha sido a través del aula de la UOC y su profesorado.
	}
	{}
	\ifthenelse{\boolean{langcatalan}} %%% CATALÀ
	{
		Jo \textbf{\@nomEst}\label{student} ,declaro que ostento l'autoria total i plena de totes les tasques que es duen a terme al present document. Sóc l'única persona que ha fet cada exercici. No he compartit els enunciats amb ningú i l'únic ajut que he rebut ha estat a través de l'aula de la UOC i el seu professorat.
	}
	{}\ifthenelse{\boolean{langenglish}}  %%% ANGLÈS
	{I \textbf{\@nomEst}\label{student} declare that I hold the total and full authorship of all the tasks that are carried out in this document. I am the only one who has elaborated each exercise. I have not shared the statements with anyone and the only help I have received has been through the UOC classroom and teachers there.
	}
	\\
	\HRule
}{}

\newcommand{\PECflex}[1]{\resizebox{\linewidth}{!}{#1}}

\newcommand{\PECvspace}{0.02\textheight}

\newcommand{\PEChspace}[1]{#1\textwidth}

\color[HTML]{000078}
\definecolor{celeste}{HTML}{73EDFF}
\definecolor{gris}{HTML}{F0F0F0}

%% Portada
\newcommand{\PECportada}{
	\newgeometry{margin=12mm}
	\thispagestyle{empty}
	\noindent
	
	
	\fcolorbox{celeste}{celeste}{
		\begin{minipage}[t][.30\textheight][t]{0.96\textwidth}
			\flushleft
			\hspace{10em}\\\vspace{\PECvspace}
			\hspace{2em}\LARGE{\@titulac \\[\PECvspace]}
			\hspace{0.5em} {\fontsize{35pt}{35pt}\selectfont \textbf{\@nomAs} \\[\PECvspace]}
			\vspace*{\fill}
			{\fontsize{20pt}{20pt}\selectfont
				\begin{tabular}[H]{p{0.2\textwidth} p{0.6\textwidth}}
					\centering
					\scalebox{2.5}[3]{\textbf{\@nomAct}}
					& \hspace*{\fill}\@subtitol\\
					& \hspace*{\fill} \footnotesize{\@subsubtitol}
				\end{tabular}
			}
		\end{minipage}
	}\\[\PECvspace]
	
	\includegraphics[height=.65\textheight]{styles/img/PECTeXportada.png}
	\hspace{\PECvspace}
	\fcolorbox{gris}{gris}{
		\begin{minipage}[b][.65\textheight][t]{.6\textwidth}
			\flushleft
			\vspace{2em}\hspace*{\fill}\@nomActAUX\\[2em]\hspace*{\fill} \@PECtitleAUX
			\\\vspace*{\fill}	
			\Huge
			\hspace*{\fill}\textbf{\@nomEst}\\[\PECvspace]
			\LARGE		
			\hspace{0.2\linewidth}\normalsize{\noplagi}\hspace{0.2\linewidth}\\
			\hspace*{\fill} \makeatletter \@dataActual \makeatother	
		\end{minipage}
	}
	\clearpage
	\restoregeometry	
	\pagestyle{uocstyle} % Reinstaurar l'estil `fancy` per a la resta del document
	\tableofcontents % Crear el TOC
	\thispagestyle{uocstyle} % Reinstaurar l'estil `fancy` per a la resta del document	
	\newpage	
}
% Comanda per crear el TOC amb estil coherent
\newcommand{\PECtoc}{
	\ifthenelse{\boolean{langcatalan}}{\renewcommand{\contentsname}{Índex}}{}
	\ifthenelse{\boolean{langspanish}}{\renewcommand{\contentsname}{Índice}}{}
	\ifthenelse{\boolean{langenglish}}{\renewcommand{\contentsname}{Table of Contents}}{}
	\clearpage
	\pagestyle{uocstyle} % Configurar l'estil per a l'índex
	\noplagi % Afegeix el text de no plagi abans de l'índex
	\tableofcontents
	\thispagestyle{uocstyle} % Forçar immediatament l'estil de pàgina
	\newpage
}
