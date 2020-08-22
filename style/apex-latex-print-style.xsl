<?xml version='1.0'?> <!-- As XML file -->
<!-- This file is adapted from the book                                      -->
<!--                                                                    -->
<!--                 Sound Writing                                      -->
<!--                                                                    -->
<!-- Copyright (C) 2017-2019 by                                         -->
<!-- Cody Chun, Kieran O'Neil, Kylie Young, Julie Nelson Christoph      -->
<!--                                                                    -->
<!-- Creative Commons Attribution-ShareAlike 4.0 International License  -->
<!--                                                                    -->
<!-- Source:  https://github.com/UPS-CWLT/soundwriting                  -->
<!--                                                                    -->

<!-- Edited by Sean Fitzpatrick, August 2020                            -->

<!--NB: move this file from APEXCalculusPTX/style to mathbook/user !!!  -->

<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities SYSTEM "../xsl/entities.ent">
    %entities;
]>

<!-- Identify as a stylesheet -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Place ups-writers-latex-styled.xsl file into  mathbook/user -->
<!-- Assumes next file can be found in mathbook/user, so it must be copied there -->
<xsl:import href="../xsl/pretext-latex.xsl" />

<xsl:output method="text" />

<!-- ########## -->
<!-- Font Setup -->
<!-- ########## -->

<!-- Old Style figures for the body, but reversed to Lining many  -->
<!-- other places. "Old Style" is a lowercase style, "Lining" is  -->
<!-- a (now traditional) uppercase style.  Ornamentation for page -->
<!-- header happens to be specific Unicode characters of the same -->
<!-- font used for the text.  Relevant font table here:           -->
<!-- http://mirrors.ctan.org/fonts/libertinus-fonts/documentation/LibertinusSerif-Regular-Table.pdf -->
<xsl:template name="font-xelatex-main">
    <xsl:text>%% XeLaTeX font configuration from PreTeXt Guide style&#xa;</xsl:text>
    <xsl:text>%% We rely on a font installed at the system level,&#xa;</xsl:text>
    <xsl:text>%% so that we can exercise specific font features&#xa;</xsl:text>
    <xsl:text>%%&#xa;</xsl:text>
    <xsl:call-template name="xelatex-font-check">
        <xsl:with-param name="font-name" select="'Carlito-Regular'"/>
    </xsl:call-template>
    <xsl:text>\setmainfont{Carlito-Regular}[Numbers=OldStyle]&#xa;</xsl:text>
</xsl:template>

<!-- <xsl:template name="font-xelatex-style">
    <xsl:call-template name="xelatex-font-check">
        <xsl:with-param name="font-name" select="'Carlito-Regular'"/>
    </xsl:call-template>
    <xsl:text>\newfontfamily{\divisionfont}{Carlito-Regular}[Numbers=Lining]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\contentsfont}{Carlito-Regular}[Numbers=Lining]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\pagefont}{Carlito-Regular}[Numbers=Lining]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\blocktitlefont}{Carlito-Regular}[Numbers=Lining]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\tabularfont}{Carlito-Regular}[Numbers={Monospaced,Lining}]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\xreffont}{Carlito-Regular}[Numbers=Lining]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\titlepagefont}{Carlito-Regular}[Numbers=Lining]&#xa;</xsl:text>
    <xsl:text>\newfontfamily{\ornamental}{Carlito-Regular}&#xa;</xsl:text>
</xsl:template> -->



<!-- ################# -->
<!-- Division Headings -->
<!-- ################# -->

<!-- Default LaTeX style, retaining \divisionfont defined above   -->
<!-- But all division headings are in maroon color, defined above -->

