-- Snippets
--[[
Textadept stores its built-in snippets in the global variable "snippets".
I don't want to erase those. Instead I want to _add_ to them, overwriting 
defaults where necessary.
--]]

-- a function to insert user defined snippets into the global snippets
function merge_snippets(global_snippets, user_snippets)
    for k,v in pairs(user_snippets) do 
        global_snippets[k] = v 
    end
end

-- Fields for dynamic snippets
require("snippets/dynamic-snippets")

--- # General Snippets
usersnippets = {
    ['file'] = '%<buffer.filename>',

-- Specific stuff I frequently use in my German academic texts    
    ['beh']     = 'Behindertenpädagogik',
    ['FAB']     = 'Fachkraft zur Arbeits- und Berufsförderung',
    ['FABs']    = 'Fachkräfte zur Arbeits- und Berufsförderung',
    ['FFK']     = 'Fähigkeiten, Fertigkeiten, Kenntnisse',
    ['SQ']      = 'Schlüsselqualifikation',
    ['HO']      = 'Handlungsorientierung',
    ['ho']      = 'handlungsorientiert',
    ['Reha']    = 'Rehabilitation',
    ['anfuu']   = '„',
    ['anfuo']   = '“',
    ['mmb']     = 'Menschen mit Behinderung',
    ['mml']     = 'Menschen mit Lernschwierigkeiten',
    ['sozr']    = 'sozialraumorientiert',
    ['Sozr']    = 'Sozialraumorientierung',
}

-- Add user defined snippets to the preconfigured ones, overwriting, if 
-- necessary
merge_snippets(snippets, usersnippets)

--- # Markdown Snippets
snippets.markdown = {
-- Headers.
  ['1'] = '# ',
  ['2'] = '## ',
  ['3'] = '### ',
  ['4'] = '#### ',
  ['5'] = '##### ',
  ['6'] = '###### ',

--Links

  link = '[%1(Link)](%2(http://example.net/))',
--Clickable link.
	clink = '<%1(http://example.com/)>',
--Reference-style link.
  rlink = '[%1(example)][%2(ref)]',
  id = '[%1(ref)]: %2(http://example.com/)',

-- Code.
	c = '`%0`',
-- Codeblock
	cb = '```%0\n```',
-- Image.
	i = '![%1(Alt text)](%2(/path/to/img.jpg "Optional title"))',
}



