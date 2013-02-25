%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%             该文类用于提供南京大学本科毕业设计模板
%                 基于 ctex 宏包和 xelatex 编译
%                   设计尽量满足跨平台之需要
%         暂时只能提供少量自定义的符合本科毕设要求的排版效果
%                           版本 v2.0
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NJUbachelor}[2013/02/25 v2.0 NJUbachelor Style for NJUers Created by Zlcao, modified by G.F.]

\newif\ifNJU@thesis
\DeclareOption{thesis}{\NJU@thesistrue}
\DeclareOption{design}{\NJU@thesisfalse}

\newif\ifNJU@oneside
\DeclareOption{oneside}{\NJU@onesidetrue%
  \PassOptionsToClass{oneside}{ctexbook}\PassOptionsToClass{oneside}{ctexart}}
\DeclareOption{twoside}{\NJU@onesidefalse%
  \PassOptionsToClass{twoside}{ctexbook}\PassOptionsToClass{twoside}{ctexart}}

\newif\ifNJU@pageheader
\DeclareOption{pageheader}{\NJU@pageheadertrue}
\DeclareOption{nopageheader}{\NJU@pageheaderfalse}

\newif\ifNJU@chapter
\DeclareOption{chapter}{\NJU@chaptertrue}
\DeclareOption{nochapter}{\NJU@chapterfalse}

\newif\ifNJU@longtitle\NJU@longtitlefalse
\newif\ifNJU@shorttitle\NJU@shorttitlefalse
\newif\ifNJU@manualtitle\NJU@manualtitlefalse
\DeclareOption{longtitle}{\NJU@longtitletrue}
\DeclareOption{shorttitle}{\NJU@shorttitletrue\NJU@longtitlefalse}
\DeclareOption{manualtitle}{\NJU@manualtitletrue\NJU@longtitlefalse}

\newif\ifNJU@shortdepspe
\DeclareOption{shortdepspe}{\NJU@shortdepspetrue}
\DeclareOption{longdepspe}{\NJU@shortdepspefalse}

\newif\ifNJU@notdefaultmath
\DeclareOption{defaultmath}{\NJU@notdefaultmathfalse}
\DeclareOption{mathptm}{\NJU@notdefaultmathtrue\def\NJU@mathpackage{mathptmx}}
\DeclareOption{mathtxf}{\NJU@notdefaultmathtrue\def\NJU@mathpackage{txfonts}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}

\ExecuteOptions{thesis,oneside,nopageheader,nochapter,longtitle,shortdepspe,defaultmath}
\ProcessOptions\relax

% 载入 ctex 文类
\ifNJU@chapter
  \LoadClass[UTF8,adobefonts,a4paper,cs4size,fntef,fancyhdr]{ctexbook}
