---------------------------------
-- Theme and Buffer Settings   --
---------------------------------
if CURSES then
    buffer:set_theme('term')
    --buffer.caret_line_back = 0xff0000
    buffer.caret_line_back = buffer.property['color.light_black']
    buffer.caret_line_visible = true
    buffer.edge_colour = 0x00FFFF
    --buffer.edge_colour = buffer.property['color.light_blue']
end

if not CURSES then 
    buffer:set_theme('base16-solarized-dark',
    --{fontsize = 13}
    --{font = 'Inconsolata', fontsize = 14}
    --{font = 'Monaco', fontsize = 12}
    {font = 'Noto Mono', fontsize = 12}
    --{font = 'Atari ST 8x16 System Font', fontsize = 14}
    --{font = 'Ubuntu Mono', fontsize = 14}
    --{font = 'Roboto Mono', fontsize = 12}
    )
    buffer.edge_colour = buffer.property_int["color.base0A"]
    buffer.zoom = 2
end

buffer.use_tabs = false
buffer.tab_width = 4
buffer.wrap_mode = buffer.WRAP_WORD
buffer.edge_column = 79
buffer.edge_mode = buffer.EDGE_LINE


-- Elastic Tabstops
require('elastic_tabstops').enable()

-- Textadept's yaml module
yaml = require "yaml"

-- Or just the lyaml contained in there
--lyaml = require "yaml.lyaml"

-- Zettels
---[[
if not CURSES then
    local zettels = require('zettels')
    zettels.enable(os.getenv("HOME") .. '/space/Dokumente/Wissenschaft/zettelkasten/', os.getenv("HOME") .. "/.config/Zettels/index.yaml")
    
    keys['az'] = {
        t = function() zettels.search_zettel('Title') end,
        k = function() zettels.search_zettel('Tags') end,
        n = function() zettels.search_zettel('File') end,
        f = function() zettels.search_followups(buffer.filename) end,
    }
end
--]]

--------------------
--    ta-rust     --  
--------------------
_RACER   = false
_RUSTFMT = false

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

-- Recognize .ino files as cpp code.
textadept.file_types.extensions.ino = 'cpp'
-- Recognize .toml files as TOML.
textadept.file_types.extensions.toml = 'toml'

-----------------------------------
-- Personalized compile & run commands --
-----------------------------------
-- LATEX
textadept.run.compile_commands.tex='latexmk -outdir=render -silent -xelatex "%f"'
textadept.run.run_commands.tex='xdg-open "render/%e.pdf"'

-- RUST
-- For the compile command, I use cargo's "check"-functionality instead of 
-- build. It's faster, and if I want to actually build the program, I usually
-- also want to run it.
textadept.run.compile_commands.rust='cargo check --manifest-path ../Cargo.toml'
textadept.run.run_commands.rust='cargo run --manifest-path ../Cargo.toml'

-- Snippets
require("snippets/snippets")
