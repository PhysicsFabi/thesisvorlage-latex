%% LaTeX2e class for diploma theses
%% Based on wissdoc.cls by Roland Bless, 1996-2001
%% bless@telematik.informatik.uni-karlsruhe.de
%%
%% Adapted by: Timo Rohrberg, 2009
%% timo.rohrberg@student.kit.edu
%%
%% Additions by: Thorsten Haberecht, IPD - Chair Prof. Bhm, 2010
%% thorsten.haberecht@kit.edu
%%
%% Further modified as Bachelor Thesis by: Philipp Verpoort, 2014
%%
%% Usage as thesis template, Fakultät f. Physik, KIT by: FS Physik KIT, 2014
%% fachschaft@physik.kit.edu





\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{document/thesisclass}
\LoadClass[a4paper,11pt,titlepage]{scrbook}




%% ------------------
%% |    Packages    |
%% ------------------
\input{document/packages/input-me.tex}


%% --------------------------
%% |    Globale Settings    |
%% --------------------------

\setcounter{secnumdepth}{3}           % Numbering also for \subsubsections
\setcounter{tocdepth}{3}              % Register \subsubsections in content dir

\setpapersize{A4}
\setmarginsrb{3cm}{1cm}{3cm}{1cm}     % {leftmargin}{topmargin}{rightmargin}...
             {6mm}{7mm}{5mm}{15mm}    % {bottommargin}{headheight}{headsep}...
                                      % {footheight}{footskip}

\setlength{\marginparwidth}{1.5cm}    % for todos to be positioned correctly
\parindent 0cm                        % do not indent beginning of paragraph
\parskip 1.5ex plus0.5ex minus0.5ex   % Margin between paragraphs


