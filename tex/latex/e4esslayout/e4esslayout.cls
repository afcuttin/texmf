\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{e4esslayout}[2020/02/12 E4ESS document layout]

\LoadClass[]{scrbook}

\KOMAoptions{%
	  headheight = 53.3pt,
	  footheight = 50.1pt,
	   titlepage = firstiscover,
	     % draft = true,
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
\RequirePackage{adjustbox} % titlepage footer
\RequirePackage{lastpage} % page footer
\RequirePackage{graphicx} % logos in heading

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
	\includegraphics[height=47pt]{/home/cuttin/media/logos/elettra/GECI-TMP-9-rev01IT-crop.pdf}
	\hspace{1em}
	\includegraphics[height=47pt]{/home/cuttin/media/logos/ess/ESS-logo-cropped.png}
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
		\noindent{
			\Huge
			\itshape
			\bfseries
			\@title
		}\\[-.3\baselineskip]
		{\hrule height .9pt}
		\vspace{2\baselineskip}
		\noindent{
			\itshape
			\Large
			\@subtitle
		}\\[2\baselineskip]
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