--- # LaTeX Snippets
snippets.latex = {
-- Sections etc.
    ['chap']        = '\\chapter{%1(title)}\\label{chap:%2(label)}',
    ['sec']         = '\\section{%1(title)}\\label{sec:%2(label)}',
    ['sub']         = '\\subsection{%1(title)}\\label{subsec:%2(label)}',
    ['subsub']      = '\\subsubsection{%1(title)}\\label{subsubsec:%2(label)}',
    ['par']         = '\\paragraph{%1(title)} ~\\',
    -- starred variants
    ['chaps']        = '\\chapter*{%1(title)}\\label{chap:%2(label)}',
    ['secs']         = '\\section*{%1(title)}\\label{sec:%2(label)}',
    ['subs']         = '\\subsection*{%1(title)}\\label{subsec:%2(label)}',
    ['subsubs']      = '\\subsubsection*{%1(title)}\\label{subsubsec:%2(label)}',
    ['pars']         = '\\paragraph*{%1(title)} ~\\',
-- Environments
    --- first, generics
    ['begin']       = '\\begin{%1(type)}\n\t%3( )\n\\end{%2(type)}\n%4( )',
    ['item']        = '\\item %0',
    ['desitem']     = '\\item[%1(des)] %2(item)',
    ['ditem']       = '\\item[%1(des)] %2(item)',
    --- next, the classics
    ['itemize']     = '\\begin{itemize}\n\t\\item %1(item)\n\\end{itemize}\n%2( )',
    ['enum']        = '\\begin{enumerate}\n\t\\item %1(item)\n\\end{enumerate}\n%2( )',
    ['enumerate']   = '\\begin{enumerate}\n\t\\item %1(item)\n\\end{enumerate}\n%2( )',
    ['description'] = '\\begin{description}\n\t\\item[%1(des)] %2(item)\n\\end{description}\n%3( )',
    ['des']         = '\\begin{description}\n\t\\item[%1(des)] %2(item)\n\\end{description}\n%3( )',
    ['desindent']   = '\\begin{itemize}[style=multiline,leftmargin=2.5cm,font=\\normalfont]\n\t\\item[%1(des)] %2(item)\n\\end{itemize}\n%3( )',
    ['frame']       = '\\begin{frame}\n\t\\item %1( )\n\\end{frame}\n%2( )',
    --- skeleton of my most frequently used table
    ['table']       = '\\begin{table}[hb]\n\t\\begin{tabularx}{\\textwidth}{|l|X|}\n\t\\hline\n\t\\rowcolor{lightgray}\n\t%1(Header Column1) & %2(Header Column2)\\\\ \\hline\n\t%5(Row1Col1)& %6(Row1Col2)\\\\ \\hline\n\t%7(Row2Col1) & %8(Row2Col2)\\\\ \\hline\n\t\\end{tabularx}\n\t\\caption {%3(Caption)}\n\t\\label{tab:%4(label)}\n\\end{table}',
    -- Figure
    ['fig']         = '\\begin{figure}[h]\n\t\\centering\n\t\\includegraphics[width=\\textwidth]{%1(file)}\n\t\\caption{%2(caption)}\n\t\\label{fig:%3(label)}\n\\end{figure}\n',
    ['abb']         = '\\begin{figure}[h]\n\t\\centering\n\t\\includegraphics[width=\\textwidth]{%1(file)}\n\t\\caption{%2(caption)}\n\t\\label{fig:%3(label)}\n\\end{figure}\n',
-- Arrows
    ['uparrow']     = '$\\uparrow $',
    ['Uparrow']     = '$\\Uparrow $',
    ['downarrow']   = '$\\downarrow $',
    ['Downarrow']   = '$\\Downarrow $',
    ['rightarrow']  = '$\\rightarrow $',
    ['Rightarrow']  = '$\\Rightarrow $',
    ['leftarrow']   = '$\\leftarrow $',
    ['Leftarrow']   = '$\\Leftarrow $',
-- In-Document References
    ['ref']         = '\\ref{%0}',
    ['page']        = '\\pageref{%0}',
    ['name']        = '\\nameref{%0}',
-- Quoting, using csquotes
    ['enq']         = '\\enquote{%0}',
    --- blockquotes
    ['zit']         = '\\begin{quote}\n\t\\enquote{%1(Quote)}\n\t\\parencite[S.\\,%3(page)]{%2(source)}\n\\end{quote}',
    --- blockquotes for laws
    ['rzit']        = '\\begin{quote}\n\t\\enquote{%1(Quote)}\n\t(§\\,%2(source))\n\\citereset{}\n\\end{quote}',
-- Biblatex citation commands
    --- \cite [ prenote ][ postnote ]{ key }
    ['citepre']     = '\\cite[%3(prenote)][S.\\,%2(page){%1(source)}',
    --- \cite [ postnote ]{ key }
    ['cite']        = '\\cite[S.\\,%2(page)]{%1(source)}',
    
    --- \parencite [ prenote ][ postnote ]{ key }
    ['parencitepre']     = '\\parencite[%3(prenote)][S.\\,%2(page){%1(source)}',
    --- \parencite [ postnote ]{ key }
    ['parencite']        = '\\parencite[S.\\,%2(page)]{%1(source)}',
    
    --- \textcite [ prenote ][ postnote ]{ key }
    ['textcitepre']     = '\\textcite[%3(prenote)][S.\\,%2(page){%1(source)}',
    --- \parencite [ postnote ]{ key }
    ['textcite']        = '\\textcite[S.\\,%2(page)]{%1(source)}',   
    
    --- \citeauthor{key}
    ['aut']             = '\\citeauthor{%0}',
    --- aut as a dynamic snippet
    ['daut']            = '\\citeauthor{' .. dynsn.fields.current_author .. '}',
    --- \citetitle{key}
    ['citetitle']       = '\\citetitle{%0}',
    --- \citetitle* [ prenote ][ postnote ]{ key }
    ['citefulltitle']   = '\\citetitle*{%0}',
    ['citetitle*']      = '\\citetitle*{%0}',
    --- \citeyear [ prenote ][ postnote ]{ key }
    ['citeyear']        = '\\citeyear{%0}',
    --- \fullcite{ key}
    ['fullcite']        = '\\fullcite{%0}',
    --- \citereset{}
    ['citereset']       = '\\citereset{}',
    ['cr']              = '\\citereset{}',
-- Some abbreviations frequently used in German academia
    ['oä']              = 'o.\\,ä. ',
    ['uä']              = 'u.\\,ä. ',
    ['ua']              = 'u.\\,a. ',
    ['va']              = 'v.\\,a. ',
    ['zb']              = 'z.\\,B. ',
    ['dh']              = 'd.\\,h. ',
    ['uu']              = 'u.\\,U. ',
    ['me']              = 'm.\\,E. ',
    ['mE']              = 'm.\\,E. ',
    --- one of them usually followed by a citation.
    ['vgl']             = '(vgl. \\cite[S.\\,%2(page)]{%1(source)})',

-- Misc
    ['emph']            = '\\emph{%0}',
    ['bs']              = '\\bigskip{}',
    ['fn']              = '\\footnote{%0}',
    ['ma']              = '\\marginpar{%0}',
    ['rn']              = '\\marginpar{%0}',
    -- a Comment Box I use in my excerpts
    ['anm']             = '\\begin{mdframed}[backgroundcolor=gray!20,roundcorner=8pt]\n\t\\textbf{Anm. ' .. dynsn.fields.user_initials .. ':} %0\n\\end{mdframed}',
    -- current_author ist defined in dynamic snippets. It's usually a bibtex key
    ['ca']      = dynsn.fields.current_author,
}