\else
  \LoadClass[UTF8,adobefonts,a4paper,cs4size,fntef,fancyhdr]{ctexart}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                               宏包
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amsfonts,amssymb,bm} %数学相关宏包支持
\RequirePackage[left=3.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}   %页面设置
\RequirePackage{stmaryrd} %数学字体宏包
\ifNJU@notdefaultmath \RequirePackage{\NJU@mathpackage} \fi
\RequirePackage{graphicx} %提供图形支持
\RequirePackage{picinpar} %图文混排
\RequirePackage{wrapfig} %图文混排 推荐使用
\RequirePackage{subfigure} %子图宏包
\RequirePackage{titletoc} %目录设置宏包
\RequirePackage[nottoc]{tocbibind} %加入目录条目 默认已加入参考文献 但不包含目录本身
\RequirePackage{footnpag} %令每一页脚注从1开始编号。
\RequirePackage[table]{xcolor} %彩色支持
\RequirePackage{longtable} %长表格宏包
\RequirePackage{booktabs} %三线表格宏包
\RequirePackage{tabularx} %定宽度表格宏包
\RequirePackage{multirow} %跨行表格宏包
\RequirePackage{mhchem} %化学式宏包
\RequirePackage{chemfig} %化学式宏包
\RequirePackage[format=hang,font=small,justification=centering,labelfont=sf]{caption} %caption格式定制
\RequirePackage[colorlinks,citecolor=black,linkcolor=black]{hyperref} %PDF标签支持
\RequirePackage{calc}
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{hypernat}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                   本文类中用到的一些自定义指令
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置列表环境
\newenvironment{Description}[1]{\begin{list}{}{%
  \renewcommand{\makelabel}[1]{##1}\settowidth\labelwidth{\makelabel{#1}}%
  \setlength{\leftmargin}{\labelwidth+\labelsep}}}{\end{list}}

% 清除双页
\let\NJU@cleardoublepage\cleardoublepage
\newcommand{\NJU@clearemptydoublepage}{%
  \clearpage{\pagestyle{empty}\NJU@cleardoublepage}}
\let\cleardoublepage\NJU@clearemptydoublepage

% 一种样式
\newcommand{\makesomething}[1]{%
  \begin{center}
    \zihao{3}\songti\bf #1
  \end{center}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                          字体设置
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ctex-xecjk-winfonts.def: Windows 的 xeCJK 字体设置，默认为六种中易字体
% vim:ft=tex
\setmainfont{Times New Roman}

\xeCJKsetup{AutoFakeSlant={true}}

\setCJKmainfont{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{KaiTi}

\setCJKfamilyfont{zhsong}{SimSun}
\setCJKfamilyfont{zhhei}{SimHei}
\setCJKfamilyfont{zhkai}{KaiTi}

\providecommand*{\songti}{\CJKfamily{zhsong}} % 宋体
\providecommand*{\heiti}{\CJKfamily{zhhei}}   % 黑体
\providecommand*{\kaishu}{\CJKfamily{zhkai}}  % 楷书

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                    ctex 中文格式
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\CTEXoptions[
%  contentsname={目录},listfigurename={插图},
%  listtablename={表格},figurename={图},
%  tablename={表},abstractname={},
%  indexname={索引},bibname={参考文献}]
%\ifNJU@chapter
% \CTEXoptions[contentsname={目~~~录},indexname={索~~~引}]
%\else
  \CTEXoptions[contentsname={\makesomething{目~~~~录}},indexname={\makesomething{索~~~~引}}]
%\fi
\CJKsetecglue{}
%\punctstyle{kaiming}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                     标题格式/目录标题格式
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%各部分标题
\CTEXsetup[number=\arabic{chapter},titleformat={\zihao{4}\sf},%
           nameformat={\zihao{4}\sf},beforeskip={1.2em},afterskip={1.8em}]{chapter}
\CTEXsetup[format={\sf\zihao{4}}]{section}
\CTEXsetup[format={\sf\zihao{4}}]{subsection}
\CTEXsetup[format={\sf\zihao{4}}]{subsubsection}
\ifNJU@chapter
  \titlecontents{chapter}[4em]{\vspace{1.6em}\sf\zihao{4}}%
    {\contentslabel{4em}}{\hspace{-4em}}{\hfill\bf\contentspage}
\else
  \titlecontents{section}[1.5em]{\vspace{1.6em}\sf\zihao{4}}%
    {\contentslabel{1.5em}}{\hspace{-4em}}{\hfill\bf\contentspage}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                     中英文作者、标题等
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 年级
\def\NJU@grade{}
\newcommand{\grade}[1]{\def\NJU@grade{#1}}
% 学号
\def\NJU@sid{}
\newcommand{\sid}[1]{\def\NJU@sid{#1}}
% 姓名
\def\NJU@cauthor{}
\newcommand{\cauthor}[1]{\def\NJU@cauthor{#1}}
\def\NJU@eauthor{}
\newcommand{\eauthor}[1]{\def\NJU@eauthor{#1}}
% 标题
\def\NJU@ctitle{}
\newcommand{\ctitle}[1]{\def\NJU@ctitle{#1}}
\def\NJU@etitle{}
\newcommand{\etitle}[1]{\def\NJU@etitle{#1}}
\def\NJU@mtitle{}
\newcommand{\mtitle}[1]{\def\NJU@mtitle{#1}}
% 导师
\def\NJU@cmentor{}
\newcommand{\cmentor}[1]{\def\NJU@cmentor{#1}}
\def\NJU@ementor{}
\newcommand{\ementor}[1]{\def\NJU@ementor{#1}}
% 导师职称
\def\NJU@cmentortitle{}
\newcommand{\cmentortitle}[1]{\def\NJU@cmentortitle{#1}}
\def\NJU@ementortitle{}
\newcommand{\ementortitle}[1]{\def\NJU@ementortitle{#1}}
% 院系
\def\NJU@cdepartment{}
\newcommand{\cdepartment}[1]{\def\NJU@cdepartment{#1}}
\def\NJU@edepartment{}
\newcommand{\edepartment}[1]{\def\NJU@edepartment{#1}}
% 专业
\def\NJU@cspecialization{}
\newcommand{\cspecialization}[1]{\def\NJU@cspecialization{#1}}
\def\NJU@especialization{}
\newcommand{\especialization}[1]{\def\NJU@especialization{#1}}
% 日期
\def\NJU@cdate{}
\newcommand{\cdate}[1]{\def\NJU@cdate{#1}}
\def\NJU@edate{}
\newcommand{\edate}[1]{\def\NJU@edate{#1}}
% 关键词
\def\NJU@ckeywords{}
\newcommand{\ckeywords}[1]{\def\NJU@ckeywords{#1}}
\def\NJU@ekeywords{}
\newcommand{\ekeywords}[1]{\def\NJU@ekeywords{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                      封面  标题页及标题
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makecover}
  {\thispagestyle{empty}\pdfbookmark[0]{封面}{cover}%
  \begin{titlepage}\vspace{3em}
    \includegraphics[width=0.14\textwidth]{njulogos/njulogo.pdf}\vspace{2.6em}
    \begin{center}
      \includegraphics[width=0.5\textwidth]{njulogos/njuname.pdf}\\[2.8em]
      \zihao{1}\bf
      \ifNJU@thesis 本~~科~~毕~~业~~论~~文
      \else         本~~科~~毕~~业~~设~~计
      \fi
      \vfill
      \begin{minipage}{0.8\textwidth}
        \zihao{3}\rm\kaishu
        \begin{Description}{学生姓名}
          \item[\bf 院~~~~~~~~系] \uline{\hfill\NJU@cdepartment\hfill~}
          \item[\bf 专~~~~~~~~业] \uline{\hfill\NJU@cspecialization\hfill~}
          \item[\bf 题~~~~~~~~目] 
            \ifNJU@longtitle \uline{\NJU@ctitle\hfill~}
            \else
              \ifNJU@shorttitle \uline{\hfill\NJU@ctitle\hfill~}
              \else
                \ifNJU@manualtitle
                  \@for \NJU@mtitlen:=\NJU@mtitle \do
                    {\uline{\hfill\NJU@mtitlen\hfill~}\par}
                \fi
              \fi
            \fi
          \item[\bf 年~~~~~~~~级] \uline{\makebox[6em][c]{\NJU@grade}}
               {\bf 学  ~~~   号} \uline{\hfill\NJU@sid\hfill~}
          \item[\bf 学生姓名]      \uline{\hfill\NJU@cauthor\hfill~}
          \item[\bf 指导老师]      \uline{\makebox[6em][c]{\NJU@cmentor}}
               {\bf 职  ~~~   称}  \uline{\hfill\NJU@cmentortitle\hfill~}
          \item[\bf 提交日期]      \uline{\hfill\NJU@cdate\hfill~}
        \end{Description}
      \end{minipage}
      \vfill
    \end{center}
  \end{titlepage}\cleardoublepage}

%    Chinesetitle
\ifNJU@chapter \newcommand{\makectitle}{}
\else
  \newcommand{\makectitle}
    {\makesomething{\qquad\\[0.6em]\NJU@ctitle\\[2.6em]}}
\fi

%\newcommand{\makectitle}{\chapter*{\NJU@ctitle}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                       摘要纸环境设置
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%中文摘要纸
\newcommand{\makeckeywords}{\zihao{4}%
  \begin{Description}{关键词:}
  \item[\rm 关键词:] {\zihao{-4}\NJU@ckeywords}
  \end{Description}}

\newenvironment{cabstract}
  {\newpage\thispagestyle{empty}\pdfbookmark[0]{摘要}{cabstract}%
  \begin{center}
    \bf\zihao{-2}\uline{南京大学本科生毕业论文（设计）中文摘要}
  \end{center}
  \vspace{0.5em}\kaishu\zihao{-4}\noindent
  \begin{Description}{毕业论文题目:}
  \item[\rm\zihao{4} 毕业论文题目:]
      \ifNJU@longtitle \uline{\NJU@ctitle\hfill}
      \else
        \ifNJU@shorttitle \uline{\hfill\NJU@ctitle\hfill}
        \else
          \ifNJU@manualtitle
            \@for \NJU@mtitlen:=\NJU@mtitle \do
              {\uline{\hfill\NJU@mtitlen\hfill}\par}
          \fi
        \fi
      \fi
  \end{Description}
  \ifNJU@shortdepspe
    \makebox[18em]{%
	    \uline{\hfill\NJU@cdepartment\hfill~} {\rm\zihao{4} 院系}
	    \uline{\hfill\NJU@cspecialization\hfill~} {\rm\zihao{4} 专业}}
	    \uline{\makebox[1.8em][c]{\NJU@grade}} {\rm\zihao{4} 级}
	    {\rm\zihao{4} 本科生姓名:} \uline{\hfill{\zihao{-4}\NJU@cauthor}\hfill~}\\[0.6em]
  \else
  \uline{\hfill\NJU@cdepartment\hfill~} {\rm\zihao{4} 院系}
  \uline{\hfill\NJU@cspecialization\hfill~} {\rm\zihao{4} 专业}\\[0.6em]
  \uline{\makebox[1.8em][c]\NJU@grade} {\rm\zihao{4} 级}
  {\rm\zihao{4} 本科生姓名:} \uline{\hfill{\NJU@cauthor}\hfill~}
  \fi
  {\rm\zihao{4} 指导教师（姓名、职称）:} 
  \uline{\hfill\NJU@cmentor\ \NJU@cmentortitle\hfill~}\\[0.6em]
  {\rm\zihao{4} 摘要:} 

  }
  {\par\kaishu\makeckeywords\newpage\cleardoublepage}

\newcommand{\makeekeywords}{\zihao{4}%
  \begin{Description}{KEY WORDS:}
    \item[\bf KEY WORDS:] \zihao{-4}\NJU@ekeywords
  \end{Description}}

%英文摘要纸
\newenvironment{eabstract}
  {\newpage\thispagestyle{empty}\pdfbookmark[0]{ABSTRACT}{eabstract}%
  \begin{center}
    \bf\zihao{-2}\uline{南京大学本科生毕业论文（设计）英文摘要}
  \end{center}
  \vspace{0.5em}\zihao{4}\noindent
  \begin{Description}{THESIS:}
  \item[\bf THESIS:] {\zihao{-4}\NJU@etitle} 
  \item[\bf DEPARTMENT:] {\zihao{-4}\NJU@edepartment}
  \item[\bf SPECIALIZATION:] {\zihao{-4}\NJU@especialization}
  \item[\bf UNDERGRADUATE:] {\zihao{-4}\NJU@eauthor}
  \item[\bf MENTOR:] {\zihao{-4}\NJU@ementortitle\ \NJU@ementor}
  \item[\bf ABSTRACT:]
  \end{Description}
  
  \zihao{-4}}
  {\par\makeekeywords\newpage\cleardoublepage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                             其他
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置页眉页脚
\ifNJU@pageheader
  \pagestyle{fancy}
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \ifNJU@oneside
    \fancyhead[L]{南京大学本科毕业论文（设计）}
    \fancyhead[R]{\leftmark}
  \else
    \fancyhead[EC]{南京大学本科毕业论文（设计）}
    \fancyhead[OC]{\leftmark}
  \fi
\else \pagestyle{plain}
\fi

% pdf相关属性设置 设置行距
\AtBeginDocument{
\hypersetup{pdftitle={\NJU@ctitle/\NJU@etitle},
            pdfauthor={\NJU@cauthor/\NJU@eauthor},
            pdfsubject={南京大学本科毕业论文（设计）}, 
            pdfkeywords={\NJU@ckeywords/\NJU@ekeywords}}
\setlength{\baselineskip}{1.26\baselineskip}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                           常用命令
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\diff}{\mathrm{d}} %微分号
%\newcommand{\scite}[1]{\ensuremath{^{\text{\cite{#1}}}}} %文献引用 右上角
\newcommand{\scite}[1]{\textsuperscript{\cite{#1}}} %文献引用 右上角
\newcommand{\unit}[1]{\ensuremath{\,\mathrm{#1}}} %单位格式

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                         Change Log
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1.6
% 修复了引用连续参考文献的连字符问题
% 国家标准的参考文献排版风格
%
% 1.5
% 修复了 nochapter 时无法双面打印的问题
%
% 1.4
% 优化了部分代码
%
% 1.3
% 新增了可以手动控制换行的标题排版方案
% 修正了正文中的一些错误
%
% 1.2
% ！ 封面毕业设计和毕业论文
% 可以选择是否是否支持 \chapter
% 页眉可随单双面打印自动调整样式
%
% 1.1
% 利用延迟命令将 pdf 属性设置移入宏包内
% 利用延迟命令将行距设置移入宏包内
% 更新了图表标题字体
% 开启中文斜体
% 可选择数学字体 默认 mathptmx txfonts
% 设置等宽字体 Courier New
% 增加页眉选项
%
% 更新了宏包 1.0 的发布日期

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                         Todo List
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
