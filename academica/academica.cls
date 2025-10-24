\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{academica}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{prefix={\@currname @opt@}}
\DeclareStringOption[{}]{banner}[{}]
%\DeclareStringOption{banner}
\ProcessKeyvalOptions{\@currname}

\LoadClass[12pt]{book}

%\newif\ifacademica@banner
%\ifx\academica@opt@banner\@empty\else\academica@bannertrue\fi

\def\academica@save#1{\expandafter\let\csname academica@save@#1\expandafter\endcsname\csname#1\endcsname}
\def\academica@restore#1{\expandafter\let\csname#1\expandafter\endcsname\csname academica@save@#1\endcsname}
\def\@ifplus#1{\@ifnextchar+{\@firstoftwo{#1}}}

\def\academica@nonegiven#1{\ClassError{academica}{No \expandafter\string\csname#1\endcsname\space given}{Provide an \expandafter\string\csname#1\endcsname.}}
\def\@author{\academica@nonegiven{author}}
\def\@date{\begingroup\expandafter\advance\expandafter\year\ifnum\month>3 -1 \else -2 \fi\the\year-\advance\year1 \the\year\endgroup}

\RequirePackage{graphicx}


\RequirePackage{setspace}
\RequirePackage[a4paper]{geometry}

%\addto\captionsenglish{%
\def\abstractname{Abstract}%
\def\acknowledgementsname{Acknowledgements}%
\def\authorcontactsname{Author's Contacts}%
\def\candidatename{Candidate}%
\def\chairname{Chair}%
\def\conclusionsname{Conclusions}%
\def\cosupervisorname{Co-Supervisor}%
\def\cosupervisorsname{Co-Supervisors}%
\def\cyclename{Cycle}%
\def\datename{Academic Year}%
\def\indexname{Index}%
\def\institutecontactsname{Institute Contacts}%
\def\introductionname{Introduction}%
\def\prefacename{Preface}%
\def\reviewername{Reviewer}%
\def\reviewersname{Reviewers}%
\def\shortdatename{A.Y.}%
\def\summaryname{Summary}%
\def\supervisorname{Supervisor}%
\def\supervisorsname{Supervisors}%
\def\thesisname{\ifcase\academica@target Bachelor\space\or Master\space\or Ph.D.~\fi Thesis in \\ \academica@course}%
\def\tutorname{Tutor}%
\def\tutorsname{Tutors}%
%}


\RequirePackage{pgffor}
\RequirePackage{color}
% \def\mylist\ifx\ifacademica@banner\@empty\else\academica@opt@banner\fi
\gdef\academica@banner{%
  \foreach \b in \academica@opt@banner {\includegraphics[width=\textwidth]{banners/\b.pdf}\\}
  \ifx\academica@opt@banner\@empty \textcolor{white}{\rule{\textwidth}{40pt}}\fi%
  \vfill
}
% \gdef\academica@universityAaau{%
% 	\includegraphics[width=\textwidth]{banners\ifx\academica@opt@style\@empty\else/old\fi/banner_aau_\academica@opt@aauheader.pdf}\\
% }
\gdef\academica@uniud{%
	Universit\`a degli Studi di Udine: Dipartimento di Scienze Matematiche, Informatiche e Fisiche\\
	Via delle Scienze, 206, 33100 Udine (IT)\\
	+39 0432 558400\\
	\@ifundefined{url}\texttt\url{https://www.dmif.uniud.it/}
}
\gdef\academica@rights{%
		\textcopyright\ \the\year\ \@author\\ This work is shared under the Creative Commons 4.0 License Attribution-NonCommercial-ShareAlike.%
}

% \def\@true{true}
% \define@key{defentry}{long}[true]{%
%     \def\academica@de@a{#1}%
%     \ifx\@true\academica@de@a\let\academica@de@b\long\fi%
% }
% \define@key{defentry}{phd}[true]{%
%     \def\academica@de@a{#1}%
%     \ifx\@true\academica@de@a%
%         \expandafter\let\csname ifacademica@de@c\expandafter\endcsname\csname ifacademica@phd\endcsname%
%     \fi%
% }
% \define@key{defentry}{nonempty}[true]{%
%     \def\academica@de@a{#1}%
%     \ifx\@true\academica@de@a%
%         \expandafter\let\csname ifacademica@de@d\expandafter\endcsname\csname iftrue\endcsname%
%     \fi%
% }
\newcommand\academica@defentry[2][]{
	\let\academica@de@b\relax
	\let\ifacademica@de@c\iftrue
	\let\ifacademica@de@d\iffalse
    \setkeys{defentry}{#1}%
    \ifacademica@de@d%% Either \iftrue or \iffalse
        \@namedef{academica@#2}{\academica@nonegiven{#2}}
    \else
        \expandafter\let\csname academica@#2\endcsname\@empty
    \fi
    \expandafter\academica@de@b\ifacademica@de@c%% Either \iftrue or \ifacademica@phd
        \@namedef{#2}##1{\expandafter\gdef\csname academica@#2\endcsname{##1}}
    \else
        \@namedef{#2}##1{\ClassWarning{\@currname}{\expandafter\string\csname#2\endcsname\space in non-PhD thesis}}
    \fi%
}
% \academica@defentry{chair}
\academica@defentry{contacts}
\academica@defentry{cosupervisor}
% \academica@defentry[nonempty]{course}
% \academica@defentry[phd]{email}
% \academica@defentry[phd]{homepage}
% \academica@defentry[phd]{phdnumber}
% \academica@defentry[phd]{reviewer}
\academica@defentry{rights}
\academica@defentry{supervisor}
% \academica@defentry[phd]{telephone}
% \academica@defentry[phd]{cycle}
\academica@defentry{tutor}

\newsavebox\academica@tmpbox
\def\academica@showentry@#1#2{%
    \expandafter\ifx\csname academica@#2\endcsname\@empty\else%
        \def\academica@varname{\@nameuse{#2name}}%
        #1%% Either \iftrue or \iffalse
            \def\and{\\[\academica@se@and]\gdef\academica@varname{\@nameuse{#2sname}}}%
        \else%
            \let\and\@undefined
        \fi%
        \begin{lrbox}{\academica@tmpbox}\parbox[t]{\linewidth}{\@nameuse{academica@#2}}\end{lrbox}%
        \textsc{\academica@varname}\\[\academica@se@qual]%
        \usebox{\academica@tmpbox}\\[\academica@se@sep]\null%
    \fi%
}
\def\academica@showentry{\@ifstar{\expandafter\academica@showentry@\noexpand\iffalse}{\expandafter\academica@showentry@\noexpand\iftrue}}

\input{academica.tex}
