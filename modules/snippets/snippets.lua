-- Snippets
--[[
Textadept stores its built-in snippets in the global variable "snippets".
I don't want to erase those. Instead I want to _add_ to them, overwriting 
defaults where necessary.

Also here (scroll down): Key Chains
--]]

-- a function to insert user defined snippets into the global snippets
function merge_snippets(global_snippets, user_snippets)
    for k,v in pairs(user_snippets) do 
        global_snippets[k] = v 
    end
end

-- Fields for dynamic snippets
require("snippets/dynamic-snippets")

--- ##########################################################################
--- # General Snippets
--- ##########################################################################
usersnippets = {
    ['file'] = '%<buffer.filename>',
    ['projdir'] = '%<io.get_project_root()>', -- Project dir
    ['today'] = os.date("%Y-%m-%d", os.time()),

    -- A snippet to speed up the notation of snippets (Mind. Blown.)
    ['sn']      = '[\'%1(trigger)\']\t\t= \'%2(expanded)\',\n%0',
    ['fence']   = '-- ' .. string.rep('#', 75),
    ['ldots']   = '…',
    ['...']     = '…',
    ['commit']  = '%1(type)(%2(scope)): %3(subject)\n\n%4(body)\n\n%0(footer)',

    
-- Specific stuff I frequently use in my German academic texts    
    ['beh']     = 'Behindertenpädagogik',
    ['FAB']     = 'Fachkraft zur Arbeits- und Berufsförderung',
    ['FABs']    = 'Fachkräfte zur Arbeits- und Berufsförderung',
    ['FFK']     = 'Fähigkeiten, Fertigkeiten, Kenntnisse',
    ['SQ']      = 'Schlüsselqualifikation',
    ['HO']      = 'Handlungsorientierung',
    ['ho']      = 'handlungsorientiert',
    ['Reha']    = 'Rehabilitation',
    ['Part']    = 'Partizipation',
    ['anfuu']   = '„%0“',
    ['anfuo']   = '“',
    ['mmb']     = 'Menschen mit Behinderung',
    ['mml']     = 'Menschen mit Lernschwierigkeiten',
    ['sozr']    = 'sozialraumorientiert',
    ['Sozr']    = 'Sozialraumorientierung',
    ['wfbm']    = 'Werkstatt für behinderte Menschen',
    ['EV']      = 'Eingangsverfahren',
    ['BBB']     = 'Berufsbildungsbereich',
    ['AB']      = 'Arbeitsbereich',
    ['Täo']     = 'Tätikeitsorientiert',
    ['täo']     = 'tätigkeitsorientiert',
    ['Apo']		= 'Arbeitsplatzorientiert',
    ['apo']		= 'arbeitsplatzorientiert',
    ['Bfo']		= 'Berufsfeldorientiert',
    ['bfo']		= 'berufsfeldorientiert',
    ['Bbo']		= 'Berufsbildorientiert',
    ['bbo']		= 'berufsbildorientiert',
    ['qg']		= 'Qualifizierung',
    ['qo']		= 'Qualifikation',
    ['sdb']      = 'sonderpädagogischer Förderbedarf',  
    ['fd']       = 'familienentlastender Dienst',
    ['zizek']    = 'Žižek',
    ['!=']       = '≠',
    ['ungefähr'] = '≈',
    ['entspricht'] = '≙',
    ['Ant']      = 'Anthropologie',
}

-- Add user defined snippets to the preconfigured ones, overwriting, if 
-- necessary
merge_snippets(snippets, usersnippets)