<xsl:template name="titlesec-chapter-style">
    <xsl:text>\titleformat{\chapter}[display]&#xa;</xsl:text>
    <xsl:text>{\divisionfont\huge\bfseries}{\divisionnameptx\space\thechapter}{20pt}{\Huge#1}&#xa;</xsl:text>
    <xsl:text>[{\Large\authorsptx}]&#xa;</xsl:text>
    <xsl:text>\titleformat{name=\chapter,numberless}[display]&#xa;</xsl:text>
    <xsl:text>{\divisionfont\huge\bfseries}{}{0pt}{#1}&#xa;</xsl:text>
    <xsl:text>[{\Large\authorsptx}]&#xa;</xsl:text>
    <xsl:text>\titlespacing*{\chapter}{0pt}{50pt}{40pt}&#xa;</xsl:text>
</xsl:template>

<!-- Horizontal rule before, plus line break          -->
<!-- Section 4.1(1ex)(title)                          -->
<!-- Horizontal rule after, but lifted                -->
<!-- Spacing after is default, likely needs reduction -->
<!-- No change to unnumbered version                  -->
<!-- N.B. Protect optional argument inside optional   -->
<!-- argument with a defensive TeX group, {}          -->

<xsl:template name="titlesec-section-style">
    <xsl:text>\titleformat{\section}[block]&#xa;</xsl:text>
    <xsl:text>{\divisionfont\Large\bfseries\hrulefill\\}{\divisionnameptx\space\thesection}{1ex}{#1}&#xa;</xsl:text>
    <xsl:text>[{\rule[0.8\baselineskip]{\textwidth}{0.5pt}}]&#xa;</xsl:text>
    <xsl:text>\titleformat{name=\section,numberless}[block]&#xa;</xsl:text>
    <xsl:text>{\divisionfont\Large\bfseries}{}{0pt}{#1}&#xa;</xsl:text>
    <xsl:text>[{\large\authorsptx}]&#xa;</xsl:text>
    <xsl:text>\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}&#xa;</xsl:text>
</xsl:template>

<!-- "subsection" are much like "section", except -->
<!--   * no rule before                           -->
<!--   * no "Subsection" string                   -->
<!--   * 90% width rule below, flush left         -->
<xsl:template name="titlesec-subsection-style">
    <xsl:text>\titleformat{\subsection}[block]&#xa;</xsl:text>
    <xsl:text>{\divisionfont\large\bfseries}{\thesubsection}{1ex}{#1}&#xa;</xsl:text>
    <xsl:text>[{\rule[0.8\baselineskip]{0.9\textwidth}{0.5pt}}]&#xa;</xsl:text>
    <xsl:text>\titleformat{name=\subsection,numberless}[block]&#xa;</xsl:text>
    <xsl:text>{\normalfont\large\bfseries}{}{0pt}{#1}&#xa;</xsl:text>
    <xsl:text>[{\normalsize\authorsptx}]&#xa;</xsl:text>
    <xsl:text>\titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}&#xa;</xsl:text>
</xsl:template>

 <!-- subsubsections are not numbered, so are -->
 <!-- plain, just a font change from defaults -->

 <xsl:template name="titlesec-subsubsection-style">
    <xsl:text>\titleformat{\subsubsection}[hang]&#xa;</xsl:text>
    <xsl:text>{\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{#1}&#xa;</xsl:text>
    <xsl:text>[{\small\authorsptx}]&#xa;</xsl:text>
    <xsl:text>\titleformat{name=\subsubsection,numberless}[block]&#xa;</xsl:text>
    <xsl:text>{\divisionfont\normalsize\bfseries}{}{0pt}{#1}&#xa;</xsl:text>
    <xsl:text>[{\normalsize\authorsptx}]&#xa;</xsl:text>
    <xsl:text>\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}&#xa;</xsl:text>
</xsl:template>

<!-- ############ -->
<!-- Page Headers -->
<!-- ############ -->

<!-- Every page is "odd" in electronic version   -->
<!-- so no optional arguments for "even" pages   -->
<!-- Section (number)   (title)    (page-number) -->
<!-- NB: The "plain" style is used for the first -->
<!-- page of chapters, etc, so needs to have the -->
<!-- number styled the same.                     -->
<!-- NB: the \ifthechapter conditional stops a   -->
<!-- "Chapter 0" appearing in the front matter   -->
<!-- NB: titlesec (not titleps) provides         -->
<!-- \chaptertitlename so that the LaTeX         -->
<!-- \chaptername and \appendixname (which       -->
<!-- we internationalize) are used in the        -->
<!-- right places                                -->
<!-- N.B. Does this match the default now w/ \pagefont? -->

<!-- <xsl:template match="book" mode="titleps-style">
    <xsl:text>%% Page style configuration for Sound Writing&#xa;</xsl:text>
    <xsl:text>%% Supports one-sided and two-sided printing&#xa;</xsl:text>
    <xsl:text>%%&#xa;</xsl:text>
    <xsl:text>%% Ensure plain pages have the same font for page numbers&#xa;</xsl:text>
    <xsl:text>\renewpagestyle{plain}{%&#xa;</xsl:text>
    <xsl:text>\setfoot{}{\pagefont\thepage}{}%&#xa;</xsl:text>
    <xsl:text>}%&#xa;</xsl:text>
    <xsl:text>%% Page heading, generally&#xa;</xsl:text>
    <xsl:text>\renewpagestyle{headings}{%&#xa;</xsl:text>
    <xsl:text>\pagefont\headrule%&#xa;</xsl:text>
    <xsl:text>\sethead%&#xa;</xsl:text>
    <xsl:text>[\pagefont\thepage]%&#xa;</xsl:text>
    <xsl:text>[{\pagefont\space\chaptertitle\space}]%&#xa;</xsl:text>
    <xsl:text>[\ifthechapter{\pagefont Chapter \thechapter}{}]%&#xa;</xsl:text>
    <xsl:text>{\ifthesection{\pagefont\thesection}{}}%&#xa;</xsl:text>
    <xsl:text>{{\pagefont\space\ifthesection{\sectiontitle}{}\space}}%&#xa;</xsl:text>
    <xsl:text>{\pagefont\thepage}%&#xa;</xsl:text>
    <xsl:text>}%&#xa;</xsl:text>
    <xsl:text>%% Set default document headings&#xa;</xsl:text>
    <xsl:text>\pagestyle{headings}&#xa;</xsl:text>
</xsl:template> -->


<!-- ############## -->
<!-- Styling Blocks -->
<!-- ############## -->


<xsl:template match="list" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=white, colframe=black, colback=white, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template>



<xsl:template match="insight" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=white, colframe=black, colback=white, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template>

<xsl:template match="&DEFINITION-LIKE;" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=white, colframe=black, colback=white, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template>

<xsl:template match="&THEOREM-LIKE;" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=white, colframe=black, colback=white, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template>

<!-- "assemblage" -->
<!-- Boxed title -->
<xsl:template match="assemblage" mode="tcb-style">
    <xsl:text>enhanced, arc=2ex, colback=white, colframe=black,&#xa;</xsl:text>
    <xsl:text>colbacktitle=white, coltitle=black, boxed title style={sharp corners, frame hidden},&#xa;</xsl:text>
    <xsl:text>fonttitle=\bfseries, attach boxed title to top left={xshift=4mm,yshift=-3mm}, top=3mm,&#xa;</xsl:text>
</xsl:template>

<!-- ASIDE-LIKE: "aside", "historical", "biographical" -->
<!-- Square, drop shadow                               -->
<xsl:template match="&ASIDE-LIKE;" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colbacktitle=white, colframe=black, colback=black!20!white, coltitle=black, titlerule=-0.3pt,</xsl:text>
</xsl:template>

<xsl:template match="example" mode="tcb-style">
    <xsl:text>fonttitle=\normalfont\bfseries, colback=white, colframe=black, colbacktitle=white, coltitle=black,
      enhanced,
      breakable,
      frame hidden,
      overlay unbroken={
          \draw[thick] ([yshift=-2ex]frame.north west)--(frame.south west)--([xshift=4ex]frame.south west);
      },
      overlay first={
          \draw[thick] ([yshift=-2ex]frame.north west)--(frame.south west);
      },
      overlay middle={
          \draw[thick] ([yshift=-2ex]frame.north west)--(frame.south west);
      },
      overlay last={
          \draw[thick] ([yshift=-2ex]frame.north west)--(frame.south west)--([xshift=4ex]frame.south west);
      },
    </xsl:text>
</xsl:template>
<!-- turn off hints, answers, and solutions for divisional exercises -->
<xsl:param name="exercise.divisional.hint" select="'no'"/>
<xsl:param name="exercise.divisional.answer" select="'no'"/>
<xsl:param name="exercise.divisional.solution" select="'no'"/>

<!-- print options -->
<xsl:param name="latex.print" select="'yes'"/>
<xsl:param name="latex.pageref" select="'yes'"/>
<xsl:param name="latex.sides" select="'two'"/>
<!-- ragged right text alignment for accessibility -->
<xsl:param name="text.alignment" select="'raggedright'"/>

<!-- use original APEX geometry definitions -->
<xsl:param name="latex.geometry" select="'papersize={8.5in,11in},inner=1in,textheight=9in,textwidth=320pt,marginparwidth=150pt,marginparsep=32pt'"/>

<!-- apply exercise geometry -->
<xsl:template match="exercises|solutions[not(parent::backmatter)]|reading-questions|glossary|references|worksheet" mode="latex-division-heading">
    <!-- Inspect parent (part through subsubsection)  -->
    <!-- to determine one of two models of a division -->
    <!-- NB: return values are 'true' and empty       -->
    <xsl:variable name="is-structured">
        <xsl:apply-templates select="parent::*" mode="is-structured-division"/>
    </xsl:variable>
    <xsl:variable name="b-is-structured" select="$is-structured = 'true'"/>

    <xsl:if test="self::exercises">
        <!-- \newgeometry includes a \clearpage -->
        <xsl:apply-templates select="." mode="new-geometry"/>
    </xsl:if>
    <xsl:text>\begin{</xsl:text>
    <xsl:apply-templates select="." mode="division-environment-name" />
    <xsl:if test="not($b-is-structured)">
        <xsl:text>-numberless</xsl:text>
    </xsl:if>
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="." mode="title-full"/>
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <!-- subtitle here -->
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="." mode="title-short"/>
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <!-- author here -->
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <!-- subtitle here -->
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="." mode="latex-id" />
    <xsl:text>}</xsl:text>
    <xsl:text>&#xa;</xsl:text>
</xsl:template>


<!-- define exercise geometry -->
<xsl:template match="exercises" mode="new-geometry">
    <xsl:text>\newgeometry{</xsl:text>
    <xsl:text>inner=72pt</xsl:text>
    <xsl:text>, outer=72pt</xsl:text>
    <xsl:text>, textheight=9.25in</xsl:text>
    <xsl:text>, tmargin=.75in</xsl:text>
    <xsl:text>, marginparwidth=150pt</xsl:text>
    <xsl:text>, marginparsep=32pt</xsl:text>
    <xsl:text>}&#xa;</xsl:text>
</xsl:template>

<!-- restore geometry for next section -->


<xsl:template match="exercises" mode="latex-division-footing">
    <!-- Inspect parent (part through subsubsection)  -->
    <!-- to determine one of two models of a division -->
    <!-- NB: return values are 'true' and empty       -->
    <xsl:variable name="is-structured">
        <xsl:apply-templates select="parent::*" mode="is-structured-division"/>
    </xsl:variable>
    <xsl:variable name="b-is-structured" select="$is-structured = 'true'"/>

    <xsl:text>\end{</xsl:text>
    <xsl:apply-templates select="." mode="division-environment-name" />
    <xsl:text>}&#xa;</xsl:text>
    <xsl:if test="self::exercises">
        <!-- \restoregeometry includes a \clearpage -->
        <xsl:text>\restoregeometry&#xa;</xsl:text>
    </xsl:if>
</xsl:template>


<!-- uncommenting these will omit videos -->
    <xsl:template match="video[starts-with(@xml:id, 'vid')]" />
    <!-- use next line if videos also omitted in html -->
    <xsl:template match="figure[starts-with(@xml:id, 'vid')]" />
    <!-- use this instead if videos included in html  **don't use both!!** -->
    <!-- <xsl:template match="figure[starts-with(@xml:id, 'vid')]">
      <xsl:text>\stepcounter{cthm}&#xa;&#xa;</xsl:text>
    </xsl:template> -->
    <xsl:template match="p[starts-with(@xml:id, 'vidint')]" />
    <xsl:template match="aside[starts-with(@xml:id, 'vidnote')]" />
</xsl:stylesheet>
