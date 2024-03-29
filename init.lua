---------------------------------
-- Theme and Buffer Settings   --
---------------------------------
buffer.use_tabs = false
buffer.tab_width = 4
buffer.wrap_mode = buffer.WRAP_WORD
buffer.edge_column = 79
buffer.edge_mode = buffer.EDGE_LINE

if CURSES then  
    view:set_theme('jabbo-term')
end

-- Theme
if not CURSES then 
    view:set_theme('base16-solarized-dark',
    --{fontsize = 13}
    --{font = 'Inconsolata', fontsize = 14}
    --{font = 'Monaco', fontsize = 12}
    {font = 'Noto Mono', fontsize = 12}
    --{font = 'Comic Mono', fontsize = 12}
    --{font = 'Atari ST 8x16 System Font', fontsize = 16}
    --{font = 'Ubuntu Mono', fontsize = 14}
    --{font = 'Roboto Mono', fontsize = 12}
    )
    buffer.edgea_colour = buffer.property_int["color.base0A"]
    buffer.zoom = 2
end

-- Stop the message buffer jumping to the foreground, if it's already open
textadept.run.run_in_background = true

---------------------------------------------
--  ta-zettels-ng                          --
---------------------------------------------
if not CURSES then
    local zettels = require('ta-zettels-ng')
    zettels.enable(os.getenv("HOME") .. '/.config/zettels/zettels.cfg')
end

---------------------------------------------------
--      Programming Languages                    --
---------------------------------------------------

--------------------
--    ta-rust     --  
--------------------
--_RACER   = false
--_RUSTFMT = false

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

---------------------------
-- General Editing stuff --
---------------------------

-- Spellcheck
if not CURSES then
    require('spellcheck')
end

-- Snippets
require("snippets/snippets")

