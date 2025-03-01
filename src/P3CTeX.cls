\NeedsTeXFormat{LaTeX2e}
\ProvidesExplClass
{P3CTeX}
{2025/02/21}
{v0.3}
{Ultimate LaTeX Package for UOC students by Scvria (LaTeX3 refactor)}

\LoadClass{article}
\input{../src/expl/p3x.loader} % TODO This path is relative to TeX document, a dynamic relative path system is needed.%TODO '../' added for test

\cs_new_protected:Npn  \__px_HRule: { \noindent \rule{\linewidth}{1.5pt} }

\cs_new_protected:Npn  \__px_Hrule: { \noindent \rule{\linewidth}{0.75pt} }
\cs_new_protected:Npn \__ifdebug:n #1 {
	\bool_if:NT \l__px_debug_values_bool {#1}
}
\cs_new_protected:Npn \__ifcover:n #1 {
	\bool_if:NT  \l__px_cover_bool {#1}
}

\cs_new_protected:Npn \__ifcover:nn #1#2 {
	\bool_if:NTF  \l__px_cover_bool {#1}{#2}
}
\cs_new_protected:Npn \__err:n #1 {	
	\errmessage{
		>>>> ~P3c.TeX~ #1 
	}
	\stop
}
\cs_new_protected:Npx \__critical_in:n #1 {	
	\file_if_exist_input:nF		{ ../src/expl/ #1 .sty} %TODO quit hardcoded 
	{%TODO '../' added for test
		\__err:n{	#1 ~Module~load~failed.~~File~#1.sty~not~found.~	}	
	}
}

\cs_new_protected:Npn  \__px_PXgrow:nnnn #1#2#3#4
{
	\IfBlankTF{#3}{
				\resizebox*{!}{#4}{\dim_set:Nn \l__px_grow_dim {#4} NOT SET }
	}{
		\sbox0{\resizebox{#2\linewidth}{!}{#3}}
		\bool_if:NF {#1}
		{ \hspace*{\fill} }
		\ifdim \ht0 > #4
		\resizebox*{!}{#4}{\dim_set:Nn \l__px_grow_dim {#4} #3}
		\else
		\resizebox{#2\linewidth}{!}{\dim_set:Nn \l__px_grow_dim {\ht0} #3}
		\fi
	}
}
\cs_new_protected_nopar:Npn \__px_PXfill: { \hspace*{\fill} }
%                                                                            |\    /\  /\ /\/|  
%  %%%%%%%%%%%%%%%%%%º·_'_'_· º%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% |:\/\/::\/::V:::| %%%%%%%%%%%%%%%%
%  %¡ ___ %\¨¨¨'º%%%º '/A\\\\\' %%%%%%%%%:::P´ ___ ¨`º __     :¡__      %%%% |::$c\v/r¡^:::::| %%%%%%  .%%%%%% .% %%%        . %
%  %| ::| %%%%] ,%%%|·:||!____ · %%%%%%%::P'  ::::\  `:::\ º%%:::/ .::::% ([====$(·)fwªRe====]) %%%%%%  :%%%%%% :% %%%       :.%%%
%  %|  ___%%/¨¨ `ª%%, .\V///// ·%5%%%%%%::|   %%%::!  %%::\ º%%:/  %%%%%º /|||/....  X ||..|\\||\%%%%%%  :%%%%%% :% %%%      ::%%%%%%
%  %| :::%%%%%%D, '%%%,· . . ·ºººººººººº::!   ¨¨¨¨¨   %%%::\ º:/  %%%%%º  ´`/<<´Ö`>>/^\<<´Ö`>>\´`%%%%%%%  :%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%  %| %%%%/´`)%%D  :%%%%bnn::¡_____    _____  ::::::%%%%%%::·   º%%%%%%%  \;> )¨V\/VV^VV\/V¨( <;/%%%%%%  :%%%%%% :% %%%::::::::%%%%%%·. 
%  %! %%%%\  'ºº' .%%%%%º~º::::::::¡   %::|   %.:(´`º%%%%::/ ,:\ º%%%%%%% |]('/   -- + --   \')[|%%%%%  :%%%%%% :% %%%       ::%%%::''	
%  %%%%%%%%%bn¡¡¡d%%%%%( o )%%%%%::|   %%:!   º%::D  %%%::/ ,%%:\ º%%%%%% ||]'\_/ToD()mªlH\_/'[||%%%  .:%%%%%% :% %%%        ::%::'	
%  %%%%%%%%%%%%%%%%%%%%%bud%%%%%%::|   %%%::\. `¨´ .d%%::/ ,%%%%:\ º%%%=====\\|..|¨...¨|..|//======\   ¨¨¨¨¨¨  ¨  ¨¨¨        ::'
%                                ::!       ':::::::¡_________%::¡____||   \\    ¨Y¨T T T¨YT¨   //  ||  \%%%%%%%%%%              '
%                                ::           ¨'¨::::::::::   ::::::::::

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% LOAD SEQUENCE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\geometry{a4paper, margin=1.2cm}
\__critical_in:n			{	p3xkeys		}
\ProcessKeyOptions[P3CTeX]
\__critical_in:n			{	p3xlayout	}
\__critical_in:n			{	p3xtools	}
\__ifdebug:n{
							\__critical_in:n	{	p3xdebug	}
			}
			
\AtEndPreamble{
	\babelprovide{
		 \l__px_language_internal_tl
	}
	\__px_apply_pdf:
	\pagestyle{uocstyle}	
}
\AfterBeginDocument{
	\__ifcover:nn{	
		\thispagestyle{empty}
		%		\pagenumbering{alph}
		\setcounter{page}{-1} % TODO DISABLE IN UNCOVER MODE
		\__px_cover: 
		\clearpage
		\tableofcontents %
		\clearpage
	}{
		\__px_toc:%TODO UNCOVER VERSION	
	}
}
\AtEndDocument{
	\__ifdebug:n{\__px_debug_page:}
}
%%%%%%%%%%%%%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

\cs_new_protected_nopar:Nn \__px_apply_pdf:
{
	\keys_set:nn { P3CTeX / pdf} {colorlinks}
	\hypersetup{
		pdftitle    = {\l__px_pdf_title_tl},
		pdfauthor   = {\l__px_pdf_author_tl},
		pdfsubject  = {\l__px_pdf_subject_tl},
		pdfkeywords = {\l__px_pdf_keywords_tl},
		pdfcreator  = {\l__px_pdf_creator_tl},
		pdfproducer = {\l__px_pdf_producer_tl},
		
		pdfpagemode = {\l__px_pdf_pagemode_tl},
		pdfstartview= {\l__px_pdf_startview_tl},
		
		linkcolor   = {\l__px_linkcolor_tl},
		citecolor   = {\l__px_citecolor_tl},
		urlcolor    = {\l__px_urlcolor_tl},
		filecolor   = {\l__px_filecolor_tl},
		bookmarks   = {\l__px_bookmarks_bool},
		bookmarkstype = toc,
		colorlinks  =  true,
		breaklinks  = true,
		linktoc     = {all},
		hyperfootnotes = true,
	}
}

\cs_new_protected:Npn \__px_safeimg:nn #1#2#3#4
{	% #2 => ruta + nombre de fichero (por ej. "images/noulogo.png")
	% #1 => opciones a usar en \includegraphics (p.e. "width= 0.8\linewidth")
	% #3 => size del parbox placeholder (p.e. "0.8\linewidth")
	\IfFileExists{#2}
	{
		\includegraphics[#1]{#2}
	}
	{
		\fcolorbox{UOCgray}{UOCgray}{
			\parbox[c][#3][c]{#3}{
				\centering
				\color{white}
				\bfseries
				#2
			}
		}
	}
}


%%: %¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#¨¨¨¨¨% |\    /\  /\ /\/|  
%%: %%%¨¨¨: :P´  `%\ %%/ /%%% |:\/\/::\/::V:::| %%%%%%%%%%%%%%%%
%%: %%%p% : :: db %%\ V /%%%% |::$c\v/r¡^:::::| %%%%%%   %%%%%%  % %%%        . %
%%: ¨¨:¨¨ : :: ¨¨ %%%b d%%% ([====$(·)fwªRe====]) %%%%%  :%%%%%% :% %%%       ::%%%
%%%%%%% h : :: %%º%%/ A \%%/|||/....  X ||..|\\||\%%%%%%  :%%%%%% :% %%%      ::%%%%%%
%%%%%%% ¨ %%%b.''.d/ /%\ \%´`/<<´Ö`>>/^\<<´Ö`>>\´`%%%%%%%  :%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%;´¨`%%%%%%%%¨¨    ¨#¨ ¨¨\;> )¨V\/VV^VV\/V¨( <;/%%%%%%  :%%%%%% :% %%%::::::::%%%%%%:·
%%%%%D )%%%Pººº%%%%%%%%%%%%|]('/             \')[|%%%%%  :%%%%%% :% %%%       ::%%%::'
%%%%/  <%%( ºq%%% % %% %%%%||]'\_/ToD()mªlH\_/'[||%%%  ::%%%%%% :% %%%        ::%::'
%%%L..../´,d%%%%% % %% /======\\|..|¨...¨|..|//======\ ¨¨¨¨¨¨¨  ¨  ¨¨¨        ::'
%%%%%%%%( `G%% %%   %%/  ||  \\  ¨Y¨TTT¨YT¨   //  ||  \%%%%%%%%%%
%%%%%%%%%nnnnn%%%%%%%/ CAPA EXTERNA: LaTeX2e/xparse    \
% ──────────────────────────────────────────
% ---------------------------
% Function: \PECTeXconfig
% Description: Loads user-defined configuration and applies language settings.
% Parameters:
%   #1 - Key-value list of settings
% ---------------------------
\NewDocumentCommand{\PECTeX}{ +m }{
	% 1) Idioma
	\keys_set:nn { P3CTeX / text } { #1 }
	
	% 2) Datos
	\keys_set:nn { P3CTeX / data } { #1 }
	
	% 3) Layout de página
	\keys_set:nn { P3CTeX / page } { #1 }
	
	% 4) Config general
	\keys_set:nn { P3CTeX / config } { #1 }
	
	% 5) Si cover => px-cover
	\__ifcover:n{\keys_set:nn { P3CTeX / cover } { #1 }	}
}


% --- CAPA EXTERNA DE USUARIO ---
\NewDocumentCommand{\sectionuoc}{ m }{
	\__px_sectionuoc:n {#1}	
}
\NewDocumentCommand{\subsectionuoc}{ m }{
	\__px_subsectionuoc:n {#1}	
}
\NewDocumentCommand{\subsubsectionuoc}{ m }{
	\__px_subsubsectionuoc:n {#1}	
}
\NewDocumentCommand{\HRule}{}{	
	\__px_HRule:	
}
\NewDocumentCommand{\Hrule}{}{
	\__px_Hrule:	
}

\NewDocumentCommand{\PXgrow}{ s O{1} m O{42pt} }{
	\__px_PXgrow:nnnn {#1}{#2}{#3}{#4}	
}
\NewDocumentCommand{\PXfill}{}{
	\__px_PXfill:	
}

\NewDocumentCommand{\PXconfig}{ O{px-config} m m }{
	\keys_set:nn {#1}{ #2 = #3 }
}

\RenewDocumentCommand{\contentsname}{}{
	\tl_use:N \l__px_toc_name_tl
}



