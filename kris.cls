\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kris}[2017/09/20 KRIS LaTeX Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax

\LoadClass[12pt,a4paper,oneside,openany]{book}

%-----------------------------------------------------------
%               Fonts, paragraphs.
%-----------------------------------------------------------

% fonts
\usepackage{newtxtext,newtxmath} % must come before minted
\renewcommand*\ttdefault{lmvtt}

% 1.5 line spacing; this has to go before the geometry package!
\usepackage[doublespacing,nodisplayskipstretch]{setspace}

% paragraph spacing
\setlength{\parskip}{0.1cm}

% equation spacing
\appto\normalsize{%
  \setlength\abovedisplayskip{0.75em}%
  \setlength\belowdisplayskip{0.25em}%
  \setlength\abovedisplayshortskip{0.75em}%
  \setlength\belowdisplayshortskip{0.25em}%
}%

%-----------------------------------------------------------
%               	KRIS utils.
%-----------------------------------------------------------

\usepackage[document,pagelayout,placement]{kris_utils}

%-----------------------------------------------------------
%                        Page layout
%-----------------------------------------------------------

% empty pages should have no header and footer
\defgeometry{empty}{}

\defgeometry{default}{}
\fancypagestyle{default}{
  \pagenumbering{arabic}
  \fancyhf{}% remove everything
  \rfoot{\thepage}
  \rhead{\leftmark}
  \renewcommand{\headrulewidth}{1pt} % remove lines as well
  \renewcommand{\footrulewidth}{0pt}
  
  \fancypagestyle{plain}{
    \fancyhf{}% remove everything
    \rfoot{\thepage}
%    \rhead{\leftmark}
    \renewcommand{\headrulewidth}{0pt} % remove lines as well
    \renewcommand{\footrulewidth}{0pt}
  }
}

% we apply the defaults here
\pagestyle{default}

\defgeometry{frontpage}{}
\fancypagestyle{frontpage}{
  \pagenumbering{gobble}
  \fancyhead{} % remove everything
  \fancyfoot{} % remove everything
  \renewcommand{\headrulewidth}{0pt} % remove lines as well
  \renewcommand{\footrulewidth}{0pt}
%  \rhead{\begin{flushright}\thepage\end{flushright}}
  
  \fancypagestyle{plain} {
	\fancyhead{} % remove everything
	\fancyfoot{} % remove everything
	\renewcommand{\headrulewidth}{0pt} % remove lines as well
	\renewcommand{\footrulewidth}{0pt}
%	\rhead{\begin{flushright}\thepage\end{flushright}}
  }
}

\defgeometry{frontmatter}{}
\fancypagestyle{frontmatter}{
  \pagenumbering{roman}
  \fancyhead{} % remove everything
  \fancyfoot{} % remove everything
  \renewcommand{\headrulewidth}{0pt} % remove lines as well
  \renewcommand{\footrulewidth}{0pt}
  \rfoot{\thepage}
  
  \fancypagestyle{plain} {
	\fancyhead{} % remove everything
	\fancyfoot{} % remove everything
	\renewcommand{\headrulewidth}{0pt} % remove lines as well
	\renewcommand{\footrulewidth}{0pt}
	\rfoot{\thepage}
  }
}

% Backmatter pagestyle.
\defgeometry{backmatter}{}
\fancypagestyle{backmatter}{
  \pagenumbering{Roman}
  \fancyhead{} % remove everything
  \fancyfoot{} % remove everything
  \rfoot{\thepage}
  \renewcommand{\headrulewidth}{0pt} % remove lines as well
  \renewcommand{\footrulewidth}{0pt}
  
  \fancypagestyle{plain} {
	\fancyhead{} % remove everything
	\fancyfoot{} % remove everything
	\rfoot{\thepage}
	\renewcommand{\headrulewidth}{0pt} % remove lines as well
	\renewcommand{\footrulewidth}{0pt}
  }
}

% Appendix pagestyle.
\defgeometry{appendix}{}
\fancypagestyle{appendix}{
  \pagenumbering{Roman}
  \fancyhead{} % remove everything
  \fancyfoot{} % remove everything
  \rhead{\textsc{Prílohová čast}}
  \rfoot{\thepage}
  \renewcommand{\headrulewidth}{1pt} % remove lines as well
  \renewcommand{\footrulewidth}{0pt}
  
  \fancypagestyle{plain} {
	\fancyhead{} % remove everything
	\fancyfoot{} % remove everything
	\rfoot{\thepage}
	\renewcommand{\headrulewidth}{0pt} % remove lines as well
	\renewcommand{\footrulewidth}{0pt}
  }
}

%-----------------------------------------------------------
%              		Chapter headings
%-----------------------------------------------------------

\usepackage{titlesec}

% part
\titleformat{\part}[display]
{\thispagestyle{empty}\centering\normalfont\Huge\bfseries\scshape}
{\textsc{\partname} \thepart}
{0pt}
{}

% chapter
\titleformat{\chapter}[hang]
{\huge\bfseries\scshape}
{\thechapter\;|\;}
{0pt}
{}

\appto{\appendix}{
	\titleformat{\chapter}[hang]
	{\huge\bfseries\scshape}
	{\appendixname~\thechapter\;|\;}
	{0pt}
	{}
}

\titlespacing*{\chapter}{0pt}{0.5cm}{1.5cm}

\renewcommand{\chaptermark}[1]{
	\markboth{\textsc{\ifnum \c@secnumdepth >\m@ne 
%	\@chapapp \
	\thechapter . \fi #1}}{}
}

% section
\titleformat{\section}[hang]
{\Large\bfseries}
{\thesection\;}
{0pt}
{}

\titlespacing*{\section}{0pt}{0.5em}{0.25em}

% subsection
\titleformat{\subsection}[hang]
{\large\bfseries}
{\thesubsection\;}
{0pt}
{}

\titlespacing*{\subsection}{0pt}{0.5em}{0.25em}

% subsubsection
\titlespacing*{\subsubsection}{0pt}{0.5em}{0.25em}

%paragraph
\titlespacing*{\paragraph}{0pt}{0.5em}{1em}

%-----------------------------------------------------------
%               Title page and cover macros
%-----------------------------------------------------------

% makecover
\newcommand{\makecover}{
\clearpage
\thispagestyle{frontpage}

\begingroup
	\setlength{\parindent}{0pt}
	\begingroup
		\centering
		
		\Large Žilinská univerzita v Žiline
		
		\large Elektrotechnická fakulta
	
	\endgroup
	
	\vspace{2.55cm}
	
	\begingroup
		\large \DocID
	\endgroup
	
	\vfill
	
	\begingroup
		\centering
		
		\Large \MakeUppercase{\Title}
		
		\normalsize \MakeUppercase{\Doctype}
	
	\endgroup
	
	\vfill
	
	\begingroup
		\large 2017
		
		\Author
	\endgroup

\endgroup
\clearpage
}

% maketitle
\renewcommand{\maketitle}{
\clearpage
\thispagestyle{frontpage}

\begingroup
	\setlength{\parindent}{0pt}
	\begingroup
		\centering
		
		\Large Žilinská univerzita v Žiline
		
		\large Elektrotechnická fakulta
		
		\large Katedra riadiacich a informačných systémov
	
	\endgroup
			
	\vfill
	
	\begingroup
		\centering
		
		\Large \MakeUppercase{\Title}
		
		\normalsize \MakeUppercase{\Doctype}
	
	\endgroup
	
	\vfill
	
	\begingroup
		\normalsize				
		Študijný program: Riadenie procesov \\
		Študijný odbor: 5.2.14 Automatizácia \\
		\begin{alignedtext}{@{}l@{ }l}
		Školiace pracovisko:& Žilinská univerzita v Žiline, Elektrotechnická fakulta,\\
		& Katedra riadiacich a informačných systémov
		\end{alignedtext} \\
		Vedúci diplomovej práce: \Supervisor \\
		\@ifundefined{Consultant}{}{
		Konzultant: \Consultant \\
		}
	\endgroup
		
	\vspace{2cm}
	
	\begingroup
		\normalsize Žilina, 2017
		
		\Author
	\endgroup
	
\endgroup
\clearpage
}

% makeabstract
\newcommand{\makeabstract}{
\clearpage

\vspace*{\fill}
\vspace{-5em}

\section*{\AbstractName}
\Abstract

\noindent \textbf{\KeywordsName:} \Keywords

\vspace*{\fill}

\section*{\AbstractNameSecLang}
\AbstractSecLang

\noindent \textbf{\KeywordsNameSecLang:} \KeywordsSecLang

\vspace*{\fill}

\clearpage
}

% makeannotation
\newlength{\annotationSpacing}
\setlength{\annotationSpacing}{0.6cm}

\newcommand{\makeannotation}{
\clearpage
\begingroup
	\titlespacing*{\subsubsection}{0cm}{0cm}{0cm}

	\setlength{\parindent}{0pt}
	\begingroup
		\centering
		\linespread{1}
		
		\Large Žilinská univerzita v Žiline, Elektrotechnická fakulta \\
		Katedra riadiacich a informačných systémov
	
		\vspace{\annotationSpacing}
	
		\Large \MakeUppercase{Anotačný záznam -- diplomová práca}
	
	\endgroup
	
	\vspace{\annotationSpacing}
	
	\begingroup
		\normalsize
		
		\textbf{Meno a priezvisko:} \Author \hfill \textbf{Akademický rok: \AcademicYear} \\
		\textbf{Názov práce:} \Title
		
		\vspace{\annotationSpacing}
		
		\begin{tabular}{@{}p{0.33\textwidth}p{0.33\textwidth}p{0.33\textwidth}}
		\textbf{Počet strán:} \theTotPages&
		\textbf{Počet obrázkov:} \totalfigures &
		\textbf{Počet tabuliek:} \totaltables \\
		
		\textbf{Počet kapitol:} \total{truechapters} &
		\textbf{Počet príloh:} \total{appendixchapters} &
		\textbf{Počet použit. lit.:} \total{citenum}
		\end{tabular}
		
		\vskip 1cm minus 1cm
		\subsubsection*{\AnnotationName:}
		\Annotation
		
		\vskip 1cm minus 1cm
		\subsubsection*{\AnnotationNameSecLang:}
		\AnnotationSecLang

		\vskip 1cm minus 1cm
		\subsubsection*{\KeywordsName:}
		\Keywords
		
		\vskip 1cm minus 1cm
		
		\textbf{Vedúci diplomovej práce:} \Supervisor \\
		\@ifundefined{Consultant}{}{
		\textbf{Konzultant:} \Consultant \\}
		\textbf{Recenzent:} \Reviewer
		
		\vskip 1cm minus 1cm
		
		\textbf{Dátum odovzdania práce:} \Date
	\endgroup
\endgroup
\clearpage
}

\newcommand{\makeacknowledgements}{
	\@ifundefined{Acknowledgements}{}{
		\clearpage
		
		\vspace*{\fill}
		
		\section*{Poďakovanie}
		
		\Acknowledgements
		
		\vspace*{\fill}
	}
}

\newcommand{\makeAppendixPage}{
% Only display this, if there is at least 1 appendix.
\ifnum\value{appendixchapters@totc}>\z@
	\clearpage
	\thispagestyle{empty}
	
	\phantomsection
	\addcontentsline{toc}{part}{Prílohová časť}
		
	\begingroup
		\setlength{\parindent}{0pt}
		\begingroup
			\centering
			
			\Large Žilinská univerzita v Žiline
			
			\large Elektrotechnická fakulta
		
		\endgroup
		
		\vspace{2.55cm}
		
		\begingroup
			\large \DocID
		\endgroup
		
		\vfill
		
		\begingroup
			\centering
			
			\Large \MakeUppercase{\Title}
			
			\normalsize \MakeUppercase{Prílohová časť}
		
		\endgroup
		
		\vfill
		
		\begingroup
			\large 2017
			
			\Author
		\endgroup
		
		\clearpage
	
	\endgroup

\else
	\relax
\fi
}