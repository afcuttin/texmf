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
\RequirePackage{tabularx} % required by titlepage
\RequirePackage{booktabs} % required by titlepage

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
