\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uniza}[2017/09/20 UNIZA LaTeX Class]

\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=uniza, prefix=uniza@}

% defaults for book
\PassOptionsToClass{a4paper,oneside,openany}{book}

\DeclareBoolOption{nofonts}
\DeclareComplementaryOption{fonts}{nofonts}

\DeclareBoolOption{nobiblatex}
\DeclareComplementaryOption{biblatex}{nobiblatex}

\DeclareBoolOption{nominted}{
  \PassOptionsToPackage{\CurrentOption}{uniza_utils}
}
\DeclareComplementaryOption{minted}{nominted}

\DeclareStringOption[]{backend}

% pass unknown options to book
\DeclareDefaultOption{
	\PassOptionsToClass{\CurrentOption}{book}
}

\ProcessKeyvalOptions*\relax

\ifuniza@nofonts\else
	\PassOptionsToClass{12pt}{book}
\fi

% pass the backend option to uniza_utils
\PassOptionsToPackage{backend=\uniza@backend}{uniza_utils}%

% load the class
\LoadClass{book}

%-----------------------------------------------------------
%                     Encoding
%-----------------------------------------------------------

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

%-----------------------------------------------------------
%                    spacing equation spacing
%-----------------------------------------------------------

\usepackage{etoolbox}
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
%               	UNIZA utils.
%-----------------------------------------------------------

\usepackage[pagelayout]{uniza_utils}

%-----------------------------------------------------------
%                  spacing in StickyNote
%-----------------------------------------------------------
\renewcommand{\stickynotestyle}{\onehalfspacing}

%-----------------------------------------------------------
%               	Bibliography
%-----------------------------------------------------------

\ifuniza@nobiblatex
	% if not using biblatex, we want to use:
	\usepackage[square,comma,sort&compress,numbers]{natbib}