%% ------------------------
%% |    Language Setup    |
%% ------------------------
\newcommand{\SelectLanguage}[1]
{
    \AtBeginDocument
    {
        \selectlanguage{#1}           % babel command

        \iflanguage{ngerman}
        {
            \sisetup{output-decimal-marker={,}}
            % sets , for German and . otherwise
            \sisetup{list-final-separator={ und }}
            % "3, 4 and 5" in English or "3, 4 und 5" in German
            \sisetup{range-phrase={ bis }}
            % "1.5 to 1.8" in English or "1,5 bis 1,8" in German
            \sisetup{locale=DE}
            % e.g. using \cdot instead of \times for floating points
        }
        {
            \sisetup{output-decimal-marker=.}
            \sisetup{list-final-separator={ and }}
            \sisetup{range-phrase={ to }}
        }
    }
}





%% ---------------------------
%% |    Style of captions    |
%% ---------------------------
\newcommand{\changefont}[3]{\fontfamily{#1} \fontseries{#2}%
                            \fontshape{#3} \selectfont}
\newcommand{\chapterheadfont}{}

\renewcommand{\chaptername}{}

\renewcommand{\section}{%
\@startsection{section}%
{1}                                    % Structure level
{0mm}                                  % Indention
{2ex plus 1ex minus 1ex}               % Pre-Margin
{0.5ex plus 0.5ex minus 0.5ex}         % Post-Margin
{\chapterheadfont\large\bfseries}      % Style
}
\renewcommand{\subsection}{%
\@startsection{subsection}%
{2}                                    % Structure level
{0mm}                                  % Indention
{1.5ex plus 1ex minus 0.5ex}           % Pre-Margin
{0.3ex plus 0.3ex minus 0.3ex}         % Post-Margin
{\chapterheadfont\large\bfseries}      % Style
}
\renewcommand{\subsubsection}{%
\@startsection{subsubsection}%
{3}                                    % Structure level
{0mm}                                  % Indention
{1.5ex plus 1ex minus 0.5ex}           % Pre-Margin
{0.2ex plus 0.2ex minus 0.2ex}         % Post-Margin
{\chapterheadfont\normalsize\bfseries} % Style
}
\renewcommand{\paragraph}{%
\@startsection{paragraph}%
{4}                                    % Structure level
{0mm}                                  % Indention
{1.3ex plus 1ex minus 0.3ex}           % Pre-Margin
{0.2ex plus 0.2ex minus 0.2ex}         % Post-Margin
{\chapterheadfont\normalsize\bfseries} % Style
}
\renewcommand{\subparagraph}{%
\@startsection{subparagraph}%
{5}                                    % Structure level
{0mm}                                  % Indention
{1ex plus 1ex minus 0.2ex}             % Pre-Margin
{0.1ex plus 0.1ex minus 0.1ex}         % Post-Margin
{\chapterheadfont\normalsize\bfseries} % Style
}





%% -----------------------------------
%% |    Style of chapter captions    |
%% -----------------------------------
\newlength{\chapnolen}
\newlength{\chapparlen}
\newsavebox{\chapno}
\renewcommand{\@makechapterhead}[1]{
    \vspace*{0.1\textheight}
    \vskip 15\p@
    {\parindent \z@ \raggedright \normalfont
        \ifnum \c@secnumdepth >\m@ne
            \if@mainmatter
                \savebox{\chapno}{\chapterheadfont\huge\bfseries \thechapter.}
                \settowidth{\chapnolen}{\usebox{\chapno}}
                \parbox[t]{\chapnolen}{\usebox{\chapno}}\nobreak\leavevmode
            \fi
        \fi
        \interlinepenalty\@MM
        \setlength{\chapparlen}{\textwidth}
        \addtolength{\chapparlen}{-1.0\chapnolen}
        \addtolength{\chapparlen}{-2ex}
        \leavevmode\nobreak
        \parbox[t]{\chapparlen}%
        {\raggedright\chapterheadfont\huge \bfseries #1\par\nobreak}
        \vskip 30\p@
    }}

\renewcommand{\@makeschapterhead}[1]{
    \vspace*{50\p@}
    {\parindent \z@ \raggedright
        \normalfont
        \interlinepenalty\@M
        \chapterheadfont \huge \bfseries  #1\par\nobreak
        \vskip 40\p@
    }
}





%% ------------------------------------
%% |    Style of content directory    |
%% ------------------------------------
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{{\pdfbookmark{\contentsname}{\contentsname}%
\chapterheadfont\oldtableofcontents}}
\let\@olddottedtocline\@dottedtocline
\renewcommand{\@dottedtocline}[5]{\@olddottedtocline{#1}{#2}{#3}{#4}%
{\chapterheadfont #5}}





%% ------------------------------------------
%% |    Style of appendix and mainmatter    |
%% ------------------------------------------
\newcommand{\FrontMatter}
{
    \frontmatter

    \pagestyle{empty}

    \fancypagestyle{plain}{            % to ensure toc page style is really 
                                       % empty (it uses \thispagestyle{plain})
        \fancyhf{}                     % clear all header and footer fields
        \fancyfoot{}                   % except the center
        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\footrulewidth}{0pt}
    }
}

\newcommand{\MainMatter}
{
    \clearpage

    \begingroup                        % make sure that there is no involuntary 
                                       % blankpage added after toc.
    \let\cleardoubleoddstandardpage\relax
    \mainmatter
    \endgroup

    \frontmatter \pagestyle{empty}

    \fancypagestyle{plain}{            % redefine chapter first page style,
                                       % which is redefined by \FrontMatter
        \fancyhf{}                     % clear all header and footer fields
        \fancyfoot[C]{\thepage}        % except the center
        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\footrulewidth}{0pt}
    }

    \mainmatter
    \pagestyle{fancy}
    \renewcommand{\chaptermark}[1]{\markboth{\chaptername\ %
                                             \thechapter.\ ##1}{}}
    \lhead[\thepage]{\leftmark}\chead[]{}\rhead[\thesispagehead]{\thepage}
    \lfoot{}\cfoot{}\rfoot{}
}

\newcommand{\Appendix}
{
    \clearpage
    \appendix
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \setcounter{figure}{0}
    \setcounter{equation}{0}
    \renewcommand\thesection{\Alph{section}}
    \renewcommand\thefigure{\Alph{section}.\arabic{figure}}
    \renewcommand\thetable{\Alph{section}.\arabic{table}}
    \renewcommand\theequation{\Alph{section}.\arabic{equation}}
    \numberwithin{equation}{section}
    \lhead[\thepage]{Appendix}
}

\newcommand{\TheBibliography}
{
    \clearpage
    \thispagestyle{plain}
}

\newcommand{\emptychapter}[2][]
{
    \addtocounter{chapter}{1}
    \addtocontents{toc}{\protect\contentsline
        {chapter}{\protect\numberline {\thechapter}#2}{#1}{}}
}

%% **** END OF CLASS ****
\endinput
