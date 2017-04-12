-- Theme
if not CURSES then 
    ui.set_theme('base16-solarized-dark', 
    {font = 'Inconsolata', fontsize = 12}) 
end

-- Snippets
require("snippets/snippets")