\else
	\usepackage[style=iso-numeric]{biblatex}
	
	\appto{\bibsetup}{\sloppy}
	
	\setcounter{biburllcpenalty}{7000}
	\setcounter{biburlucpenalty}{8000}
	
	\defbibheading{unchapter}{\unchapter{#1}}
\fi

%-----------------------------------------------------------
%              	Item spacing in enumerate.
%-----------------------------------------------------------

% change list item spacing
\setitemize{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}
\setenumerate{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}

%-----------------------------------------------------------
%               Fonts, paragraphs.
%-----------------------------------------------------------

% fonts
\ifuniza@nofonts\else
	\usepackage{newtxtext,newtxmath} % must come before minted
	\renewcommand*\ttdefault{lmvtt}
\fi

%-----------------------------------------------------------
%               	Listings defaults.
%-----------------------------------------------------------

% Turn off attaching.
\setkeys{inputcode}{noattach=true}
\setkeys{inlinecode}{noattach=true}

%-----------------------------------------------------------
%                	Metadata macros
%-----------------------------------------------------------

\newcommand{\subtitle}[1]{\def\Subtitle{#1}}
\newcommand{\academicyear}[1]{\def\AcademicYear{#1}}

\newcommand{\doctype}[1]{\def\Doctype{#1}}
\newcommand{\docid}[1]{\def\DocID{#1}}
\newcommand{\supervisor}[1]{\def\Supervisor{#1}}
\newcommand{\consultant}[1]{\def\Consultant{#1}}
\newcommand{\reviewer}[1]{\def\Reviewer{#1}}

\newcommand{\university}[1]{\def\University{#1}}
\university{Žilinská univerzita v Žiline}
\newcommand{\faculty}[1]{\def\Faculty{#1}}
\newcommand{\facultyshort}[1]{\def\FacultyShort{#1}}
\newcommand{\department}[1]{\def\Department{#1}}
\newcommand{\supervisorinst}[1]{\def\SupervisorInst{#1}}
\supervisorinst{\University, \Faculty\par\Department}

\newcommand{\submissionyear}[1]{\def\SubmissionYear{#1}}
\newcommand{\location}[1]{\def\Location{#1}}
\newcommand{\fieldofstudy}[1]{\def\FieldOfStudy{#1}}
\newcommand{\studyprogramme}[1]{\def\StudyProgramme{#1}}

\newcommand{\keywords}[1]{\def\Keywords{#1}}
\newcommand{\keywordsName}[1]{\def\KeywordsName{#1}}
\newcommand{\keywordsSecLang}[1]{\def\KeywordsSecLang{#1}}
\newcommand{\keywordsNameSecLang}[1]{\def\KeywordsNameSecLang{#1}}

\newcommand{\abstract}[2]{
\def\AbstractName{#1}
\def\Abstract{#2}
}

\newcommand{\abstractSecLang}[2]{
\def\AbstractNameSecLang{#1}
\def\AbstractSecLang{#2}
}

\newcommand{\annotation}[2]{
\def\AnnotationName{#1}
\def\Annotation{#2}
}

\newcommand{\annotationSecLang}[2]{
\def\AnnotationNameSecLang{#1}
\def\AnnotationSecLang{#2}
}

\newcommand{\acknowledgements}[1]{\def\Acknowledgements{#1}}

%-----------------------------------------------------------
%                Figure numbering, ordering
%-----------------------------------------------------------

% if chapters exist, number by chapters, otherwise by sections
\def\numberby{chapter}

%2-level equation numbering
\numberwithin{equation}{chapter}
%2-level figure numbering
\numberwithin{figure}{chapter}
%2-level table numbering
\numberwithin{table}{chapter}

% keep floats in their sections
%\RequirePackage[section]{placeins}

%-----------------------------------------------------------
%              		Settings.
%-----------------------------------------------------------

% Path to graphics.
\graphicspath{{images/}}

% Decimal mark.
\usepackage{siunitx}
\sisetup{output-decimal-marker = {,}}

%-----------------------------------------------------------
%              	Bibliography styling
%-----------------------------------------------------------

%\AtBeginBibliography{
%	\fontencoding{T1}
%	\fontseries{m}
%	\fontsize{12}{15}
%	\selectfont
%}

%-----------------------------------------------------------
%              List style for acro dictionary
%-----------------------------------------------------------

\newlist{dict}{description}{1}
\setlist[dict]{
	style=unboxed,
	labelindent=0pt,
	itemindent=0pt,
	listparindent=0pt,
  	leftmargin=0cm,
  	font=\addcolon
}
\DeclareAcroListStyle{dictstyle}{list}{ list = dict }

\newlist{subdict}{description}{1}
\setlist[subdict]{
	style=nextline,
	leftmargin=0cm,
	labelindent=0cm,
	itemindent=1cm,
	listparindent=0pt,
  	font=\normalfont\textit
}

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
  \lhead{\FacultyShort}
  \rhead{\MakeUppercase{\Doctype}}
  \renewcommand{\headrulewidth}{0pt} % remove lines as well
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
  \lhead{\FacultyShort}
  \rhead{\MakeUppercase{Prílohová čast}}
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
		\centering\Large
		
		\textbf{\MakeUppercase{\University}}
		
		\MakeUppercase{\Faculty}
	
	\endgroup
	
	\vfill
	
	\begingroup
		\centering
		\huge \MakeUppercase{\Doctype}
		
	\endgroup
	
	\vfill
	
	\begingroup
	\centering\Large	
	
	\MakeUppercase{\Author}
	
	\textbf{\Title}
	
	\@ifundefined{Subtitle}{}{{\large \textbf{\Subtitle}}}
	
	\endgroup
	
	\vfill

	\begingroup
		\centering\normalsize
		\@ifundefined{Supervisor}{}{%
		Vedúci práce: \Supervisor}
		
		Evidenčné číslo: \DocID
		
		\Location, \SubmissionYear
		
	\endgroup

\endgroup
\clearpage
}

\newcommand{\StudyProgrammeName}{Študijný program}
\newcommand{\FieldOfStudyName}{Študijný odbor}
\newcommand{\SupervisorInstName}{Školiace pracovisko}

% maketitle
\renewcommand{\maketitle}{
\clearpage
\thispagestyle{frontpage}

\begingroup
	\setlength{\parindent}{0pt}
	\begingroup
		\centering\Large
		
		\textbf{\MakeUppercase{\University}}
		
		\MakeUppercase{\Faculty}
	
	\endgroup
	
	\vfill
		
	\begingroup
		\centering
		\huge \MakeUppercase{\Doctype}
		
	\endgroup
	
	\vfill
	
	\begingroup
	\centering\Large	
	
	\MakeUppercase{\Author}
	
	\textbf{\Title}
	
	\@ifundefined{Subtitle}{}{{\large \textbf{\Subtitle}}}
	
	\endgroup
	
	\vfill
	
	\@ifundefined{StudyProgramme}{}{%
	\StudyProgrammeName: \StudyProgramme \\}
	\@ifundefined{FieldOfStudy}{}{%
	\FieldOfStudyName: \FieldOfStudy \\}
	\@ifundefined{SupervisorInst}{}{%
	\SupervisorInstName:
	\begin{alignedpage}{\columnwidth}
	\SupervisorInst
	\end{alignedpage}}
	\@ifundefined{Supervisor}{}{%
	Vedúci práce: \Supervisor \\}
	\@ifundefined{Consultant}{}{%
	Konzultant: \Consultant \\}
	
	% fix spacing if there was nothing after alignedpage
	\@ifundefined{Supervisor}{%
		\@ifundefined{Consultant}{%
			\mbox{}
		}{}%
	}{}%
		
	\begingroup
	\centering
	
	\Location, \SubmissionYear

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
	
		\Large \MakeUppercase{Anotačný záznam -- \Doctype}
	
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
		
		\@ifundefined{Supervisor}{}{%
		\textbf{Vedúci práce:} \Supervisor \\}
		\@ifundefined{Consultant}{}{%
		\textbf{Konzultant:} \Consultant \\}
		\@ifundefined{Reviewer}{}{%
		\textbf{Recenzent:} \Reviewer}
		
		\vskip 1cm minus 1cm
		
		\textbf{Dátum odovzdania práce:} \Date
	\endgroup
\endgroup
\clearpage
}

\newcommand{\makeacknowledgements}{
	\@ifundefined{Acknowledgements}{}{
		\clearpage
		
		\vspace*{\fill}\vspace*{\fill}
		
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

\newcommand{\makeDeclaration}{
	\newpage\thispagestyle{empty}
	\vspace*{\fill}
	
	{\centering \large \MakeUppercase{Čestné vyhlásenie}\\[1em]}
	
	Vyhlasujem, že som zadanú prácu vypracoval samostatne, pod odborným vedením vedúceho práce, ktorým bol \Supervisor\ a používal som len literatúru uvedenú v práci.
	
	Súhlasím so zverejnením práce a jej výsledkov.
	
	\vspace{2.5em}
	
	\Date, Žilina
	
	{\raggedleft\SignatureBox{podpis}\\}
	
	\vfill
}
