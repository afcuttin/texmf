\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{e4esslayout}[2020/02/12 E4ESS document layout]

\RequirePackage{xkeyval} % for option processing

\def\KomaClassToLoad{scrbook} % default class is book

\DeclareOptionX{article}{%
    \gdef\KomaClassToLoad{scrartcl}}
\DeclareOptionX{report}{%
    \gdef\KomaClassToLoad{scrreprt}}
\DeclareOptionX{book}{%
    \gdef\KomaClassToLoad{scrbook}}
\DeclareOptionX{letter}{%
    \gdef\KomaClassToLoad{scrlttr2}}
\newif\ifnoesslogo
\DeclareOptionX{noesslogo}{\noesslogotrue}

%:pass unrecognised options off to \KomaClassToLoad
\DeclareOptionX*{%
    \PassOptionsToClass{\CurrentOption}{\KomaClassToLoad}}
%:process options
\ProcessOptionsX
%:load \KomaClassToLoad
\LoadClass{\KomaClassToLoad}% add options if desired

\KOMAoptions{% a4paper is the default for all Koma classes
	  headheight = 53.3pt,
	  footheight = 56.14pt,
	overfullrule = true,
	         toc = listof,
	 headsepline = true,
	       index = totoc,
	        BCOR = 5mm,
	         DIV = 12,
}

% Load required packages
\RequirePackage[%
	manualmark,
	headsepline,
	footsepline,
	plainheadsepline,
	plainfootsepline,
	% footbotline,
]{scrlayer-scrpage}
\RequirePackage{tabularx} % titlepage
\RequirePackage{booktabs} % titlepage
\RequirePackage{xparse}
\RequirePackage{adjustbox} % titlepage footer
\RequirePackage{graphicx} % logos in heading
\RequirePackage{amsmath}

