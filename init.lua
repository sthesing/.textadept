-- Theme
if not CURSES then 
    ui.set_theme('base16-solarized-dark', 
    {font = 'Inconsolata', fontsize = 12}) 
end

-- Snippets
require("snippets/snippets")

-- Elastic Tabstops
require('elastic_tabstops').enable()

-- Textadept's yaml module
yaml = require "yaml"

-- Or just the lyaml contained in there
--lyaml = require "yaml.lyaml"

-- Zettels
if not CURSES then
    local zettels = require('zettels')
    zettels.enable(os.getenv("HOME") .. 'space/Dokumente/Wissenschaft/zettelkasten', os.getenv("HOME") .. "/.config/Zettels/index.yaml")
    
    keys['az'] = {
        t = function() zettels.search_zettel('Title') end,
        f = function() zettels.search_zettel('File') end,
        a = function() zettels.search_zettel('Tags') end,
    }
end

-- Keyboard Chains
keys['c2'] = {
    -- German Quotation marks
    up = function() buffer.add_text("“") end,
    down = function() buffer.add_text("„") end
}

--------------------
--    ta-rust     --  
--------------------
_RACER   = true
_RUSTFMT = true

-----------------------
-- Language settings --
-----------------------

-- Makefiles
events.connect(events.LEXER_LOADED, function(lexer)
  if lexer == 'makefile' then
    buffer.use_tabs = true
    buffer.view_ws = buffer.WS_VISIBLEONLYININDENT
  end
end)

-- Python
events.connect(events.LEXER_LOADED, function(lexer)
  if lexer == 'python' then
    buffer.use_tabs = false
    buffer.tab_width = 4
    buffer.view_ws = buffer.WS_VISIBLEONLYININDENT
  end
end)