--- # Markdown Snippets
snippets.markdown = {
-- Headers.
  ['h1'] = '# ',
  ['h2'] = '## ',
  ['h3'] = '### ',
  ['h4'] = '#### ',
  ['h5'] = '##### ',
  ['h6'] = '###### ',

--Links
  link = '[%1(Link)](%0(http://example.net/))',
--Clickable link.
  clink = '<%0(http://example.com/)>',
--Reference-style link.
  rlink = '[%1(example)][%0(ref)]',
  id = '[%1(ref)]: %0(http://example.com/)',

-- Code.
	c = '`%0`',
-- Codeblock
	cb = '```%0\n```',
    --python
    cbp = '```{.python .numberLines}\n%0\n```',
-- Image.
	img = '![%1(Alt text)](%2(/path/to/img.jpg "Optional title"))',
-- Zettel boilerplate
    zet = "---\ntitle:  '%1(title)'\nauthor: Stefan Thesing\nkeywords: [%2(keyword)]\nfollowups: []\nlang: de\n...\n\n# %0(section1)\n\n\n[//]: # (Links)",

    
-- Changelog block
    cl = "## [Unreleased]\n### Added\n### Changed\n%0\n### Deprecated\n### Removed\n### Fixed\n### Security\n",

    ['cite'] = '[@%1(source) %2(page)]%0',
    ['zit']  = '>„%1(Quote)“\n([@%2(source) %3(page)])%0',
    ['vgl']  = '(vgl. [@%1(source) %2(page)])%0',
    
    -- Latex in Markdown (for Zettels)
    ['enq']         = '\\enquote{%1}',
    ['lcite']        = '\\cite[S.\\,%2(page)]{%1(source)}',
    ['lzit']         = '\\begin{quote}\n\t\\enquote{%1(Quote)}\n\t\\parencite[S.\\,%3(page)]{%2(source)}\n\\end{quote}',
    --- blockquotes for laws
    ['rzit']        = '\\begin{quote}\n\t\\enquote{%1(Quote)}\n\t(§\\,%2(source))\n\\citereset{}\n\\end{quote}',
    ['parencite']        = '\\parencite[S.\\,%2(page)]{%1(source)}',
    ['textcite']        = '\\textcite[S.\\,%2(page)]{%1(source)}',   
    --- \citeauthor{key}
    ['aut']             = '\\citeauthor{%0}',
    --- aut as a dynamic snippet
    ['daut']            = '\\citeauthor{' .. dynsn.fields.current_author .. '} ',
    --- \citetitle{key}
    ['citetitle']       = '\\citetitle{%0}',
    --- \citeyear [ prenote ][ postnote ]{ key }
    ['citeyear']        = '\\citeyear{%0}',
    --- \fullcite{ key}
    ['citereset']       = '\\citereset{%0}',
        --- one of them usually followed by a citation.
    ['lvgl']             = '(vgl. \\cite[S.\\,%2(page)]{%1(source)})',
        -- current_author ist defined in dynamic snippets. It's usually a bibtex key
    ['ca']      = dynsn.fields.current_author,
    -- semantic annotations; repurposing the fenced_div extenstion of pandoc
    ['ann'] = "::: {#%1(kind) note=\"%2(note)\"}\n%0(annotated-content)\n:::\n",
    ['anm'] = "::: {#%1(kind) note=\"%2(note)\"}\n%0(annotated-content)\n:::\n",
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
    ['begin']       = '\\begin{%1(type)}\n\t%3( )\n\\end{%1}\n%0',
    ['item']        = '\\item %0',
    ['desitem']     = '\\item[%1(des)] %0(item)',
    ['ditem']       = '\\item[%1(des)] %0(item)',
    --- next, the classics, with a tightlist-option (see below)
    ['itemize']     = '\\begin{itemize}%1(\\tightlist)\n\t\\item %0(item)\n\\end{itemize}\n',
    ['enum']        = '\\begin{enumerate}%1(\\tightlist)\n\t\\item %0(item)\n\\end{enumerate}\n',
    ['enumerate']   = '\\begin{enumerate}%1(\\tightlist)\n\t\\item %0(item)\n\\end{enumerate}\n',
    ['description'] = '\\begin{description}%1(\\tightlist)\n\t\\item[%2(des)] %0(item)\n\\end{description}\n',
    ['des'] = '\\begin{description}%1(\\tightlist)\n\t\\item[%2(des)] %0(item)\n\\end{description}\n',
    -- the tightlist command from pandoc, definition for the document's preamble
    ['tl']          = '\\providecommand{\\tightlist}{\\setlength{\\itemsep}{0pt}\\setlength{\\parskip}{0pt}}', 
    -- For Beamer Presentations
    ['frame']       = '\\begin{frame}{%1(title)}\n\t%0(content)\n\\end{frame}\n',
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
    ['enq']         = '\\enquote{%1}',
    --- blockquotes
    --['zit']         = '\\begin{quote}\n\t\\enquote{%1(Quote)}\n\t\\parencite[S.\\,%3(page)]{%2(source)}\n\\end{quote}',
    ['zit']         = '\\begin{quote}\n\t\\enquote{%1(Quote)}\n\t\\parencite[%3(S_wenn_f._o._Anm.)]{%2(source)}\n\\end{quote}\n',
    
    -- Springer zit    
    ['szit'] = '\\begin{quotation}\n\t%1(Quote)\n\t\\parencite[%3(S_wenn_f._o._Anm.)]{%2(source)}\n\\end{quotation}\n',
    ['vgl']             = '(vgl. \\cite[%2(S_wenn_f._o._Anm.)]{%1(source)})',
    
    ['S'] = 'S.\\,%0\\,f.',
    ['s'] = 'S.\\,%0\\,f.',
    --- blockquotes for laws
    ['rzit']        = '\\begin{quote}\n\t\\enquote{%1(Quote)}\n\t(§\\,%2(source))\n\\citereset{}\n\\end{quote}\n',
-- Biblatex citation commands
    ['cite']        = '\\cite[%2(S_wenn_f._o._Anm.)]{%1(source)}',
    ['parencite']        = '\\parencite[%2(S_wenn_f._o._Anm.)]{%1(source)}',
    ['textcite']        = '\\textcite[%2(S_wenn_f._o._Anm.)]{%1(source)}',   
    --- \citeauthor{key}
    ['aut']             = '\\citeauthor{%0}',
    --- aut as a dynamic snippet
    ['daut']            = '\\citeauthor{' .. dynsn.fields.current_author .. '} ',
    --- \citetitle{key}
    ['citetitle']       = '\\citetitle{%0}',
    --- \citetitle* [ prenote ][ postnote ]{ key }
    ['citefulltitle']   = '\\citetitle*{%0}',
    ['citetitle*']      = '\\citetitle*{%0}',
    --- \citeyear [ prenote ][ postnote ]{ key }
    ['citeyear']        = '\\citeyear{%0}',
    ['cy']        = '\\citeyear{%0}',
    --- \fullcite{ key}
    ['fullcite']        = '\\fullcite{%0}',
    --- \citereset{}
    ['citereset']       = '\\citereset{%0}',
    ['cr']              = '\\citereset{%0}',
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
    
-- Misc
    ['emph']            = '\\emph{%0}',
    ['bf']              = '\\textbf{%0}',
    ['bs']              = '\\bigskip{}',
    ['fn']              = '\\footnote{\n%%Footnote\n%0\n%%End Footnote\n}',
    ['ma']              = '\\marginpar{%0}',
    ['rn']              = '\\marginpar{%0}',
    ['secframe']        = '\\sectionframe{}\n%0',
    -- a Comment Box I use in my excerpts
    ['anm']             = '\\begin{mdframed}[backgroundcolor=gray!20,roundcorner=8pt]\n\t\\textbf{Anm. ' .. dynsn.fields.user_initials .. ':} %0\n\\end{mdframed}',
    -- a horizontal line
    ['line']            = '\\hrulefill\n%0',
    -- current_author ist defined in dynamic snippets. It's usually a bibtex key
    ['ca']      = dynsn.fields.current_author,
}

snippets.rust = {
    ['p']           = 'println!("%0");',
    ['fn']          = "fn %1(name)(%2(&self)) %3(-> %4(type) ){%0}\n// TODO test this",
    ['ttt']         = '// TODO test this',
}

--- ########################################################################
--- # Key Chains
--- ########################################################################

keys['ctrl+1'] = {
    -- Geman gendering
    g = function() buffer.add_text("\\_innen") end,
    -- vulgar fractions
    ['2'] = function() buffer.add_text("½") end,
    ['3'] = function() buffer.add_text("⅓") end,
    ['4'] = function() buffer.add_text("¼") end,
    ['5'] = function() buffer.add_text("⅕") end,
    ['6'] = function() buffer.add_text("⅙") end,
}

keys['ctrl+2'] = {
    -- German Quotation marks
    up = function() buffer.add_text("“") end,
    down = function() buffer.add_text("„") end,
    left = function() buffer.add_text("»") end,
    right = function() buffer.add_text("«") end,
    -- vulgar fractions
    ['3'] = function() buffer.add_text("⅔") end, 
}

keys['ctrl+3'] = {
    -- vulgar fractions
    ['4'] = function() buffer.add_text("¾") end,
}