% Document informations commands
\newcommand\ApprovedBy[1]{\renewcommand\@ApprovedBy{#1}}
\newcommand\@ApprovedBy{%
	\ClassWarning{e4esslayout}{No \noexpand\ApprovedBy name given}
}
\newcommand\CheckedBy[1]{\renewcommand\@CheckedBy{#1}}
\newcommand\@CheckedBy{%
	\ClassWarning{e4esslayout}{No \noexpand\CheckedBy name given}
}
\newcommand\DateApproved[1]{\renewcommand\@DateApproved{#1}}
\newcommand\@DateApproved{%
	\ClassWarning{e4esslayout}{No \noexpand\DateApproved given}
}
\newcommand\DateChecked[1]{\renewcommand\@DateChecked{#1}}
\newcommand\@DateChecked{%
	\ClassWarning{e4esslayout}{No \noexpand\DateChecked given}
}
\newcommand\DocumentType[1]{\renewcommand\@DocumentType{#1}}
\newcommand\@DocumentType{%
	\ClassWarning{e4esslayout}{No \noexpand\DocumentType given}
}
\newcommand\DocumentNumber[1]{\renewcommand\@DocumentNumber{#1}}
\newcommand\@DocumentNumber{%
	\ClassWarning{e4esslayout}{No \noexpand\DocumentNumber given}
}
\newcommand\DocumentDate[1]{\renewcommand\@DocumentDate{#1}}
\newcommand\@DocumentDate{%
	\ClassWarning{e4esslayout}{No \noexpand\DocumentDate given}
}
\newcommand\DocumentRevision[1]{\renewcommand\@DocumentRevision{#1}}
\newcommand\@DocumentRevision{%
	\ClassWarning{e4esslayout}{No \noexpand\DocumentRevision given}
}
\newcommand\DocumentStatus[1]{\renewcommand\@DocumentStatus{#1}}
\newcommand\@DocumentStatus{%
	\ClassWarning{e4esslayout}{No \noexpand\DocumentStatus given}
}
\newcommand\DocumentClassification[1]{\renewcommand\@DocumentClassification{#1}}
\newcommand\@DocumentClassification{%
	\ClassWarning{e4esslayout}{No \noexpand\DocumentClassification given}
}

% page headings commands
\newcommand{\DocumentDetailsHeading}{
	\bgroup\renewcommand*{\arraystretch}{.85}
	% \begin{tabular}{@{} r @{:\ } l @{}}
	\begin{tabular}{@{} r @{:\ } l @{}}
		Document type         & \@DocumentType \\
		Document number       & \@DocumentNumber \\
		Date                  & \@DocumentDate \\
		Revision              & \@DocumentRevision \\
		Status                & \@DocumentStatus \\
		Confidentiality level & \@DocumentClassification
	\end{tabular}
	\egroup
}
\newcommand{\LogosInHeading}{
	\includegraphics[height=47pt]{GECI-TMP-9-rev01IT-crop.pdf}
	\ifnoesslogo
		% Elettra logo only
	\else
		\hspace{1em}
		\includegraphics[height=47pt]{ESS-logo-cropped.png}
	\fi
}

\setkomafont{pagehead}{\scriptsize\sffamily\upshape}

% page footer command
\newcommand{\FirstPageFooter}{
	\scriptsize\sffamily\upshape
	\textbf{Elettra Sincrotrone Trieste S.C.p.A}\\%
	\begin{adjustbox}{max width=\textwidth}
		\bgroup\renewcommand*{\arraystretch}{.87} % set footheight=50pt in the documentclass options
			% \small
			\begin{tabular}{@{} l | l | l | l @{}}
			S.S. 14 Km 163,5 in Area Science Park & P.IVA e C.F. IT00697920320                     & Iscritta al registro delle imprese di Trieste & Organizzazione con sistema \\
			34149 Basovizza, Trieste, Italy       & Cap. Soc. E 47.632.663,00 i.v.                 & Società di interesse nazionale                & di gestione ISO 9001 e \\
			T. +39 040 37581                      & PEC: sinctrotrone.trieste.elettra@legalmail.it & ai sensi dell'art. 10, comma 4,               & OHSAS 18001 certificato da \\
			F. +39 040 938 0903                   & www.elettra.eu                                 & L. 19 ottobre 1999 n.370                      & Bureau Veritas Italia S.p.A \\
			\end{tabular}
		\egroup
	\end{adjustbox}
}

% page headings after titlepage
\rehead*{\DocumentDetailsHeading}
\rohead*{\DocumentDetailsHeading}
\lehead*{\LogosInHeading}
\lohead*{\LogosInHeading}

% titlepage heading and footer
\newpairofpagestyles{firstpage}{%
	\ihead{\LogosInHeading}
	\ohead{\DocumentDetailsHeading}
	\ifoot{\FirstPageFooter}
	\cfoot{}
	\ofoot{}
}

% titlepage
\renewcommand*{\maketitle}{%
	\begin{titlepage}
		\thispagestyle{firstpage}
		\sffamily
		\vspace*{.3\textheight}
		\noindent{%
			\Huge
			\itshape
			\bfseries
			\@title
			\par
		}
		\vspace*{\baselineskip}
		{\hrule height .9pt}
		\vspace{1\baselineskip}
		\noindent{%
			\itshape
			\Large
			\@subtitle
			\par
		}
		\vfill
		\begin{center}
			\small
			\centering
			\begin{tabularx}{\textwidth}{XXlXl}
				\emph{Author} & \emph{Approved by} & \emph{Date} & \emph{Checked by} & \emph{Date} \\
				\midrule
				\@author & \@ApprovedBy & \@DateApproved & \@CheckedBy & \@DateChecked \\
				\midrule
			\end{tabularx}
		\end{center}
		\vspace*{.2\textheight}
	\end{titlepage}
}

% set format for page numbers
\setkomafont{pagenumber}{\small\sffamily\upshape}
\renewcommand\pagemark{{\usekomafont{pagenumber}\thepage\ of \pageref{LastPage}}}

% Font
% Palatino for rm and math | Helvetica for ss | Courier for tt
\RequirePackage{mathpazo} % math & rm
\linespread{1.1}        % Palatino needs more leading (space between lines)
\RequirePackage[scaled]{helvet} % ss
\RequirePackage{courier} % tt

% Define change log section
\newcommand\changelogname{Change Log}
\@ifundefined{chapter}{%
	% code for article (no chapter defined)
	\newcommand\changelog{%
		\section*{\changelogname}
		\addcontentsline{toc}{section}{\changelogname}
	}
}{%
	% code for book
	\newcommand\changelog{%
		\chapter*{\changelogname}
		\addcontentsline{toc}{chapter}{\changelogname}
	}
}

% % other ways to define the same thing
% \ifdefined\chapter
% 	\newcommand\changelog{\chapter*{\changelogname}}
% 	\addcontentsline{toc}{chapter}{\changelogname}
% \else
% 	\newcommand\changelog{\section*{\changelogname}}
% 	\addcontentsline{toc}{section}{\changelogname}
% \fi

% \@ifclassloaded{scrbook}{%
% 	% code for scrbook
% 	\newcommand{\changelog}{\chapter*{\changelogname}
% 	\addcontentsline{toc}{chapter}{\changelogname}
% }{% else clause
% 	\@ifclassloaded{scrartcl}{%
% 		% code for scrartcl
% 		\newcommand\changelog{\section*{\changelogname}}
% 		\addcontentsline{toc}{section}{\changelogname}
% 	}{%
% 	% else clause
% 		\@ifclassloaded{scrreprt}{%
% 		% code for scrreprt
% 		}{%
% 		% else clause
% 			\@ifclassloaded{scrlttr2}{%
% 			% code for scrlttr2
% 			}{%
% 			% else clause
% 			}%
% 		}%
% 	}%
% }

\RequirePackage[figure,table]{totalcount}
\newcommand{\AutoHideLoF}{
	\iftotalfigures
	  \listoffigures
	\fi
}
\newcommand{\AutoHideLoT}{
	\iftotaltables
	  \listoftables
	\fi
}

\RequirePackage[pdfusetitle,final]{hyperref}
\hypersetup{
	% bookmarksopen=true
	hidelinks,
	% colorlinks,
	% pdfinfo={
	% 	Author={},
	% 	Subject={},
	% 	Title={},
 %   }
}

\RequirePackage[open,openlevel=1]{bookmark} % to load after hyperref
\RequirePackage[noabbrev]{cleveref} % packages to load by last, as recommended by the manual

\newcommand{\otoprule}{\midrule[\heavyrulewidth]} % vertically centered with respect to the row above and below, but same thickness as \{top,bottom}rule

% Change log environment
\RequirePackage{xltabular}
\RequirePackage{environ}

\NewEnviron{chnglog}[1][\@nil]{%
	\changelog
	\def\tmp{#1}%
	\ifx\tmp\@nnil
		% no argument - no semantic versioning description
	\else
		% argument #1 (can be anything) - add semantic versioning description
		Changes are tracked following the semantic versioning for documents\footnote{\url{https://semverdoc.org/}} approach.
		For a given version increment $M.m.p$
		\begin{itemize}
			\setlength{\itemsep}{0pt}
		    \setlength{\parskip}{0pt}
		    \setlength{\parsep}{0pt}
			\item[$M$] denotes a \emph{major} release of the document, containing significant changes;
			\item[$m$] denotes a \emph{minor} version, when information has been added or removed;
			\item[$p$] denotes a \emph{patch}, when minor changes are made (like fixing typos or layout).
		\end{itemize}
		% Increase of a counter resets the rightmost one(s).
	\fi
	\noindent
	\begin{xltabular}{\textwidth}{@{}clX@{}}
	% \caption{}\\
	\toprule
	\textbf{Version} & \textbf{Date} & \textbf{Modification}\\
	\otoprule
	\endfirsthead
	\toprule
	\textbf{Version} & \textbf{Date} & \textbf{Modification}\\
	\otoprule
	\endhead
	% \bottomrule
	\multicolumn{3}{r}{\scriptsize Continued on the next page} \\
	\endfoot
	\bottomrule
	\endlastfoot
	\BODY
	\end{xltabular}
	\clearpage
}
\NewDocumentCommand{\signal}{m}{\textsf{#1}}
\NewDocumentCommand{\hmibutton}{m}{\textsf{\textsc{#1}}}