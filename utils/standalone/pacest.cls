%------------- PLANTILLA TFM UOC EIMT--------------
%--------------- v3 --------------------------
%--------------- Antoni Pérez-Navarro --------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pacest}[2022/03/02 LaTeX Package for students]
\RequirePackage[utf8x]{inputenc}
\RequirePackage{ifthen}
\RequirePackage[dvips]{graphicx}
\RequirePackage{url}
\RequirePackage{fancyhdr}
\RequirePackage{color}
\RequirePackage{array}
\RequirePackage{colortbl}
%\RequirePackage{hyperref}
\RequirePackage[usenames,dvipsnames]{xcolor}



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

\pagestyle{fancy} 
%\fancyhf{}
\setlength\headheight{35pt}
\lhead{\raisebox{0.075truecm}{\includegraphics[height=1truecm]{img/noulogo.png}}}
\chead{\textbf{\@author}\\ \@nomAct}
\rhead{\@codAs\\ \@nomAs}
\fancyfoot{}
\renewcommand\headrulewidth{2pt}

\renewcommand\footrulewidth{0.4pt}
\renewcommand{\footrule}{\hbox to\headwidth{%
  \color{airblueuoc}\leaders\hrule height \footrulewidth\hfill}}
\renewcommand{\headrule}{\hbox to\headwidth{%
  \color{airblueuoc}\leaders\hrule height \footrulewidth\hfill}}
 
\lfoot{\includegraphics[height=0.35truecm,keepaspectratio=true]{img/noulogo.png}}
\lfoot{}
\cfoot{\thepage}
\rfoot{\includegraphics[height=0.35truecm,keepaspectratio=true]{img/eimt.png} \hspace*{0.25truecm} }


%% --------------- Definició de comandes -------------------
%\newcommand{\bluepac}{\color{airblueuoc}} %% Definició del color blau de la plantilla.
\definecolor{airblueuoc}{rgb}{0.36, 0.54, 0.66}
\newcommand{\bluepac}{\color{airblueuoc}} %% Definició del color blau de la plantilla.
\newcommand{\graypac}{\color{gray}} %% Definició del color gris de la plantilla.
\newcommand{\sectionuoc}[1]{\section{\bluepac #1}}
\newcommand{\subsectionuoc}[1]{\subsection{\graypac #1}}
\newcommand{\subsubsectionuoc}[1]{\subsubsection{\bluepac #1}}
\newcommand{\HRule}{\noindent\rule{\linewidth}{1.5pt}}
\newcommand{\Hrule}{\noindent\rule{\linewidth}{0.75pt}}
%{\color{airblueuoc}\hrule}
%\newcommand{\headrulecolor}[4]{\patchcmd{\headrule}{\hrule}{\color{#1}\hrule}{}{}}
%\renewcommand{\headrulewidth}{2pt}% 2pt header rule
%\renewcommand{\headrule}{\hbox to\headwidth{\color{headercolor}\leaders\hrule height \headrulewidth\hfill}}

%\sectionfont{\color{\bluepac}} 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ----------------------- Generació de les metadades del TFM -----------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Explicat a: https://www.dickimaw-books.com/latex/admin/html/clsform.shtml

\newcommand{\@titcrt}{}

\newcommand{\titcrt}[1]{
\renewcommand{\@titcrt}{#1}
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



\newcommand{\@nomAs}{}

\newcommand{\nomAs}[1]{
\renewcommand{\@nomAs}{#1}
}

\newcommand{\@codAs}{}

\newcommand{\codAs}[1]{
\renewcommand{\@codAs}{#1}
}

\newcommand{\@idioma}{}

\newcommand{\idioma}[1]{
\renewcommand{\@idioma}{#1}
}





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
Declaro que ostento la autoría total y plena de todas las tareas que se llevan a cabo en el presente documento. Soy la única persona que ha elaborado cada ejercicio. No he compartido los enunciados con nadie y la única ayuda que he recibido ha sido a través del aula de la UOC y su profesorado.
}
	{}
	\ifthenelse{\boolean{langcatalan}} %%% CATALÀ
	{
	Declaro que ostento l'autoria total i plena de totes les tasques que es duen a terme al present document. Sóc l'única persona que ha fet cada exercici. No he compartit els enunciats amb ningú i l'únic ajut que he rebut ha estat a través de l'aula de la UOC i el seu professorat.
}
	{}\ifthenelse{\boolean{langenglish}}  %%% ANGLÈS
	{I declare that I hold the total and full authorship of all the tasks that are carried out in this document. I am the only one who has elaborated each exercise. I have not shared the statements with anyone and the only help I have received has been through the UOC classroom and teachers there.
}
\\
\HRule
}{}

