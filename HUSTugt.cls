\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HUSTugt}
[2012/05/11 0.2 Huazhong University of Science and Technology Undergraduate Thesis]

\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[12pt, a4paper, openany]{book}

\RequirePackage{ifthen}
\RequirePackage{calc}

\RequirePackage[bookmarks]{hyperref}

% Load AMSLaTeX macro for more mathematical support
\RequirePackage{amsmath, amssymb}

% Load graphicx to support jpg, png, and other figure file types
\RequirePackage{graphicx}

% This macro supports layout figures side by side
% "config" option for backward compatibility
\RequirePackage[config]{subfig}

% Require array macro to support more table styles
\RequirePackage{array}

% Require XeLaTeX
\RequirePackage{fontspec,xltxtra,xunicode}
\setmainfont[Mapping=tex-text]{Times New Roman}
\setsansfont[Mapping=tex-text]{Helvetica}
\setmonofont{Courier}

% Require xeCJK
\RequirePackage{ctex}
% \RequirePackage[BoldFont, CJKmath]{xeCJK}
\setCJKmainfont[ItalicFont={KaiTi}]{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont*{Fangsong}
\xeCJKsetcharclass{"0}{"2E7F}{0}
\xeCJKsetcharclass{"2E80}{"FFFF}{1}

% List bibliography in ToC
\RequirePackage{tocbibind}

% Set the layout
\setlength{\textwidth}{\paperwidth}
\setlength{\textheight}{\paperheight} 
\setlength\marginparwidth{0cm} 
\setlength\marginparsep{0cm} 
\addtolength{\textwidth}{-5.6cm} 
\setlength{\oddsidemargin}{2.8cm-1in} 
\setlength{\evensidemargin}{\oddsidemargin} 
\setlength{\headheight}{0.9cm} 
\setlength{\topskip}{0pt} 
\setlength{\skip\footins}{15pt} 
\setlength{\footskip}{1.3cm} 
\setlength{\topmargin}{3.0cm-1in} 
\setlength{\headsep}{0.5cm} 
\addtolength{\textheight}{-7.0cm} 

% 1.415 is chosen for 1.25x line height after experiments
\linespread{1.415}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 重定义字号命令，采用薛瑞尼版本中关于字号命令的定义，
% 消除了字体大小和行距的紧耦合
% 命令中的可选参数用于指定行距，默认为单倍行距。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% \newlength\HUST@linespace
% \newcommand{\HUST@choosefont}[2]{%
%   \setlength{\HUST@linespace}{#2*\real{#1}}%
%   \fontsize{#2}{\HUST@linespace}\selectfont}
% \newcommand{\chuhao}[1][\baselinestretch]{\HUST@choosefont{#1}{42pt}}
% \newcommand{\xiaochu}[1][\baselinestretch]{\HUST@choosefont{#1}{36pt}}
% \newcommand{\yihao}[1][\baselinestretch]{\HUST@choosefont{#1}{26pt}}
% \newcommand{\xiaoyi}[1][\baselinestretch]{\HUST@choosefont{#1}{24pt}}
% \newcommand{\erhao}[1][\baselinestretch]{\HUST@choosefont{#1}{22pt}}
% \newcommand{\xiaoer}[1][\baselinestretch]{\HUST@choosefont{#1}{18pt}}
% \newcommand{\sanhao}[1][\baselinestretch]{\HUST@choosefont{#1}{16pt}}
% \newcommand{\xiaosan}[1][\baselinestretch]{\HUST@choosefont{#1}{15pt}}
% \newcommand{\sihao}[1][\baselinestretch]{\HUST@choosefont{#1}{14pt}}
% \newcommand{\banxiaosi}[1][\baselinestretch]{\HUST@choosefont{#1}{13pt}}
% \newcommand{\xiaosi}[1][\baselinestretch]{\HUST@choosefont{#1}{12pt}}
% \newcommand{\dawu}[1][\baselinestretch]{\HUST@choosefont{#1}{11pt}}
% \newcommand{\wuhao}[1][\baselinestretch]{\HUST@choosefont{#1}{10.5pt}}
% \newcommand{\xiaowu}[1][\baselinestretch]{\HUST@choosefont{#1}{9pt}}
% \newcommand{\liuhao}[1][\baselinestretch]{\HUST@choosefont{#1}{7.5pt}}
% \newcommand{\xiaoliu}[1][\baselinestretch]{\HUST@choosefont{#1}{6.5pt}}
% \newcommand{\qihao}[1][\baselinestretch]{\HUST@choosefont{#1}{5.5pt}}
% \newcommand{\bahao}[1][\baselinestretch]{\HUST@choosefont{#1}{5pt}}

% Text font is Xiaosi(12 pt), line height is 15 pt (15/12 = 1.25)
% \renewcommand\normalsize{\fontsize{12pt}{15pt}\selectfont}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 定制浮动图形和表格的样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% 表格中的字体比正文小半号，为大五号，11pt，同时表格中的行距为 1.4 倍行距

% 重定义 tabular 环境
\let\HUST@tabular\tabular
\renewcommand\tabular{\dawu[1.4]\HUST@tabular}
\let\endHUST@tabular\endtabular

% 重定义 tabular* 环境
\@namedef{tabular*}#1{\dawu[1.4]%
  \setlength\dimen@{#1}%
  \edef\@halignto{to\the\dimen@}\@tabular}

% 设置标题样式
\long\def\@makecaption#1#2{%
  % 图表标题字体比正文小半号，为大五号，11pt
  \dawu 
  \rmfamily
  \vskip\abovecaptionskip
  % 去掉图表号后面的":"
  \setbox\@tempboxa\hbox{#1~~#2}%
  \ifdim \wd\@tempboxa >\hsize
  % 如果图表标题的长度超过一行，则采用悬挂缩进的方式
  \@hangfrom{#1~~}#2
  \else
  % 如果图表标题的长度不超过一行，则采用居中方式
  \global \@minipagefalse
  \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% 设置标题标签的样式
\def\thefigure{\@arabic\c@figure}
\def\fnum@figure{\figurename~\thefigure}
\def\thetable{\@arabic\c@table}
\def\fnum@table{\tablename~\thetable}

% 设置标题前后间距
\setlength\abovecaptionskip{12bp}
\setlength\belowcaptionskip{12bp}

% 下面两条命令可以使标题编号随着每开始新的一章而重新开始，即按章的顺序编号
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
% \renewcommand{\thesubfigure}{\thefigure--(\arabic{subfigure})}
% 定制引用子图的标记形式
% \renewcommand{\p@subfigure}{:}

% 定义新命令\hlinewd 来改变水平线的粗细
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
  \reserved@a\@xhline}

% 表格行间距增大10%
\renewcommand{\arraystretch}{1.1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Customize cover
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makecover}{
  \pagenumbering{Roman}
  % \begin{titlepage}
    % \HUST@ctitlepage
    % \clearpage\thispagestyle{empty}\HUST@etitlepage
  % \end{titlepage}
  \HUST@makeabstract
  \clearpage
  \phantomsection
  \tableofcontents
  \mainmatter
}

\newcommand{\cabstract}[1]{\renewcommand{\HUST@cabstract}{#1}}
\newcommand{\HUST@cabstract}{}
\newcommand{\ckeywords}[1]{\renewcommand{\HUST@ckeywords}{#1}}
\newcommand{\HUST@ckeywords}{}
\newcommand{\eabstract}[1]{\renewcommand{\HUST@eabstract}{#1}}
\newcommand{\HUST@eabstract}{}
\newcommand{\ekeywords}[1]{\renewcommand{\HUST@ekeywords}{#1}}
\newcommand{\HUST@ekeywords}{}

% 定义中英文摘要
\newcommand{\HUST@makeabstract}{%

  % 定义中文摘要
  \clearpage
  \setcounter{page}{1}
  \phantomsection
  \addtocontents{toc}{\cftpagenumberson{chapter}}
  \addcontentsline{toc}{chapter}{摘~~~~要}
  \chapter*{\abstractname}
  \HUST@cabstract

  \vspace{3ex}
  \noindent\begin{HUST@tabular}{@{}p{4em}@{}p{\textwidth-4em}}
    {\bf 关键词:} & \HUST@ckeywords \\
  \end{HUST@tabular}
  
  % 定义英文摘要
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{Abstract}
  \addtocontents{toc}{\cftpagenumbersoff{chapter}}
  \normalsize
  \chapter*{Abstract}
  \HUST@eabstract

  \vspace{3ex}
  \noindent\begin{HUST@tabular}{@{}p{5em}@{}p{\textwidth-5em}}
    {\bf Keywords:} & \HUST@ekeywords\\
  \end{HUST@tabular}
}

\renewcommand\mainmatter{%
  \clearpage
  \@mainmattertrue
  \pagenumbering{arabic}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Define chapter and section's font
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Support chapter(0), section(1), subsection(2)
\setcounter{secnumdepth}{2}

% \def\@chapter[#1]#2{
%   \ifnum \c@secnumdepth >\m@ne
%   \if@mainmatter
%   \refstepcounter{chapter}%
%   \typeout{\@chapapp.}%
%   \addcontentsline{toc}{chapter}
%   {\protect\numberline{\thechapter}#1}%
%   \else
%   \addcontentsline{toc}{chapter}{#1}%
%   \fi
%   \else
%   \addcontentsline{toc}{chapter}{#1}%
%   \fi
%   \chaptermark{#1}%
%   \@makechapterhead{#2}%
%   \@afterheading
% }

% chapter
% \def\@makechapterhead#1{%
\renewcommand{\@makechapterhead}[1]{%
  \vspace*{24bp}%
  \begingroup
  \bf \zihao{3} \centering
  \ifnum \c@secnumdepth >\m@ne
  \thechapter\hskip1em
  \fi
  \interlinepenalty\@M
  #1\par\endgroup
  \nobreak
  \vskip 20bp
}

% \def\@makeschapterhead#1{%
\renewcommand{\@makeschapterhead}[1]{%
  \vspace*{24bp}%
  \begingroup
  \bf \zihao{3} \centering
  \interlinepenalty\@M
  #1\par\endgroup
  \nobreak
  \vskip 20bp
}

% section
\def\@seccntformat#1{\csname the#1\endcsname\hskip 1em\relax}
\renewcommand\section{\@startsection {section}{1}{\z@}%
  {18bp}%
  {6bp}%
  {\bf\zihao{4}}}

% subsection
\renewcommand\subsection{\@startsection {subsection}{2}{\z@}%
  {12bp}%
  {6bp}%
  {\bf\zihao{-4}}}

% appendix



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Customize format for entries in table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Show chapters and sections in ToC
% chapter(0), section(1), subsection(2), subsubsection(3)
\setcounter{tocdepth}{1}

% Require tocloft to customize title of ToC
\RequirePackage[subfigure]{tocloft}

% Set format of title of ToC to Xiaosan, bold font, centering
\renewcommand{\cfttoctitlefont}{\hfill\bf\zihao{-3}}
\renewcommand{\cftaftertoctitle}{\hfill}

% Reduce the after title skip
\renewcommand{\cftaftertoctitleskip}{2ex}

\cftpagenumbersoff{chapter}
\renewcommand{\cftchapdotsep}{\cftnodots}
\renewcommand{\cftchapfont}{\zihao{-4}\rm}
\renewcommand{\cftchappagefont}{\zihao{-4}\rm}

\renewcommand{\cftsecfont}{\zihao{-4}\rm}
\renewcommand{\cftsecpagefont}{\zihao{-4}\rm}
\setlength{\cftsecindent}{0em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rename English phases to Chinese ones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\contentsname{目\hspace{1em}录}
\renewcommand\listfigurename{插图索引}
\renewcommand\listtablename{表格索引}

\@ifundefined{chapter}
  {\renewcommand\refname{参考文献}}
  {\renewcommand\bibname{参考文献}}

\renewcommand\indexname{索引}
\renewcommand\figurename{图}
\renewcommand\tablename{表}
\newcommand\equname{式}

\renewcommand\appendixname{附录}

\newcommand{\abstractname}{摘\hspace{1em}要}
\newcommand{\eabstractname}{Abstract}